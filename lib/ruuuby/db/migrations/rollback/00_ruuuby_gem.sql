--() { :; }; exec psql -f "$0"

-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

--   __   ___       ___       __   ___  __
--  |__) |__  |    |__   /\  /__` |__  /__`
--  |  \ |___ |___ |___ /~~\ .__/ |___ .__/
DROP FUNCTION IF EXISTS ruuuby_release_id(_release_version TEXT);
DROP FUNCTION IF EXISTS ruuuby_release_validate_version_beta(_version_ruuuby TEXT);
DROP FUNCTION IF EXISTS ruuuby_release_validate_version_standard(_version_ruuuby TEXT);
DROP FUNCTION IF EXISTS ruuuby_release_validate_version_any(_version_ruuuby TEXT);
DROP PROCEDURE IF EXISTS ruuuby_release_syntax_err_version(_version_ruuuby TEXT);
DROP PROCEDURE IF EXISTS ruuuby_release_validate_syntax_version(_version_ruuuby TEXT);
DROP PROCEDURE IF EXISTS ruuuby_release_add(_version_ruuuby TEXT, _is_released BOOLEAN);
DROP PROCEDURE IF EXISTS ruuuby_release_prepare(_version_ruuuby TEXT);

--   ___  ___      ___       __   ___  __
--  |__  |__   /\   |  |  | |__) |__  /__`
--  |    |___ /~~\  |  \__/ |  \ |___ .__/
DROP FUNCTION IF EXISTS ruuuby_feature_id(_uid SMALLINT);
DROP PROCEDURE IF EXISTS ruuuby_feature_add(_uid SMALLINT, _is_optional BOOLEAN, _desc_self TEXT);

--   __   ___                   __   __   __
--  |__) |__  |__|  /\  \  / | /  \ |__) /__`
--  |__) |___ |  | /~~\  \/  | \__/ |  \ .__/
DROP PROCEDURE IF EXISTS ruuuby_feature_behavior_add(_uid SMALLINT,text,text);

--  __   ___        __
-- / _` |__   |\/| /__`
-- \__> |___  |  | .__/
DROP PROCEDURE IF EXISTS ruuuby_gem_add(text,text,text,boolean,boolean,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_recommended(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_dev(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_add_prod(text,text,text,text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_update(text,text,text);
DROP PROCEDURE IF EXISTS ruuuby_gem_remove(text,text);

DROP FUNCTION IF EXISTS ruuuby_release_gem_changelogs(text);
DROP FUNCTION IF EXISTS ruuuby_active_gems();
DROP FUNCTION IF EXISTS ruuuby_gem_id(_name TEXT);
DROP FUNCTION IF EXISTS ruuuby_gem_latest_changelog_id(text);
DROP FUNCTION IF EXISTS ruuuby_gem_current_version(text);

COMMIT TRANSACTION;
