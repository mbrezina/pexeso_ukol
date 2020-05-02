package cz.czechitas.webapp.controller;

import cz.czechitas.webapp.entity.HerniPlocha;
import cz.czechitas.webapp.entity.JmenoForm;
import cz.czechitas.webapp.entity.NejlepsiHrac;
import cz.czechitas.webapp.entity.StavHry;
import cz.czechitas.webapp.logika.PexesoService;
import cz.czechitas.webapp.persistence.NeexistujiciHraException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class HlavniController {

    private PexesoService pexesoService;

    public HlavniController(PexesoService pexesoService) {
        this.pexesoService = pexesoService;
    }

    @RequestMapping(value = "/")
    public String zobrazIndex() {
        HerniPlocha plocha = pexesoService.vytvorNovouHerniPlochu();
        return "redirect:/stul.html?id=" + plocha.getId();
    }

    @RequestMapping(value = "/stul.html", method = RequestMethod.GET)
    public ModelAndView zobrazStul(@RequestParam("id") Long id) {
        HerniPlocha herniPlocha = pexesoService.najdiHerniPlochu(id);
        ModelAndView drzakNaData = new ModelAndView("stul");
        drzakNaData.addObject("aktualniHerniPlocha", herniPlocha);
        return drzakNaData;
    }

    @RequestMapping(value = "/stul.html", method = RequestMethod.POST)
    public String zpracujTah(@RequestParam("id") Long idHerniPlochy,
                             @RequestParam Map<String, String> allParams) {
        HerniPlocha herniPlocha = pexesoService.najdiHerniPlochu(idHerniPlochy);
        int cisloVybraneKarty = zjistiPoziciVybraneKarty(allParams.keySet());
        if (cisloVybraneKarty != -1) {
            pexesoService.provedTah(idHerniPlochy, cisloVybraneKarty);
        }
        if (herniPlocha.getStav().equals(StavHry.KONEC)) {
            return "redirect:/tabulka.html?id=" + idHerniPlochy;
        }
        return "redirect:/stul.html?id=" + idHerniPlochy;
    }

    @RequestMapping(value = "/tabulka.html", method = RequestMethod.GET)
    public ModelAndView zobrazTabulku(@RequestParam("id") Long idHerniPlochy) {
        HerniPlocha herniPlocha = pexesoService.najdiHerniPlochu(idHerniPlochy);
        ModelAndView drzakNaData = new ModelAndView("tabulka");
        drzakNaData.addObject("aktualniHerniPlocha", herniPlocha);
        drzakNaData.addObject("nejlepsiHraci", pexesoService.getSeznamNejlepsichHracu().values());
        return drzakNaData;
    }

    @RequestMapping(value = "/tabulka.html", method = RequestMethod.POST)
    public ModelAndView zpracujTabulku(JmenoForm vstup,
                                    @RequestParam("id") Long idHerniPlochy) {
        ModelAndView data = new ModelAndView("tabulka");
        HerniPlocha herniPlocha = pexesoService.najdiHerniPlochu(idHerniPlochy);
        String jmenoHrace = vstup.getJmeno();
        Map<Long, NejlepsiHrac> seznamHracu = pexesoService.getSeznamNejlepsichHracu();
        //seznamHracu.put(<)

        return data;
    }




    private int zjistiPoziciVybraneKarty(Collection<String> parameterNames) {
        Pattern regex = Pattern.compile("vybranaKarta(\\d+).+");
        for (String paramName : parameterNames) {
            Matcher matcher = regex.matcher(paramName);
            if (matcher.matches()) {
                return Integer.parseInt(matcher.group(1));
            }
        }
        return -1;
    }

    @ExceptionHandler(NeexistujiciHraException.class)
    public String zacniNovouHruPokudIdNeexistuje() {
        return "redirect:/";
    }

}
