-- Prihlasit se jako root, prazdne heslo
CREATE USER  'student'@'localhost'   IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO   'student'@'%'   IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO   'student'@'localhost'   IDENTIFIED BY 'password';




-- Prihlasit se jako student, heslo password
# DROP DATABASE VideoBoss;

CREATE DATABASE VideoBoss
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_czech_ci;

USE VideoBoss;

CREATE TABLE Branches
(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    BranchName VARCHAR(200) NOT NULL
);

CREATE TABLE Customers
(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Firstname VARCHAR(250) NOT NULL,
    Lastname VARCHAR(250) NOT NULL,
    Address VARCHAR(500),
    Deleted TINYINT DEFAULT 0,
    Version INT DEFAULT 0
);

CREATE TABLE Films
(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(250) NOT NULL,
    ReleaseYear INT NOT NULL,
    Rating DOUBLE DEFAULT -1 NOT NULL,
    Picture MEDIUMBLOB,
    Version INT DEFAULT 0,
    ExternalLink VARCHAR(1024)
);

CREATE TABLE MediaItems
(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FilmID INT,
    BranchID INT,
    Available TINYINT DEFAULT 1,
    Version INT DEFAULT 0,
    CONSTRAINT MediaItems_ibfk_2 FOREIGN KEY (BranchID) REFERENCES Branches (ID),
    CONSTRAINT MediaItems_ibfk_1 FOREIGN KEY (FilmID) REFERENCES Films (ID)
);

CREATE TABLE Loans
(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MediaItemID INT NOT NULL,
    CustomerID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    IsOpen TINYINT DEFAULT 1 NOT NULL,
    Version INT DEFAULT 0,
    CONSTRAINT Loans_ibfk_2 FOREIGN KEY (CustomerID) REFERENCES Customers (ID),
    CONSTRAINT Loans_ibfk_1 FOREIGN KEY (MediaItemID) REFERENCES MediaItems (ID)
);


INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Dvořák', 'Veselá 16, 111 50 Praha', 0, 42);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jiří', 'Šikovný', 'Jindřiššká 14, 111 50 Praha', 0, 7);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('František', 'Kožich', 'Nerudova 5, 111 50 Praha', 1, 5);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Daniel', 'Válec', 'Jabloňová 8, 602 00 Brno', 1, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Václav', 'Fiala', 'Grohova 6, 602 00 Brno', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Fendrich', 'Plantážní 5, 606 00 Brno', 0, 6);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Petr', 'Kozák', 'Vysoká 18, 532 00 Olomouc', 1, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('František', 'Poláček', 'Kounicova 10, 612 00 Brno', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Drahoslav', 'Hartman', 'Jungmannova 33, 110 00 Praha 1', 0, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Zelenka', 'Vocelova 1334, Hradec Králové', 0, 16);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Čápek', 'Tasova 20, 683 33 Brankovice', 0, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Petr', 'Slezák', 'Hrušky 22, 683 52 Hrušky', 0, 4);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Stanislava', 'Kočová', 'Školní 18, 671 28 Jaroslavice', 1, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Matěj', 'Kohout', 'Stříbrné Hory 15, 341 01 Nalžovské Hory', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Daniel', 'Drábek', 'Spojovací 15, 503 11 Hradec Králové', 0, 7);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Otakar', 'Šťastný', 'Náměstí 2, 373 11 Ledenice', 0, 4);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Zdeněk', 'Suchoň', 'Jeřábkova 6, 399 01 Milevsko', 0, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jaroslav', 'Kozlík', 'Pohůrecká 12, 370 06 České Budějovice', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Bayer', 'Kostelní 8, 671 72 Miroslav', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Václav', 'Nenosil', 'Komenského 512, 375 01 Týn nad Vltavou+', 1, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jaroslav', 'Hašek', 'Haškova 10, 631 00 Brno-Lesná', 1, 3);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Samec', 'Samcova', 1, 0);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Vašek', 'Přeholík', 'Ostrava', 1, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Snášel', 'Frýdek-Místek', 1, 1);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Snášel', 'Frýdek-Místek', 1, 1);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Dana', 'Silvanova', 'Praha', 1, 1);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Václav', 'Snědý', 'Ostrava', 1, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Radovan', 'Snědý', 'Mariánská 16, Ostrava', 0, 1);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Jandera', 'Janov', 1, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Marek', 'Veselka', 'Sosnová 37, 470 01 Sosnová', 0, 5);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Jan', 'Semerád', 'Slevova 8, Semily', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Šikovný', 'Jindřiššká 16, 111 50 Praha', 0, 6);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('František', 'Kožich', 'Nerudova 5, 111 50 Praha', 0, 2);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Václav', 'Fiala', 'Grohova 6, 602 00 Brno', 0, 0);
INSERT INTO VideoBoss.Customers (Firstname, Lastname, Address, Deleted, Version) VALUES ('Karel', 'Světec', 'Světlá nad Sázavou', 0, 1);


