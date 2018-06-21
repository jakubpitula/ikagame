
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
(1, 'Duda.jpg'),
(2, 'Gaczynski.jpg'),
(3, 'Wysocki.jpg'),
(4, 'Mroczkowski.jpg'),
(5, 'Janicki.jpg'),
(6, 'Gardzielewski.jpg'),
(7, 'Stawski.jpg'),
(8, 'Medorowski.jpg'),
(9, 'Strykowski.jpg'),
(10, 'Kazmierczak.jpg'),
(11, 'Iwanicka.jpg'),
(12, 'Dudek.jpg'),
(13, 'Dzialo.jpg'),
(14, 'Zwierzchowski.jpg'),
(15, 'Bloch.jpg'),
(16, 'Zerdzinski.jpg'),
(17, 'Medrzycka.jpg'),
(18, 'Cichy.jpg'),
(19, 'Dudziak.jpg'),
(20, 'Kiwlenko.jpg'),
(21, 'Gawrysiak.jpg'),
(22, 'Kaczmarek.jpg'),
(23, 'Pulikowska.jpg'),
(24, 'Majewski.jpg'),
(25, 'Robinska.jpg'),
(26, 'Majchrzak.jpg'),
(27, 'Maslowska.jpg'),
(28, 'Wesolowski.jpg'),
(29, 'Gauza.jpg'),
(30, 'Dachtera.jpg'),
(31, 'Pitula.jpg'),
(32, 'Szulc.jpg');
