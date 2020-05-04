package cz.czechitas.webapp.entity;

public class NejlepsiHrac implements Comparable<NejlepsiHrac> {

    private String jmeno;
    private Integer PocetTahu;

    public NejlepsiHrac() {
    }

    public NejlepsiHrac(String jmeno, Integer PocetTahu) {
        this.jmeno = jmeno;
        this.PocetTahu = PocetTahu;
    }

    public void setJmeno(String jmeno) {
        this.jmeno = jmeno;
    }

    public void setPocetTahu(int PocetTahu) {
        this.PocetTahu = PocetTahu;
    }

    public String getJmeno() {
        return jmeno;
    }

    public int getPocetTahu() {
        return PocetTahu;
    }

    @Override
    public int compareTo(NejlepsiHrac o) {
        NejlepsiHrac druhyHrac = (NejlepsiHrac) o;
        if (this.getPocetTahu() < druhyHrac.getPocetTahu()) {
            return -1;
        } else if (this.getPocetTahu() > druhyHrac.getPocetTahu()) {
            return 1;
        } else {
            return 0;
        }
    }

}
