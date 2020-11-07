
-- -------------------------------------------- ⚠️ --------------------------------------------
-- testing purposes
-- -------------------------------------------- ⚠️ --------------------------------------------

BEGIN TRANSACTION;

INSERT INTO ruuuby_tags (name) VALUES ('finance');
INSERT INTO ruuuby_tags (name) VALUES ('dev-tool');
INSERT INTO ruuuby_tags (name) VALUES ('dev-url');

INSERT INTO ruuuby_resource_types (name) VALUES ('URL');

COMMIT TRANSACTION;
