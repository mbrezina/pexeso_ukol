package cz.czechitas.webapp.persistence;

import cz.czechitas.webapp.entity.HerniPlocha;
import cz.czechitas.webapp.entity.Karta;
import cz.czechitas.webapp.entity.NejlepsiHrac;
import org.springframework.stereotype.Repository;

import java.util.*;


@Repository
public class InMemoryPexesoRepository implements PexesoRepository {

    private Random random;
    private Map<Long, HerniPlocha> seznamHernichPloch;
    private ArrayList<NejlepsiHrac> seznamNejlepsichHracu;


    public InMemoryPexesoRepository() {
        random = new Random();
        seznamHernichPloch = new HashMap<>();
        seznamNejlepsichHracu = new ArrayList<>();
        seznamNejlepsichHracu.add(new NejlepsiHrac("Jana Novotná", 14));
        seznamNejlepsichHracu.add(new NejlepsiHrac("Marta Jasná", 19));
        seznamNejlepsichHracu.add(new NejlepsiHrac("Miloš Říha", 20));
        seznamNejlepsichHracu.add(new NejlepsiHrac("Jarda Vomáčka", 24));
        seznamNejlepsichHracu.add(new NejlepsiHrac("Jiří Straka", 27));
    }

    public ArrayList<NejlepsiHrac> getSeznamNejlepsichHracu() {
        return seznamNejlepsichHracu;
    }

    public HerniPlocha findById(Long id) {
        HerniPlocha herniPlocha = seznamHernichPloch.get(id);
        if (herniPlocha == null) {
            throw new NeexistujiciHraException();
        }
        return herniPlocha;
    }

    public HerniPlocha save(HerniPlocha plocha) {
        if (plocha.getId() == null) {
            plocha.setId(vygenerujNahodneId());
            for (Karta karta : plocha.getKarticky()) {
                karta.setId(vygenerujNahodneId());
            }
        }
        seznamHernichPloch.put(plocha.getId(), plocha);
        return plocha;
    }

    private Long vygenerujNahodneId() {
        return (long) Math.abs(random.nextInt());
    }
}
