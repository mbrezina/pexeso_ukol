package cz.czechitas.webapp.persistence;

import cz.czechitas.webapp.entity.HerniPlocha;
import cz.czechitas.webapp.entity.Karta;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;


//@Repository
public class InMemoryPexesoRepository implements PexesoRepository {

    private Random random;
    private Map<Long, HerniPlocha> seznamHernichPloch;

    public InMemoryPexesoRepository() {
        random = new Random();
        seznamHernichPloch = new HashMap<>();
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
        return (long)Math.abs(random.nextInt());
    }
}
