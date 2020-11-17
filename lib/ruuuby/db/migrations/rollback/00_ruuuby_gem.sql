
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
DROP PROCEDURE IF EXISTS ruuuby_release_add(text,timestamp);
DROP PROCEDURE IF EXISTS ruuuby_feature_add(_uid TEXT, _is_optional BOOLEAN, _desc_self TEXT);
DROP PROCEDURE IF EXISTS ruuuby_feature_behavior_add(text,text,text);

DROP FUNCTION IF EXISTS ruuuby_release_gem_changelogs(text);
DROP FUNCTION IF EXISTS ruuuby_active_gems();
DROP FUNCTION IF EXISTS ruuuby_gem_id(_name TEXT);
DROP FUNCTION IF EXISTS ruuuby_gem_latest_changelog_id(text);
DROP FUNCTION IF EXISTS ruuuby_gem_current_version(text);
DROP FUNCTION IF EXISTS ruuuby_release_id(_release_version TEXT);
DROP FUNCTION IF EXISTS ruuuby_feature_id(_uid TEXT);

COMMIT TRANSACTION;
