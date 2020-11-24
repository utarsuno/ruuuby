--() { :; }; exec psql -f "$0"

--|    ___                         __
--|  /'___\                       /\ \__  __
--| /\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___     ____
--| \ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /',__\
--|  \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\
--|   \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\/\____/
--|    \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/___/

-- @see https://dataedo.com/kb/query/postgresql/list-user-defined-functions
CREATE OR REPLACE FUNCTION get_all_funcs ()
    RETURNS TABLE (
        function_schema    NAME,
        function_name      NAME,
        function_language  NAME,
        definition          TEXT,
        function_arguments TEXT,
        return_type        NAME
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT n.nspname AS function_schema,
               p.proname AS function_name,
               l.lanname AS function_language,
               CASE WHEN l.lanname = 'internal' THEN p.prosrc
                    ELSE pg_get_functiondef(p.oid)
                    END AS definition,
               pg_get_function_arguments(p.oid) AS function_arguments,
               t.typname AS return_type
        FROM pg_proc p
        LEFT JOIN pg_namespace n ON p.pronamespace = n.oid
        LEFT JOIN pg_language  l ON p.prolang      = l.oid
        LEFT JOIN pg_type      t ON t.oid          = p.prorettype
        WHERE n.nspname NOT IN ('pg_catalog', 'information_schema')
        ORDER BY function_schema, function_name;
END; $$ LANGUAGE plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

-- TODO: lower priority, simplify query
CREATE OR REPLACE FUNCTION does_func_exist(_func_name TEXT) RETURNS BOOLEAN AS $$
BEGIN
    RETURN (SELECT COUNT(*) FROM get_all_funcs() AS data_src WHERE data_src.function_name = _func_name LIMIT 1) > 0;
END; $$ LANGUAGE plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION does_func_schema_match(_func_name TEXT, _func_args TEXT, _func_return_type NAME) RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        SELECT COUNT(*) FROM get_all_funcs() AS f
        WHERE f.function_name = _func_name AND f.function_arguments = _func_args AND f.return_type = _func_return_type
    ) > 0;
END; $$ LANGUAGE plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

--|  __             __       ___
--| /\ \__         /\ \     /\_ \
--| \ \ ,_\    __  \ \ \____\//\ \      __    ____
--|  \ \ \/  /'__`\ \ \ '__`\ \ \ \   /'__`\ /',__\
--|   \ \ \_/\ \L\.\_\ \ \L\ \ \_\ \_/\  __//\__, `\
--|    \ \__\ \__/.\_\\ \_,__/ /\____\ \____\/\____/
--|     \/__/\/__/\/_/ \/___/  \/____/\/____/\/___/

CREATE OR REPLACE FUNCTION does_table_exist(_table_name TEXT) RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        SELECT COUNT(*) FROM get_all_table_names() AS t WHERE t.table_name = _table_name
    ) > 0;
END; $$ LANGUAGE plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_all_table_names ()
    RETURNS TABLE (
        table_name TEXT
    ) AS $$
	SELECT t.table_name FROM information_schema.tables AS t
	WHERE t.table_type = 'BASE TABLE' AND t.table_schema NOT IN ('pg_catalog', 'information_schema');
$$ LANGUAGE SQL;

-- ---------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_all_table_name_schema_pairs () RETURNS SETOF TEXT AS $$
BEGIN
	RETURN QUERY (SELECT table_schema || '.' || table_name
	FROM information_schema.tables WHERE table_type = 'BASE TABLE' AND table_schema NOT IN ('pg_catalog', 'information_schema'));
END; $$ language plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION table_size_stats(_table_name TEXT)
	RETURNS TABLE (
		table_size_data_in_bytes    BIGINT,
		table_size_indexes_in_bytes BIGINT,
		table_size_total_in_bytes   BIGINT,
		table_size_data_readable    TEXT,
		table_size_indexes_readable TEXT,
		table_size_total_readable   TEXT
	) AS $$
