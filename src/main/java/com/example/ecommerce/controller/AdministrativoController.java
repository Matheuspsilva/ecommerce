package com.example.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdministrativoController {

    @GetMapping("/administrativo")
    public String administrativo(){
        return "administrativo/home";
    }
}
