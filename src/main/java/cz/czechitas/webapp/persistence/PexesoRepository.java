package cz.czechitas.webapp.persistence;

import cz.czechitas.webapp.entity.HerniPlocha;

public interface PexesoRepository {
    public HerniPlocha findById(Long id);
    public HerniPlocha save(HerniPlocha plocha);

}
