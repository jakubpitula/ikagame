<?php

session_start();

$_SESSION['cname'] = $_POST['c_name'];
$_SESSION['csurname'] = $_POST['c_surname'];

if(empty($_POST['c_name']) || empty($_POST['c_surname'])){
    $_SESSION['bug'] = "Proszę wpisać imię i nazwisko.";
    header('Location: index.php');
    exit();
}

include 'alternates.php';
require_once 'connect.php';

$c_name = $_POST['c_name'];
$c_surname = $_POST['c_surname'];
unset($_SESSION['cname']);
unset($_SESSION['csurname']);

$c_name = ucfirst(mb_strtolower($c_name, 'UTF-8'));
$c_surname = ucfirst(mb_strtolower($c_surname, 'UTF-8'));

$c_name = altName($c_name);

$photoid = $_SESSION['photorec']['id'];

$shot = false;

$precord = $db->prepare(
    "SELECT id, name, surname FROM classmates WHERE name = :name AND surname = :surname"
);
$precord->bindValue(':name', $c_name, PDO::PARAM_STR);
$precord->bindValue(':surname', $c_surname, PDO::PARAM_STR);
$precord->execute();

$record = $precord->fetch(PDO::FETCH_ASSOC);

if($precord->rowCount()>0){
    if($record['id']==$photoid){
        $shot=true;
    }
}

$corrects = $db->prepare(
    "SELECT name, surname FROM classmates WHERE id=:id"
);
$corrects->bindValue(':id', $photoid);
$corrects->execute();

$namejson = $corrects->fetch(PDO::FETCH_ASSOC);

$arrjson = array(
    'imie' => $namejson['name'],
    'nazwisko' => $namejson['surname'],
    'addr' => $_SESSION['photorec']['photo']
);

$json = json_encode($arrjson,JSON_UNESCAPED_UNICODE);

if ($shot) $_SESSION['score']++;

header('Location: index.php');