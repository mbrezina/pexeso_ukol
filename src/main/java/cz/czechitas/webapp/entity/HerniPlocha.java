package cz.czechitas.webapp.entity;

import java.time.*;
import java.util.*;

public class HerniPlocha {

    private Long id;
    private StavHry stav;
    private List<Karta> karticky;

    public HerniPlocha() {
    }

    public HerniPlocha(List<Karta> karticky, StavHry stav) {
        this.karticky = karticky;
        this.stav = stav;
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
