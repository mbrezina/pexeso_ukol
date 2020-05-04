


CREATE TABLE HerniPlochy (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Stav VARCHAR(250),
    CasPoslednihoTahu TIMESTAMP DEFAULT now() NOT NULL,
    PocetTahu INT	
);

CREATE TABLE Karty (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    HerniPlochaID INT NOT NULL,
    CisloKarty INT DEFAULT 0 NOT NULL,
    Stav VARCHAR(250) ,
    PoradiKarty INT NOT NULL DEFAULT 0,
    CONSTRAINT HerniPlocha_FK FOREIGN KEY (HerniPlochaID) REFERENCES HerniPlochy (ID)
);




CREATE DATABASE DailyPlanetMartina
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_czech_ci;

USE DailyPlanetMartina;

#### 


CREATE TABLE clanky (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nazev VARCHAR(250),
  autor VARCHAR(250),
  datum DATE DEFAULT now() NOT NULL
);

INSERT INTO clanky (nazev, autor, datum) VALUES ('Lidé doma hromadí léky', 'Loise Lane', '2019-02-08');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Nový japonský císař', 'Clark Kent', '2019-02-14');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Prodeje androidových telefonů rostou', 'Bob Harley', '2019-02-24');
INSERT INTO clanky (nazev, autor, datum) VALUES ('U přehrady našli utonulého muže', 'Cat Grant', '2019-02-01');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Chléb bude dražší', 'Loise Lane', '2019-02-02');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Nová česká prezidentka', 'Clark Kent', '2019-02-25');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Nikdo už nekupuje androidové telefony', 'Bob Harley', '2018-02-19');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Množírny zvířat zakázány', 'Cat Grant', '2019-02-12');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Mléko bude dražší', 'Loise Lane', '2019-02-26');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Nová finská prezidentka', 'Clark Kent', '2019-02-05');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Ledovce tají', 'Loise Lane', '2019-02-03');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Na Prýglu se bruslí', 'Cat Grant', '2019-02-18');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Letos v únoru napadlo opravdu hodně sněhu', 'Cat Grant', '2019-02-11');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Došla káva', 'Loise Lane', '2019-02-26');
INSERT INTO clanky (nazev, autor, datum) VALUES ('D1 konečně opravená', 'Clark Kent', '2019-02-05');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Superman a Spiderman jsou kamarádi', 'Loise Lane', '2019-02-03');
INSERT INTO clanky (nazev, autor, datum) VALUES ('Agrofert musí vrátit všechny dotace', 'Cat Grant', '2019-02-18');


############




CREATE TABLE clanky (
  idClanku INT PRIMARY KEY AUTO_INCREMENT,
  nazev VARCHAR(250),
  autor VARCHAR(250),
  idAutor VARCHAR(250),
  datum DATE DEFAULT now() NOT NULL
);

INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Lidé doma hromadí léky', 'Loise Lane', 1, '2019-02-08');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Nový japonský císař', 'Clark Kent', 2, '2019-02-14');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Prodeje androidových telefonů rostou', 'Bob Harley', 3, '2019-02-24');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('U přehrady našli utonulého muže', 'Cat Grant', 4, '2019-02-01');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Chléb bude dražší', 'Loise Lane', 1, '2019-02-02');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Nová česká prezidentka', 'Clark Kent', 2, '2019-02-25');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Nikdo už nekupuje androidové telefony', 'Bob Harley', 3, '2018-02-19');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Množírny zvířat zakázány', 'Cat Grant', 4, '2019-02-12');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Mléko bude dražší', 'Loise Lane', 1, '2019-02-26');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Nová finská prezidentka', 'Clark Kent', 2, '2019-02-05');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Ledovce tají', 'Loise Lane', 1, '2019-02-03');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Na Prýglu se bruslí', 'Cat Grant', 4, '2019-02-18');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Letos v únoru napadlo opravdu hodně sněhu', 'Cat Grant', 4, '2019-02-11');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Došla káva', 'Loise Lane', 1, '2019-02-26');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('D1 konečně opravená', 'Clark Kent', 2, '2019-02-05');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Superman a Spiderman jsou kamarádi', 'Loise Lane', 1, '2019-02-03');
INSERT INTO clanky (nazev, autor, idAutor, datum) VALUES ('Agrofert musí vrátit všechny dotace', 'Cat Grant', 4, '2019-02-18');




CREATE TABLE zamestnanci (
  idAutor INT PRIMARY KEY AUTO_INCREMENT,
  jmeno VARCHAR(250),
  bydliste VARCHAR(250),
  plat INT,
  datumNastupu DATE DEFAULT now() NOT NULL
);


INSERT INTO zamestnanci (idAutor, jmeno, bydliste, plat, datumNastupu) VALUES (1, 'Loise Lane', 'Brno', 60000000, '2017-03-01');
INSERT INTO zamestnanci (idAutor, jmeno, bydliste, plat, datumNastupu) VALUES (2, 'Clark Kent', 'Pelhřimov', 58000000, '2018-04-01');
INSERT INTO zamestnanci (idAutor, jmeno, bydliste, plat, datumNastupu) VALUES (3, 'Bob Harley', 'Uherské Hradiště', 50000000, '2018-12-01');
INSERT INTO zamestnanci (idAutor, jmeno, bydliste, plat, datumNastupu) VALUES (4, 'Cat Grant', 'Liberec', 44000000, '2019-03-01');



CREATE TABLE prodanyNaklad ( 
  datum DATE DEFAULT now() NOT NULL,
  denVTydnu VARCHAR(15),
  prodanyNaklad INT,
  zisk numeric(8,1)
);	
  
	
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-01', 'pondělí', 12563, 6281.5);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-02', 'úterý', 25456, 12728);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-03', 'středa', 345, 172.5);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-04', 'čtvrtek', 3548, 1774);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-05', 'pátek', 5464, 2732);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-08', 'pondělí', 6545, 3272.5);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-09', 'úterý', 8672, 4336);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-10', 'středa', 256464, 128232);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-11', 'čtvrtek', 8648, 4324);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-12', 'pátek', 484, 242);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-15', 'pondělí', 84684, 42342);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-16', 'úterý', 684, 342);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-17', 'středa', 5454, 2727);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-18', 'čtvrtek', 5465, 2732.5);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-19', 'pátek', 28848, 14424);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-22', 'pondělí', 8787, 4393.5);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-23', 'úterý', 86786, 43393);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-24', 'středa', 5688, 2844);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-25', 'čtvrtek', 54868, 27434);
INSERT INTO prodanyNaklad (datum, denVTydnu, prodanyNaklad, zisk) VALUES ('2019-02-26', 'pátek', 4888, 2444);





