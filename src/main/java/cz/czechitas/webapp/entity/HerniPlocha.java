package cz.czechitas.webapp.entity;

import java.util.List;

public class HerniPlocha {

    private Long id;
    private StavHry stav;
    private Integer pocetTahu;

    public void setPocetTahu(Integer pocetTahu) {
        this.pocetTahu = pocetTahu;
    }

    public Integer getPocetTahu() {
        return pocetTahu;
    }

    private List<Karta> karticky;

    public HerniPlocha() {
    }

    public HerniPlocha(List<Karta> karticky, StavHry stav, Integer pocetTahu) {
        this.karticky = karticky;
        this.stav = stav;
        this.pocetTahu = pocetTahu;
    }

    public void pripoctiTah() {
        pocetTahu++;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public StavHry getStav() {
        return stav;
    }

    public void setStav(StavHry stav) {
        this.stav = stav;
    }

    public List<Karta> getKarticky() {
        return karticky;
    }

    public void setKarticky(List<Karta> newValue) {
        karticky = newValue;
    }
}
