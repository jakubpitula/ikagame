
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
(1, 'duda.png'),
(2, 'gaczynski.png'),
(3, 'wysocki.png'),
(4, 'mroczkowski.png'),
(5, 'janicki.png'),
(6, 'gardzielewski.png'),
(7, 'stawski.png'),
(8, 'medorowski.png'),
(9, 'strykowski.png'),
(10, 'kazmierczak.png'),
(11, 'iwanicka.png'),
(12, 'dudek.png'),
(13, 'dzialo.png'),
(14, 'zwierzchowski.png'),
(15, 'bloch.png'),
(16, 'zerdzinski.png'),
(17, 'medrzycka.png'),
(18, 'cichy.png'),
(19, 'dudziak.png'),
(20, 'kiwlenko.png'),
(21, 'gawrysiak.png'),
(22, 'kaczmarek.png'),
(23, 'pulikowska.png'),
(24, 'majewski.png'),
(25, 'robinska.png'),
(26, 'majchrzak.png'),
(27, 'maslowska.png'),
(28, 'wesolowski.png'),
(29, 'gauza.png'),
(30, 'dachtera.png'),
(31, 'pitula.png'),
(32, 'szulc.png');
