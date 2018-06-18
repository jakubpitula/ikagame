<?php
session_start();
require_once "connect.php";

if(!isset($_SESSION['score'])) $_SESSION['score'] = 0;

$prephotos = $db->prepare("SELECT * FROM photos");
$prephotos->execute();

if(!isset($_SESSION['photos'])) $_SESSION['photos'] = $prephotos->fetchAll(PDO::FETCH_ASSOC);

$max = $prephotos->rowCount() - 1;
$min = 0;

if(!isset($_SESSION['actual'])) $_SESSION['actual'] = 0;
if(!isset($_SESSION['randomized'])) $_SESSION['randomized']=array();

$tab=$_SESSION['randomized'];

if($_SESSION['actual']>$max){
    unset($_SESSION['actual']);
    unset($_SESSION['randomized']);
    header('Location: results.php');
    exit();
}
if(!isset($_SESSION['bug'])){
do{
    $ok = true;
    $res = rand($min, $max);

    foreach($_SESSION['randomized'] as $el){
        if($res==$el) $ok = false;
    }

    if($ok==true){
        $index = $_SESSION['actual'];
        $tab[$index] = $res;
        $_SESSION['actual']++;
        $_SESSION['randomized']=$tab;
    }

}while(!$ok);


$photorec = $_SESSION['photos'][$res];
$photo = $photorec['photo'];
$_SESSION['photorec'] = $photorec;
}
else {
    $photorec=$_SESSION['photorec'];
    $photo=$photorec['photo'];
}