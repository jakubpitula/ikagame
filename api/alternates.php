<?php

$arr =[
    'Mati' => 'Mateusz',
    'Tymek' => 'Tymoteusz',
    'Stasiu' => 'Stanisław',
    'Staś' => 'Stanisław',
    'Stachu' => 'Stanisław',
    'Wojtek' => 'Wojciech',
    'Kuba' => 'Jakub',
    'Jaś' => 'Jan',
    'Janek' => 'Jan',
    'Jasiu' => 'Jan',
    'Asia' => 'Joanna',
    'Joasia' => 'Joanna',
    'Wiki' => 'Wiktor',
    'Magda' => 'Magdalena',
    'Piotrek' => 'Piotr',
    'Szymek' => 'Szymon',
    'Adaś' => 'Adam',
    'Wera' => 'Weronika'
];

$res = json_encode($arr, JSON_UNESCAPED_UNICODE);
echo $res;