package com.example.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarrinhoController {

    @GetMapping("/carrinho")
    public ModelAndView chamarCarrinho(){
        ModelAndView mv = new ModelAndView("cliente/carrinho");
        return mv;
    }

}
