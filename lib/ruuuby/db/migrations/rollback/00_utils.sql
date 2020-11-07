
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

--DROP FUNCTION IF EXISTS does_func_exist();

DROP FUNCTION IF EXISTS get_user_funcs();
DROP FUNCTION IF EXISTS get_ruuuby_resources(TEXT);
DROP FUNCTION IF EXISTS ruuuby_resource_add_meta_data(TEXT, TEXT);
DROP FUNCTION IF EXISTS get_ruuuby_resource_id(TEXT);
DROP FUNCTION IF EXISTS get_ruuuby_meta_data_data_id(TEXT);

COMMIT TRANSACTION;
