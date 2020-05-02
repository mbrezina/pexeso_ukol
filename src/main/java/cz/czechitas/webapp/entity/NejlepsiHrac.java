package cz.czechitas.webapp.entity;

public class NejlepsiHrac {
    private String jmeno;
    private int tahyNaVyhru;

    public NejlepsiHrac(String jmeno, int tahyNaVyhru) {
        this.jmeno = jmeno;
        this.tahyNaVyhru = tahyNaVyhru;
    }

    public void setJmeno(String jmeno) {
        this.jmeno = jmeno;
    }

    public void setTahyNaVyhru(int tahyNaVyhru) {
        this.tahyNaVyhru = tahyNaVyhru;
    }

    public String getJmeno() {
        return jmeno;
    }

    public int getTahyNaVyhru() {
        return tahyNaVyhru;
    }
}
