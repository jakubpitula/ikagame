<?php
require_once "select.php";
/*
+ tabela z uczniami i tabela ze zdjęciami (linki do plików)
+ alternatywne wersje imion
- frontend Krystian
- aplikacja webowa/okienkowa
+ charset/create database
- losowanie zdjęcia (bez powtórzeń)
- walidacja odpowiedzi
- wyniki
*/
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <img src="<?='photos/'.$photo?>" alt="<?=$photo?>">
    <form action="checkanswer.php" method="post">
        <label>
            <p>Imię:</p>
            <input autofocus type="text" name="c_name" value=<?php
            if(isset($_SESSION['cname'])){
                echo $_SESSION['cname'];
            } 
            ?>>
        </label>
        <label>
            <p>Nazwisko:</p>
            <input type="text" name="c_surname" value=<?php
            if(isset($_SESSION['csurname'])){
                echo $_SESSION['csurname'];
            } 
            ?>>
        </label>
        <br>
        <input type="submit" value="Odpowiedz">
    </form>
    <?php
    if(isset($_SESSION['bug'])) echo"<p style='color: red;'>".$_SESSION['bug']."</p>";
    unset($_SESSION['bug']);
    ?>
    <p><?=$_SESSION['score']?></p>
</body>
</html>