BEGIN
	RETURN QUERY
		SELECT
			pg_relation_size(_table_name) 						AS table_size_data_in_bytes,
			pg_indexes_size(_table_name)						AS table_size_indexes_in_bytes,
			pg_total_relation_size(_table_name) 			    AS table_size_total_in_bytes,
			pg_size_pretty(pg_relation_size(_table_name))       AS table_size_data_readable,
			pg_size_pretty(pg_indexes_size(_table_name))        AS table_size_indexes_readable,
			pg_size_pretty(pg_total_relation_size(_table_name)) AS table_size_total_readable
		;
END; $$ LANGUAGE plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION table_row_count_estimate(_table_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT reltuples as approximate_row_count FROM pg_class WHERE relname = _table_name);
END; $$ language plpgsql;

-- ---------------------------------------------------------------------------------------------------------------------

--|   __            __             __
--|  /\ \          /\ \__         /\ \
--|  \_\ \     __  \ \ ,_\    __  \ \ \____     __      ____     __    ____
--|  /'_` \  /'__`\ \ \ \/  /'__`\ \ \ '__`\  /'__`\   /',__\  /'__`\ /',__\
--| /\ \L\ \/\ \L\.\_\ \ \_/\ \L\.\_\ \ \L\ \/\ \L\.\_/\__, `\/\  __//\__, `\
--| \ \___,_\ \__/.\_\\ \__\ \__/.\_\\ \_,__/\ \__/.\_\/\____/\ \____\/\____/
--|  \/__,_ /\/__/\/_/ \/__/\/__/\/_/ \/___/  \/__/\/_/\/___/  \/____/\/___/

CREATE OR REPLACE FUNCTION db_size_stats()
	RETURNS TABLE (
		dat_name         NAME,
		db_size_bytes    BIGINT,
		db_size_readable TEXT
	) AS $$
BEGIN
	RETURN QUERY
		SELECT
			pg_database.datname                                   AS dat_name,
			pg_database_size(pg_database.datname)                 AS db_size_bytes,
			pg_size_pretty(pg_database_size(pg_database.datname)) AS db_size_readable
			FROM pg_database
		;
END; $$ LANGUAGE plpgsql;

-- @see https://serverfault.com/questions/128284/how-to-see-active-connections-and-current-activity-in-postgresql-8-4
CREATE OR REPLACE FUNCTION db_active_connections(_datname NAME)
    RETURNS TABLE (
        -- custom field added
        time_running interval,
        -- default fields and their order
        datid oid,
        datname name,
        pid integer,
        leader_pid integer,
        usesysid oid,
        usename name,
        application_name text,
        client_addr inet,
        client_hostname text,
        client_port integer,
        backend_start TIMESTAMP WITH TIME ZONE,
        xact_start TIMESTAMP WITH TIME ZONE,
        query_start TIMESTAMP WITH TIME ZONE,
        state_change TIMESTAMP WITH TIME ZONE,
        wait_event_type TEXT,
        wait_event TEXT,
        state TEXT,
        backend_xid xid,
        backend_xmin xid,
        query text,
        backend_type text
    ) AS $$
BEGIN
    RETURN QUERY
		select (CURRENT_TIMESTAMP - s.backend_start) AS time_running, *
		from pg_stat_activity AS s
		where s.datname = _datname
		ORDER BY time_running DESC;
END; $$ LANGUAGE plpgsql;

-- TODO: https://coderwall.com/p/k5yeyq/postgres-terminanting-db-connections

--|               __
--|              /\ \__                        __
--|    __   __  _\ \ ,_\    __    ___     ____/\_\    ___     ___     ____
--|  /'__`\/\ \/'\\ \ \/  /'__`\/' _ `\  /',__\/\ \  / __`\ /' _ `\  /',__\
--| /\  __/\/>  </ \ \ \_/\  __//\ \/\ \/\__, `\ \ \/\ \L\ \/\ \/\ \/\__, `\
--| \ \____\/\_/\_\ \ \__\ \____\ \_\ \_\/\____/\ \_\ \____/\ \_\ \_\/\____/
--|  \/____/\//\/_/  \/__/\/____/\/_/\/_/\/___/  \/_/\/___/  \/_/\/_/\/___/

-- @see https://www.postgresql.org/docs/9.1/sql-createextension.htmlhttps://www.postgresql.org/docs/9.1/sql-createextension.html
CREATE EXTENSION hstore;