INSERT INTO VideoBoss.Branches (BranchName) VALUES ('Lesná');
INSERT INTO VideoBoss.Branches (BranchName) VALUES ('Bystrc');
INSERT INTO VideoBoss.Branches (BranchName) VALUES ('Královo pole');
INSERT INTO VideoBoss.Branches (BranchName) VALUES ('Řečkovice');
INSERT INTO VideoBoss.Branches (BranchName) VALUES ('Komárov');


INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Terminator 1', 1984, 87, 0, 'http://www.imdb.com/title/tt0088247/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Terminator 2: Judgement Day', 1991, 91, 0, 'http://www.imdb.com/title/tt0103064/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Terminator 3: Rise of the Machines', 2003, 72, 0, 'http://www.imdb.com/title/tt0181852/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Terminator 4: Terminator Salvation', 2009, 70, 0, 'http://www.imdb.com/title/tt0438488/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Star Trek', 2008, 87, 1, 'http://www.imdb.com/title/tt0796366/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Valkyrie', 2009, 82, 1, 'http://www.imdb.com/title/tt0985699/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Harry Potter and the Prisoner of Azkaban', 2004, 78, 2, 'http://www.imdb.com/title/tt0304141/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Minority Report', 2002, 81, 1, 'http://www.imdb.com/title/tt0181689/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Shawshank Redemption', 1994, 95, 0, 'http://www.imdb.com/title/tt0111161/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Schindler''s List', 1993, 94, 1, 'http://www.imdb.com/title/tt0108052/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Forrest Gump', 1994, 95, 0, 'http://www.imdb.com/title/tt0109830/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Back to the Future I', 1985, 90, 0, 'http://www.imdb.com/title/tt0088763/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Back to the Future II', 1989, 87, 2, 'http://www.imdb.com/title/tt0096874/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Back to the Future III ', 1990, 86, 0, 'http://www.imdb.com/title/tt0099088/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Saving Private Ryan', 1998, 88, 0, 'http://www.imdb.com/title/tt0120815/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Kolja', 1995, 87, 2, 'http://www.imdb.com/title/tt0116790/');
INSERT INTO VideoBoss.Films (Name, ReleaseYear, Rating, Version, ExternalLink) VALUES ('Resident Evil', 2002, 67, 1, 'http://www.imdb.com/title/tt0120804/');


INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (1, 2, 1, 0);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (1, 3, 1, 0);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (1, 3, 1, 10);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (1, 1, 1, 0);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (2, 1, 1, 4);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (2, 1, 0, 7);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (4, 1, 1, 4);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (4, 2, 1, 22);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (5, 3, 1, 2);
INSERT INTO VideoBoss.MediaItems (FilmID, BranchID, Available, Version) VALUES (5, 2, 1, 5);


INSERT INTO VideoBoss.Loans (MediaItemID, CustomerID, StartDate, EndDate, IsOpen, Version) VALUES (6, 1, '2011-03-03', '2011-03-03', 0, 0);
INSERT INTO VideoBoss.Loans (MediaItemID, CustomerID, StartDate, EndDate, IsOpen, Version) VALUES (5, 1, '2011-03-03', '2011-03-03', 0, 0);
INSERT INTO VideoBoss.Loans (MediaItemID, CustomerID, StartDate, EndDate, IsOpen, Version) VALUES (6, 8, '2011-04-07', '2011-04-08', 1, 0);


















-- Prihlasit se jako student, heslo password
# DROP DATABASE DailyPlanet;

CREATE DATABASE DailyPlanetMartina
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_czech_ci;

USE DailyPlanetMartina;

CREATE TABLE Clanky (
  id_clanku INT PRIMARY KEY AUTO_INCREMENT,
  Nazev VARCHAR(250),
  Autor VARCHAR(250),
  id_autor VARCHAR(250),
  Datum DATE DEFAULT now() NOT NULL
);

INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Lidé doma hromadí léky', 'Loise Lane', 1, '2019-03-20');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Nový japonský císař', 'Clark Kent', 2, '2019-04-30');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Prodeje androidových telefonů rostou', 'Bob Harley', 3, '2018-08-22');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('U přehrady našli utonulého muže', 'Cat Grant', 4, '2019-06-01');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Chléb bude dražší', 'Loise Lane', 1, '2019-04-20');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Nová česká prezidentka', 'Clark Kent', 2, '2019-04-25');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Nikdo už nekupuje androidové telefony', 'Bob Harley', 3, '2018-01-22');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Množírny zvířat zakázány', 'Cat Grant', 4, '2019-04-01');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Mléko bude dražší', 'Loise Lane', 1, '2019-03-23');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Nová finská prezidentka', 'Clark Kent', 2, '2019-11-30');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Ledovce tají', 'Loise Lane', 1, '2018-01-22');
INSERT INTO Clanky (Nazev, Autor, id_autor, Datum) VALUES ('Na Prýglu se bruslí', 'Cat Grant', 4, '2019-06-11');


