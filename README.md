pexeso_ukol

https://javabrno.czechitas.cz/2020-jaro/java-2/lekce10-ukol.html

Úkol implementuje 2 Repository: InMemoryRepository (větev memory_results) a JdbcRepository (větev homework). 
Nadstavbou nad úkolem je zobrazení tabulky s nejlepšími hráči a zapsání vlastního výsledku do této tabulky tak, 
aby pexeso vypadalo jako opravdová hra. Toto je uděláno pro obě implementace Repository.

Jak si vyrobit tabulky pro tento program při práci s JdbcRepository, pokud chcete mít i tabulku s nejlepšími hráči:

CREATE TABLE NejlepsiHraci (
Jmeno VARCHAR(250) NOT NULL, PocetTahu INT NOT NULL );

Jak vyrobit hráče do tabulky nejlepších hráčů: INSERT INTO NejlepsiHraci (Jmeno, PocetTahu) VALUES ('NikiPiki', 23);

CREATE TABLE HerniPlochy ( ID INT PRIMARY KEY AUTO_INCREMENT, Stav VARCHAR(250), CasPoslednihoTahu TIMESTAMP DEFAULT now() NOT NULL, PocetTahu INT );

CREATE TABLE Karty ( ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT, HerniPlochaID INT NOT NULL, CisloKarty INT DEFAULT 0 NOT NULL, Stav VARCHAR(250) , PoradiKarty INT NOT NULL DEFAULT 0, CONSTRAINT HerniPlocha_FK FOREIGN KEY (HerniPlochaID) REFERENCES HerniPlochy (ID) );
