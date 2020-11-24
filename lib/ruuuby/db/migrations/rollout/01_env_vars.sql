--() { :; }; exec psql -f "$0"

-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

CREATE OR REPLACE FUNCTION env_var_group_id
    (_group_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM env_var_groups WHERE group_name = _group_name LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION env_var_tier_id
    (_tier_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM env_var_tiers WHERE the_desc = _tier_name LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE env_var_add
    (_group_name TEXT, _env_var_name TEXT, _desc TEXT) LANGUAGE plpgsql AS $$
DECLARE
    _group_id BIGINT := (SELECT env_var_group_id(_group_name));
BEGIN
    INSERT INTO env_vars (the_key, the_desc, env_var_groups_id) VALUES (_env_var_name, _desc, _group_id);
END; $$;

-- env_var_tiers_id
-- _tiers_id
--  _tiers_id BIGINT := (SELECT env_var_tier_id(_tier_name));

COMMIT TRANSACTION;
