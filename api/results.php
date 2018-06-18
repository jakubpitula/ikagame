<?php

session_start();

echo 'Wynik: '.$_SESSION['score'].'/32 pkt';
unset($_SESSION['score']);