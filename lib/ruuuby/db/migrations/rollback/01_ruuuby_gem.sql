
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

DROP PROCEDURE IF EXISTS ruuuby_gem_add(text,text,text,boolean,boolean,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_recommended(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_dev(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_prod(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_update(text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_remove(text,text);
DROP PROCEDURE IF EXISTS ruuuby_release_add(text);
DROP PROCEDURE IF EXISTS ruuuby_feature_add(text,boolean,text);
DROP PROCEDURE IF EXISTS ruuuby_feature_behavior_add(text,text,text);

DROP FUNCTION IF EXISTS ruuuby_release_gem_changelogs(text);
DROP FUNCTION IF EXISTS ruuuby_gem_get_id(text);
DROP FUNCTION IF EXISTS ruuuby_gem_latest_changelog_id(text);
DROP FUNCTION IF EXISTS ruuuby_gem_current_version(text);
DROP FUNCTION IF EXISTS ruuuby_release_get_id(text);
DROP FUNCTION IF EXISTS ruuuby_feature_get_id(text);

DROP FUNCTION does_func_exist(text);

COMMIT TRANSACTION;
