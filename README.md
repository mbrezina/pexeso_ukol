# pexeso_ukol


Jak si vyrobit tabulky pro tento program:

CREATE TABLE NejlepsiHraci (     
    Jmeno VARCHAR(250) NOT NULL,
    PocetTahu INT NOT NULL  );


INSERT INTO NejlepsiHraci (Jmeno, PocetTahu) VALUES ('NikiPiki', 23);



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
