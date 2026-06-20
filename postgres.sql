
SELECT current_user;

SELECT usename
FROM pg_user;

ALTER USER postgres WITH PASSWORD 'postgres127';

SHOW ssl;

SHOW data_directory;
SHOW config_file;

SHOW ssl;
SHOW ssl_cert_file;
SHOW ssl_key_file;


SELECT pg_reload_conf();
SHOW config_file;

SELECT name, setting
FROM pg_settings
WHERE name LIKE 'ssl%';