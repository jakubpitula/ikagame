
DROP TABLE classmates,photos;
DROP SEQUENCE classmates_seq, photos_seq;

CREATE SEQUENCE classmates_seq;

CREATE TABLE IF NOT EXISTS classmates(
    id int DEFAULT NEXTVAL ('classmates_seq') PRIMARY KEY,
    pname char(255) NOT NULL,
    psurname char(255) NOT NULL
) ;

CREATE SEQUENCE photos_seq;

CREATE TABLE IF NOT EXISTS photos(
    id int DEFAULT NEXTVAL ('photos_seq') PRIMARY KEY,
    photo char(255) NOT NULL
) ;

INSERT INTO classmates(id,pname,psurname) VALUES
(1, 'Mateusz', 'Duda'),
(2, 'Krystian', 'Gaczyński'),
(3, 'Andrzej', 'Wysocki'),
(4, 'Tymoteusz', 'Mroczkowski'),
(5, 'Marcin', 'Janicki'),
(6, 'Stanisław', 'Gardzielewski'),
(7, 'Mateusz', 'Stawski'),
(8, 'Filip', 'Medorowski'),
(9, 'Wojciech', 'Strykowski'),
(10, 'Jakub', 'Kaźmierczak'),
(11, 'Dominika', 'Iwanicka'),
(12, 'Jan', 'Dudek'),
(13, 'Joanna', 'Działo'),
(14, 'Mateusz', 'Zwierzchowski'),
(15, 'Wiktor', 'Błoch'),
(16, 'Jakub', 'Żerdziński'),
(17, 'Magdalena', 'Mędrzycka'),
(18, 'Jakub', 'Cichy'),
(19, 'Piotr', 'Dudziak'),
(20, 'Jan', 'Kiwlenko'),
(21, 'Mateusz', 'Gawrysiak'),
(22, 'Szymon', 'Kaczmarek'),
(23, 'Weronika', 'Pulikowska'),
(24, 'Wojciech', 'Majewski'),
(25, 'Laura', 'Robińska'),
(26, 'Jan', 'Majchrzak'),
(27, 'Helena', 'Masłowska'),
(28, 'Karol', 'Wesołowski'),
(29, 'Andrzej', 'Gauza'),
(30, 'Adam', 'Dachtera'),
(31, 'Jakub', 'Pituła'),
(32, 'Tobiasz', 'Szulc');

INSERT INTO photos(id, photo) VALUES
(1, 'duda.jpg'),
(2, 'gaczynski.jpg'),
(3, 'wysocki.jpg'),
(4, 'mroczkowski.jpg'),
(5, 'janicki.jpg'),
(6, 'gardzielewski.jpg'),
(7, 'stawski.jpg'),
(8, 'medorowski.jpg'),
(9, 'strykowski.jpg'),
(10, 'kazmierczak.jpg'),
(11, 'iwanicka.jpg'),
(12, 'dudek.jpg'),
(13, 'dzialo.jpg'),
(14, 'zwierzchowski.jpg'),
(15, 'bloch.jpg'),
(16, 'zerdzinski.jpg'),
(17, 'medrzycka.jpg'),
(18, 'cichy.jpg'),
(19, 'dudziak.jpg'),
(20, 'kiwlenko.jpg'),
(21, 'gawrysiak.jpg'),
(22, 'kaczmarek.jpg'),
(23, 'pulikowska.jpg'),
(24, 'majewski.jpg'),
(25, 'robinska.jpg'),
(26, 'majchrzak.jpg'),
(27, 'maslowska.jpg'),
(28, 'wesolowski.jpg'),
(29, 'gauza.jpg'),
(30, 'dachtera.jpg'),
(31, 'pitula.jpg'),
(32, 'szulc.jpg');
