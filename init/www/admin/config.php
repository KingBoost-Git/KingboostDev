<?php
// HTTP
define('HTTP_SERVER', 'http://kingboost.local/admin/');
define('HTTP_CATALOG', 'http://kingboost.local/');

// HTTPS
define('HTTPS_SERVER', 'http://kingboost.local/admin/');
define('HTTPS_CATALOG', 'http://kingboost.local/');

// DIR
define('DIR_APPLICATION', '/var/www/html/admin/');
define('DIR_SYSTEM', '/var/www/html/system/');
define('DIR_IMAGE', '/var/www/html/image/');
define('DIR_STORAGE', '/var/www/html/system/storage/');
define('DIR_CATALOG', '/var/www/html/catalog/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('DIR_CACHE', DIR_STORAGE . 'cache/');
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');
define('DIR_LOGS', DIR_STORAGE . 'logs/');
define('DIR_MODIFICATION', DIR_STORAGE . 'modification/');
define('DIR_SESSION', DIR_STORAGE . 'session/');
define('DIR_UPLOAD', DIR_STORAGE . 'upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'mariadb');
define('DB_USERNAME', 'kingboost');
define('DB_PASSWORD', 'kingboost');
define('DB_DATABASE', 'kingboost_dev');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');

define('TRUST_BUSINESS_USER_ID', '');
define('TRUST_BUSINESS_UNIT_ID', '');
define('TRUST_API_KEY', '');
define('TRUST_API_SECRET', '');
define('TRUST_EMAIL', '');
define('TRUST_PASSWORD', '');

define('TG_NOTIFICATIONS_URL', 'https://dev-notify-api.213iuhbnamdsdsadadadad12asdgggh.com/');
define('TG_NOTIFICATIONS_KEY', '123');