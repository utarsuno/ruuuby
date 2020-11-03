
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

CREATE OR REPLACE PROCEDURE ruuuby_gem_add(_version_ruuuby TEXT, _name TEXT, _version_current TEXT, _env_dev BOOLEAN DEFAULT TRUE, _env_prod BOOLEAN DEFAULT FALSE, _ref_source TEXT DEFAULT NULL, _ref_version TEXT DEFAULT NULL, _git_url TEXT DEFAULT NULL)
LANGUAGE plpgsql AS $$
DECLARE
    gem_id BIGINT;
    val_gem_url TEXT := (SELECT 'https://rubygems.org/gems/' || _name AS result_url);
BEGIN
    INSERT INTO ruuuby_gems (name, env_dev, env_prod, ref_source, ref_version, url_gem) VALUES (_name, _env_dev, _env_prod, _ref_source, _ref_version, val_gem_url);
    SELECT ruuuby_gem_get_id(_name) INTO gem_id;
    INSERT INTO ruuuby_gem_changelogs (version_current, version_ruuuby, ruuuby_gem_id) VALUES (_version_current, _version_ruuuby, gem_id);
END $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_update(_version_ruuuby text, _name text, _version_current text)
LANGUAGE plpgsql AS $$
DECLARE
    gem_id CONSTANT BIGINT := (SELECT ruuuby_gem_get_id(_name));
BEGIN
    INSERT INTO ruuuby_gem_changelogs (version_current, version_ruuuby, ruuuby_gem_id) VALUES (_version_current, _version_ruuuby, gem_id);
END $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_remove(_version_ruuuby text, _name text)
LANGUAGE plpgsql AS $$
DECLARE
    gem_id CONSTANT BIGINT := (SELECT ruuuby_gem_get_id(_name));
BEGIN
    INSERT INTO ruuuby_gem_changelogs (version_current, version_ruuuby, ruuuby_gem_id) VALUES ('REMOVE', _version_ruuuby, gem_id);
END $$;

CREATE OR REPLACE FUNCTION ruuuby_gem_get_id(_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_gems WHERE name = _name LIMIT 1);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_gem_latest_changelog_id(_name text) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_gem_changelogs WHERE ruuuby_gem_id = (SELECT ruuuby_gem_get_id(_name)) ORDER BY id DESC LIMIT 1);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_gem_current_version(_name text) RETURNS TEXT AS $$
BEGIN
    RETURN (SELECT version_current FROM ruuuby_gem_changelogs WHERE ruuuby_gem_id = (SELECT ruuuby_gem_get_id(_name)) ORDER BY id DESC LIMIT 1);
END
$$ LANGUAGE plpgsql;

COMMIT TRANSACTION;
