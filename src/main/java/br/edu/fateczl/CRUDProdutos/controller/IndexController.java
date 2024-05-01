package br.edu.fateczl.CRUDProdutos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    // Endpoint para exibir a página index
    @RequestMapping(name = "index", value = "/index", method = RequestMethod.GET)
    public ModelAndView indexGet(ModelMap model) {
        return new ModelAndView("index");
    }

    // Endpoint para lidar com a submissão do formulário na página index
    @RequestMapping(name = "index", value = "/index", method = RequestMethod.POST)
    public ModelAndView indexPost(ModelMap model) {
        return new ModelAndView("index");
    }

}
