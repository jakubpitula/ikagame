<?php

function altName($name){
    switch($name){
        case 'Mati':
            return 'Mateusz';
            
        case 'Tymek':
            return 'Tymoteusz';
            
        case 'Stasiu':
        case 'Staś':
        case 'Stachu':
            return 'Stanisław';
            
        case 'Wojtek':
            return 'Wojciech';
            
        case 'Kuba':
            return 'Jakub';
            
        case 'Jaś':
        case 'Jasiu':
        case 'Janek':
            return 'Jan';
            
        case 'Asia':
        case 'Joasia':
            return 'Joanna';
            
        case 'Wiki':
            return 'Wiktor';
            
        case 'Magda':
            return 'Magdalena';
            
        case 'Piotrek':
            return 'Piotr';
            
        case 'Szymek':
            return 'Szymon';
            
        case 'Adaś':
            return 'Adam';
            
        case 'Wera':
            return 'Weronika';
            
        default:
            return $name;   
    }
}