<?php

$connect = require_once 'host.php';

try{
    $db = new PDO(
        "mysql:dbname={$connect['db']};host={$connect['host']};charset={$connect['charset']}", 
        $connect['user'], $connect['password']
    );
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
    echo "Error: ".$e->getMessage();
    exit();
}   