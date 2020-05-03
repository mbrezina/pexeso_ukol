package cz.czechitas.webapp.entity;

public class NejlepsiHrac implements Comparable<NejlepsiHrac> {

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

    @Override
    public int compareTo(NejlepsiHrac o) {
        NejlepsiHrac druhyHrac = (NejlepsiHrac) o;
        if (this.getTahyNaVyhru() < druhyHrac.getTahyNaVyhru()) {
            return -1;
        } else if (this.getTahyNaVyhru() > druhyHrac.getTahyNaVyhru()) {
            return 1;
        } else {
            return 0;
        }
    }

}
