<?php
if (!defined("_KATE_MAIN")) die("You have no access to this file");
    $dbhost = getenv('MYSQL_HOST');
    $dbuname = getenv('MYSQL_ROOT_USER');
    $dbpass = getenv('MYSQL_ROOT_PASSWORD');
    $dbname = getenv('MYSQL_DATABASE');
    $global_path = getenv('WWW_PATH');
    $ffbin = "ffmpeg";
    $domain = getenv('DOMAIN_NAME');
    // Sync with Master - send your playlist to masterserver
    $sync=0;
    $master_host="ximiraga.ru";
    $ident="myvps";
    $sync_pwd="mypathforsync";
?>
