
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

-- TODO: https://libgit2.org/docs/guides/101-samples/
-- @see https://dataedo.com/kb/query/postgresql/list-user-defined-functions


-- get_user_funcs
CREATE OR REPLACE FUNCTION does_func_exist (_func_name TEXT) RETURNS BOOLEAN AS $$
BEGIN
    RETURN (SELECT COUNT(*) FROM get_user_funcs() AS data_src
            WHERE data_src.function_name = _func_name
            LIMIT 1) > 0;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_user_funcs ()
    RETURNS TABLE (
        function_schema NAME,
        function_name NAME,
        function_language NAME,
        definition TEXT,
        function_arguments TEXT,
        return_type NAME
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
        LEFT JOIN pg_language l ON p.prolang = l.oid
        LEFT JOIN pg_type t ON t.oid = p.prorettype
        WHERE n.nspname NOT IN ('pg_catalog', 'information_schema')
        ORDER BY function_schema, function_name;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_tag_id(_meta_data_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_tags WHERE name = _meta_data_name LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_ruuuby_resource_id(_resource_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_resources WHERE name = _resource_name LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE ruuuby_spawn_resource(_name TEXT, _tag TEXT, _content JSON, _extra_str_data TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
BEGIN
    IF get_tag_id(_tag) IS NULL THEN
        INSERT INTO ruuuby_tags (name) VALUES (_tag);
    END IF;
    IF get_ruuuby_resource_id(_name) IS NULL THEN
        INSERT INTO ruuuby_resources (name, content, extra_str_data) VALUES (_name, _content, _extra_str_data);
        INSERT INTO ruuuby_resource_tags (ruuuby_resources_id, ruuuby_tags_id) VALUES (get_ruuuby_resource_id(_name), get_tag_id(_tag));
    ELSE
        RAISE 'ruuuby resources already exists for provided name';
    END IF;
END; $$;

--END; $$ LANGUAGE plpgsql;

COMMIT TRANSACTION;
