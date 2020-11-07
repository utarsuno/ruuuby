
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

CREATE OR REPLACE FUNCTION ruuuby_release_get_id(_version_ruuuby TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_releases WHERE version = _version_ruuuby);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_feature_get_id(_uid TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_features WHERE uid = _uid);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE ruuuby_feature_add(_uid TEXT, _is_optional BOOLEAN, _desc_self TEXT) LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ruuuby_features(uid, is_optional, desc_self) VALUES (_uid, _is_optional, _desc_self);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_release_add(_version_ruuuby TEXT) LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ruuuby_releases (version) VALUES (_version_ruuuby);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_feature_behavior_add(_feature_uid TEXT, _behavior_uid TEXT, _desc_self TEXT) LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ruuuby_feature_behaviors (uid, desc_self, ruuuby_features_id) VALUES (_behavior_uid, _desc_self, (SELECT id FROM ruuuby_features WHERE uid = _feature_uid));
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_add(_version_ruuuby TEXT, _name TEXT, _version_current TEXT, _env_dev BOOLEAN DEFAULT TRUE, _env_prod BOOLEAN DEFAULT FALSE, _ref_source TEXT DEFAULT NULL, _ref_version TEXT DEFAULT NULL, _git_url TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
DECLARE
    gem_id               BIGINT;
    val_gem_url          TEXT := (SELECT 'https://rubygems.org/gems/' || _name AS result_url);
    ruuuby_id   CONSTANT BIGINT := (SELECT ruuuby_release_get_id(_version_ruuuby));
BEGIN
    INSERT INTO ruuuby_gems (name, env_dev, env_prod, ref_source, ref_version, url_gem) VALUES (_name, _env_dev, _env_prod, _ref_source, _ref_version, val_gem_url);
    SELECT ruuuby_gem_get_id(_name) INTO gem_id;
    INSERT INTO ruuuby_gem_changelogs (version_current, is_version_latest, ruuuby_gem_id, ruuuby_releases_id) VALUES (_version_current, TRUE, gem_id, ruuuby_id);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_add_dev(_version_ruuuby TEXT, _name TEXT, _version_current TEXT, _ref_source TEXT DEFAULT NULL, _ref_version TEXT DEFAULT NULL, _git_url TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
BEGIN
    CALL ruuuby_gem_add(_version_ruuuby, _name, _version_current, TRUE, FALSE, _ref_source, _ref_version, _git_url);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_add_prod(_version_ruuuby TEXT, _name TEXT, _version_current TEXT, _ref_source TEXT DEFAULT NULL, _ref_version TEXT DEFAULT NULL, _git_url TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
BEGIN
    CALL ruuuby_gem_add(_version_ruuuby, _name, _version_current, TRUE, TRUE, _ref_source, _ref_version, _git_url);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_add_recommended(_version_ruuuby TEXT, _name TEXT, _version_current TEXT, _ref_source TEXT DEFAULT NULL, _ref_version TEXT DEFAULT NULL, _git_url TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
BEGIN
    CALL ruuuby_gem_add(_version_ruuuby, _name, _version_current, FALSE, FALSE, _ref_source, _ref_version, _git_url);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_update(_version_ruuuby text, _name text, _version_current text) LANGUAGE plpgsql AS $$
DECLARE
    gem_id    CONSTANT BIGINT := (SELECT ruuuby_gem_get_id(_name));
    ruuuby_id CONSTANT BIGINT := (SELECT ruuuby_release_get_id(_version_ruuuby));
BEGIN
    UPDATE ruuuby_gem_changelogs AS rgc SET is_version_latest = FALSE WHERE rgc.ruuuby_gem_id = gem_id;
    INSERT INTO ruuuby_gem_changelogs (version_current, is_version_latest, ruuuby_gem_id, ruuuby_releases_id) VALUES (_version_current, TRUE, gem_id, ruuuby_id);
END; $$;

CREATE OR REPLACE PROCEDURE ruuuby_gem_remove(_version_ruuuby text, _name text) LANGUAGE plpgsql AS $$
DECLARE
    gem_id    CONSTANT BIGINT := (SELECT ruuuby_gem_get_id(_name));
    ruuuby_id CONSTANT BIGINT := (SELECT ruuuby_release_get_id(_version_ruuuby));
BEGIN
    UPDATE ruuuby_gem_changelogs AS rgc SET is_version_latest = FALSE WHERE rgc.ruuuby_gem_id = gem_id;
    INSERT INTO ruuuby_gem_changelogs (version_current, is_version_latest, ruuuby_gem_id, ruuuby_releases_id) VALUES ('REMOVE', TRUE, gem_id, ruuuby_id);
END; $$;

CREATE OR REPLACE FUNCTION ruuuby_gem_get_id(_name TEXT) RETURNS BIGINT AS $$
BEGIN
    RETURN (SELECT id FROM ruuuby_gems WHERE name = _name LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_gem_latest_changelog_id(_name text) RETURNS BIGINT AS $$
BEGIN
    -- TODO: shouldn't it be max(id) for ruuuby_gem_changelogs?
    RETURN (SELECT id FROM ruuuby_gem_changelogs WHERE ruuuby_gem_id = (SELECT ruuuby_gem_get_id(_name)) ORDER BY id DESC LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_gem_current_version(_name text) RETURNS TEXT AS $$
BEGIN
    RETURN (SELECT version_current FROM ruuuby_gem_changelogs WHERE ruuuby_gem_id = (SELECT ruuuby_gem_get_id(_name)) ORDER BY id DESC LIMIT 1);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ruuuby_release_gem_changelogs (_release_version TEXT)
    RETURNS TABLE (
        version_current CHARACTER VARYING,
        version CHARACTER VARYING,
        name CHARACTER VARYING
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT rgc.version_current, rr.version, rg.name FROM ruuuby_gem_changelogs AS rgc
        JOIN ruuuby_releases AS rr ON rr.id = rgc.ruuuby_releases_id
        	AND rr.version = _release_version
        LEFT JOIN ruuuby_gems AS rg ON rg.id = rgc.ruuuby_gem_id
        ORDER BY rgc.id DESC;
END; $$ LANGUAGE plpgsql;

COMMIT TRANSACTION;
