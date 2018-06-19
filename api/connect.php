<?php

//$connect = require_once 'host.php';
$connect = parse_url(getenv('DATABASE_URL'));
$dbname = ltrim($connect["path"],'/');
try{
    $pdstring = "pgsql:host=" . $connect['host'] . ";port=" . $connect['port'] . ";dbname=" . $dbname . ";user=" . $connect['user'] . ";password=" . $connect['pass'];
    $db = new PDO($pdstring);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
    echo "Error: ".$e->getMessage();
    exit();
}   