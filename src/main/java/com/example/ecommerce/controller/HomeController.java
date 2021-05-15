package com.example.ecommerce.controller;

import com.example.ecommerce.model.Pedido;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    Pedido pedido = new Pedido();

    @GetMapping("/home")
    public String home(Model model){
        return "home";
    }

}
