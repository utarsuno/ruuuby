--() { :; }; exec psql -f "$0"

-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

DROP FUNCTION IF EXISTS env_var_group_id(_group_name TEXT);
DROP FUNCTION IF EXISTS env_var_tier_id(_tier_name TEXT);
DROP PROCEDURE IF EXISTS env_var_add(_group_name TEXT, _env_var_name TEXT, _desc TEXT);

COMMIT TRANSACTION;
