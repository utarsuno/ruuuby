
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

DROP PROCEDURE ruuuby_gem_add(text,text,text,boolean,boolean,text,text,text);
DROP PROCEDURE ruuuby_gem_update(text,text,text);
DROP PROCEDURE ruuuby_gem_remove(text,text);

DROP FUNCTION ruuuby_gem_get_id(text);
DROP FUNCTION ruuuby_gem_latest_changelog_id(text);
DROP FUNCTION ruuuby_gem_current_version(text);

COMMIT TRANSACTION;
