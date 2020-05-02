package cz.czechitas.webapp.controller;

import cz.czechitas.webapp.entity.HerniPlocha;
import cz.czechitas.webapp.entity.NejlepsiHrac;
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
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class HlavniController {

    private PexesoService pexesoService;
    private Map<Long, NejlepsiHrac> seznamNejlepsichHracu;
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

        seznamNejlepsichHracu = new TreeMap<>();
        seznamNejlepsichHracu.put(1L, new NejlepsiHrac("Jana Novotná", 14));
        seznamNejlepsichHracu.put(2L, new NejlepsiHrac("Marta Jasná", 19));
        seznamNejlepsichHracu.put(3L, new NejlepsiHrac("Miloš Říha", 20));
        seznamNejlepsichHracu.put(4L, new NejlepsiHrac("Jarda Vomáčka", 24));
        seznamNejlepsichHracu.put(5L, new NejlepsiHrac("Jiří Straka", 27));

        drzakNaData.addObject("nejlepsiHraci", seznamNejlepsichHracu.values());
        return drzakNaData;
    }

    @RequestMapping(value = "/stul.html", method = RequestMethod.POST)
    public String zpracujTah(@RequestParam("id") Long idHerniPlochy,
                             @RequestParam Map<String, String> allParams) {
        int cisloVybraneKarty = zjistiPoziciVybraneKarty(allParams.keySet());
        if (cisloVybraneKarty != -1) {
                pexesoService.provedTah(idHerniPlochy, cisloVybraneKarty);
        }
        return "redirect:/stul.html?id=" + idHerniPlochy;
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
