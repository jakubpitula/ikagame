<?php
$connect = parse_url(getenv('DATABASE_URL'));
$dbname = ltrim($connect["path"],'/');
    echo "pgsql:host=$connect['host'];port=$connect['port'];dbname=$dbname;user=$connect['user'];password=$connect['pass']";
