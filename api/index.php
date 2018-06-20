<?php
session_start();
require_once "connect.php";

if(!isset($_SESSION['score'])) $_SESSION['score'] = 0;

$prephotos = $db->prepare("SELECT * FROM photos");
$prephotos->execute();

if(!isset($_SESSION['photos'])) $_SESSION['photos'] = $prephotos->fetchAll(PDO::FETCH_ASSOC);

$max = $prephotos->rowCount();
$min = 0;

if(!isset($_SESSION['actual'])) $_SESSION['actual'] = 0;
if(!isset($_SESSION['randomized'])) $_SESSION['randomized']=array();

#$_SESSION['actual'] jako licznik

$tab=$_SESSION['randomized'];

if($_SESSION['actual']>$max){
    unset($_SESSION['actual']);
    unset($_SESSION['randomized']);
    $arrjson = array(
        'imie' => "",
        'nazwisko' => "",
        'addr' => "",
        'counter' => 33
    );
    
    $json = json_encode($arrjson,JSON_UNESCAPED_UNICODE);
    
    echo $json;
} else {

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
$photo = $photorec['photo']; // link do zdjecia

$corrects = $db->prepare(
    "SELECT pname, psurname FROM classmates WHERE id=:id"
);
$corrects->bindValue(':id', $res+1);
$corrects->execute();

$namejson = $corrects->fetch(PDO::FETCH_ASSOC);

$arrjson = array(
    'imie' => $namejson['pname'],
    'nazwisko' => $namejson['psurname'],
    'addr' => $photo,
    'counter' => $_SESSION['actual']
);

$json = json_encode($arrjson,JSON_UNESCAPED_UNICODE);

echo $json;
}