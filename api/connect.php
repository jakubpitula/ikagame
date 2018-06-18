<?php

//$connect = require_once 'host.php';
$dbopts = parse_url(getenv('DATABASE_URL'));
try{

    $db = new PDO(
        "mysql:dbname={$dbopts['db']};host={$dbopts['host']}", 
        $dbopts['user'], $dbopts['password']
    );
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
    echo "Error: ".$e->getMessage();
    exit();
}   