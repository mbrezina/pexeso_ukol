package cz.czechitas.webapp.controller;

import java.util.*;
import java.util.regex.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import cz.czechitas.webapp.entity.*;
import cz.czechitas.webapp.logika.*;
import cz.czechitas.webapp.persistence.*;

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
