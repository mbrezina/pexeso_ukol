package cz.czechitas.webapp.persistence;

import cz.czechitas.webapp.entity.HerniPlocha;
import cz.czechitas.webapp.entity.Karta;
import cz.czechitas.webapp.entity.NejlepsiHrac;
import org.mariadb.jdbc.MariaDbDataSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.lookup.DataSourceLookupFailureException;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;


@Repository
public class JdbcTemplatePexesoRepository implements PexesoRepository {

    private RowMapper<HerniPlocha> prevodnikPlochy;
    private RowMapper<Karta> prevodnikKarty;
    private RowMapper<NejlepsiHrac>prevodnikNejlepsiHrac;
    private JdbcTemplate odesilacDotazu;

    public JdbcTemplatePexesoRepository() {
        try {
            MariaDbDataSource konfiguraceDatabaze = new MariaDbDataSource();
            konfiguraceDatabaze.setUrl("jdbc:mysql://localhost:3306/Pexeso");
            konfiguraceDatabaze.setUserName("student");
            konfiguraceDatabaze.setPassword("password");

            prevodnikPlochy = BeanPropertyRowMapper.newInstance(HerniPlocha.class);
            prevodnikKarty = BeanPropertyRowMapper.newInstance(Karta.class);
            prevodnikNejlepsiHrac = BeanPropertyRowMapper.newInstance(NejlepsiHrac.class);
            odesilacDotazu = new JdbcTemplate(konfiguraceDatabaze);

        } catch (SQLException sqle) {
            throw new DataSourceLookupFailureException("Chyba připojení do databáze");
        }
    }


    public ArrayList<NejlepsiHrac> getSeznamNejlepsichHracu() {
        String sql = "SELECT * FROM NejlepsiHraci";
        ArrayList<NejlepsiHrac> nejlepsiHraci = (ArrayList<NejlepsiHrac>) odesilacDotazu.query(sql, prevodnikNejlepsiHrac);
        return nejlepsiHraci;
    }


    @Override
    public HerniPlocha save(HerniPlocha plocha) {
        if (plocha.getId() == null) {
            pridej(plocha);
            return plocha;
        } else {
            updatuj(plocha);
            return plocha;
        }
    }


    private HerniPlocha pridej(HerniPlocha plocha) {
        GeneratedKeyHolder drzakNaVygenerovanyKlic = new GeneratedKeyHolder();
        String sql = "INSERT INTO HerniPlochy (Stav, CasPoslednihoTahu, PocetTahu) " +
            "VALUES (?, ?, ?)";
        odesilacDotazu.update((Connection con) -> {
                PreparedStatement prikaz = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                prikaz.setString(1, plocha.getStav().name());
                prikaz.setObject(2, Instant.now());
                prikaz.setInt(3, plocha.getPocetTahu());
                return prikaz;
            },
            drzakNaVygenerovanyKlic);
        plocha.setId(drzakNaVygenerovanyKlic.getKey().longValue());

        List<Karta> karticky = plocha.getKarticky();
        for (int i = 0; i < karticky.size(); i++) {
            Karta karticka = karticky.get(i);
            pridejKarticku(karticka, plocha.getId(), i);
        }
        return plocha;
    }

   /* private void zvysPocetTahu(Long plochaId) {

    }*/


    private void pridejKarticku(Karta karticka, Long plochaId, int poradiKarty) {
        GeneratedKeyHolder drzakNaVygenerovanyKlic = new GeneratedKeyHolder();
        String sql = "INSERT INTO Karty (CisloKarty, Stav, HerniPlochaID, PoradiKarty) " +
            "VALUES (?, ?, ?, ?)";
        odesilacDotazu.update((Connection con) -> {
                PreparedStatement prikaz = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                prikaz.setInt(1, karticka.getCisloKarty());
                prikaz.setString(2, karticka.getStav().name());
                prikaz.setLong(3, plochaId);
                prikaz.setInt(4, poradiKarty);
                return prikaz;
            },
            drzakNaVygenerovanyKlic);
        karticka.setId(drzakNaVygenerovanyKlic.getKey().longValue());
    }


    @Override
    public HerniPlocha findById(Long id) {
        try {
            HerniPlocha herniPlocha = odesilacDotazu.queryForObject(
                "SELECT ID, Stav, PocetTahu FROM HerniPlochy WHERE ID = ?",
                prevodnikPlochy,
                id);
            List<Karta> karticky = odesilacDotazu.query(
                "SELECT ID, CisloKarty, Stav FROM Karty WHERE HerniPlochaID = ?",
                prevodnikKarty,
                id);
            herniPlocha.setKarticky(karticky);
            return herniPlocha;
        } catch (EmptyResultDataAccessException e) {
            throw new NeexistujiciHraException();
        }
    }

    public void vlozHrace(String jmeno, Integer PocetTahu) {
        odesilacDotazu.update("INSERT INTO NejlepsiHraci (Jmeno, PocetTahu) VALUES (?, ?)",
            jmeno,
            PocetTahu);
    }



    private HerniPlocha updatuj(HerniPlocha plocha) {
        odesilacDotazu.update(
            "UPDATE HerniPlochy SET Stav = ?, CasPoslednihoTahu = ?, PocetTahu = ? WHERE ID = ?",
            plocha.getStav().name(),
            Instant.now(),
            plocha.getPocetTahu(),
            plocha.getId());

        List<Karta> karticky = plocha.getKarticky();
        for (int i = 0; i < karticky.size(); i++) {
            Karta karticka = karticky.get(i);
            odesilacDotazu.update(
                "UPDATE Karty SET Stav = ?, PoradiKarty = ? WHERE ID = ?",
                karticka.getStav().name(),
                i,
                karticka.getId());
        }

        return plocha;
    }

    }



