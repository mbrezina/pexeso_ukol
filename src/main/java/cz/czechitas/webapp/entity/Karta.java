package cz.czechitas.webapp.entity;

public class Karta {

    private Long id;
    private int cisloKarty;
    private StavKarty stav;

    public Karta() {
    }

    public Karta(int cisloKarty, StavKarty stav) {
        this.cisloKarty = cisloKarty;
        this.stav = stav;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCisloKarty() {
        return cisloKarty;
    }

    public void setCisloKarty(int newValue) {
        cisloKarty = newValue;
    }

    public int getCisloObrazku() {
        return cisloKarty / 2;
    }

    public StavKarty getStav() {
        return stav;
    }

    public void setStav(StavKarty stav) {
        this.stav = stav;
    }
}