CREATE TABLE Zamestnanci (
  id_autor INT PRIMARY KEY AUTO_INCREMENT,
  Jmeno VARCHAR(250),
  Bydliste VARCHAR(250),
  Plat INT,
  Datum_nastupu DATE DEFAULT now() NOT NULL
);


INSERT INTO Zamestnanci (id_autor, Jmeno, Bydliste, Plat, Datum_nastupu) VALUES (1, 'Loise Lane', 'Brno', 60000000, '2017-03-01');
INSERT INTO Zamestnanci (id_autor, Jmeno, Bydliste, Plat, Datum_nastupu) VALUES (2, 'Clark Kent', 'Pelhřimov', 58000000, '2018-04-01');
INSERT INTO Zamestnanci (id_autor, Jmeno, Bydliste, Plat, Datum_nastupu) VALUES (3, 'Bob Harley', 'Uherské Hradiště', 50000000, '2018-12-01');
INSERT INTO Zamestnanci (id_autor, Jmeno, Bydliste, Plat, Datum_nastupu) VALUES (4, 'Cat Grant', 'Liberec', 44000000, '2019-03-01');


CREATE TABLE Prodany_naklad ( 
  Datum DATE DEFAULT now() NOT NULL,
  Den_v_tydnu VARCHAR(15),
  Prodany_naklad INT,
  Zisk numeric(8,1),	
  
	
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES ('2019-02-01', 'pondělí', 12563, 6281.5);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-02, 'úterý', 25456, 12728);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-03	st	345	172.5);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-04	ct	3548	1774);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-05	pa	5464	2732);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-08	'pondělí'	6545	3272.5);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-09	ut	8672	4336);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-10	st	256464	128232);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-11	ct	8648	4324);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-12	pa	484	242);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-15	'pondělí'	84684	42342);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-16	ut	684	342);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-17	st	5454	2727);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-18	ct	5465	2732.5);
INSERT INTO Prodany_naklad (DatumDATE, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-19	pa	28848	14424);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-22	'pondělí'	8787	4393.5);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-23	ut	86786	43393);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-24	st	5688	2844);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-25	ct	54868	27434);
INSERT INTO Prodany_naklad (Datum, Den_v_tydnu, prodany_naklad, Zisk) VALUES (2019-02-26	pa	4888	2444);







-- Prihlasit se jako student, heslo password
# DROP DATABASE Pexeso;

CREATE DATABASE Pexeso
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_czech_ci;

USE Pexeso;

CREATE TABLE HerniPlochy (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Stav VARCHAR(250),
  CasPoslednihoTahu TIMESTAMP DEFAULT now() NOT NULL
);

CREATE TABLE Karty (
  ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  HerniPlochaID INT NOT NULL,
  CisloKarty INT DEFAULT 0 NOT NULL,
  Stav VARCHAR(250) ,
  PoradiKarty INT NOT NULL DEFAULT 0,
  CONSTRAINT HerniPlocha_FK FOREIGN KEY (HerniPlochaID) REFERENCES HerniPlochy (ID)
);







-- Prihlasit se jako student, heslo password
# DROP DATABASE SeznamKontaktu;

CREATE DATABASE SeznamKontaktu
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_czech_ci;

USE SeznamKontaktu;

CREATE TABLE Kontakt (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Jmeno VARCHAR(250),
  TelefonniCislo VARCHAR(32),
  Email VARCHAR(250)
);


INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Leonardo Da Vinci', '+39 234 123 950', 'leo@davinci.code');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Marie Curie', '+420 604 111 222', 'marie.curie@sorbonne-universite.fr');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Thomas Alva Edison', '+1-123-555-666', 'thomas@edison.com');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Albert Einstein', '+41 953 203 569', 'albert.einstein@cern.ch');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Terminátor', '+420 604 111 222', 'terminator@czechitas.cz');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Spiderman', '+420 604 111 222', 'spiderman@czechitas.cz');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Pučálkovic Amina', '+420 604 111 222', 'amina@czechitas.cz');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Maková panenka', '+420 677 777 888', 'mak@czechitas.cz');
INSERT INTO Kontakt (Jmeno, TelefonniCislo, Email) VALUES ('Lama krotká', '+420 567 765', 'lama@czechitas.cz');



