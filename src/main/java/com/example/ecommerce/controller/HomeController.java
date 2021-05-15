package com.example.ecommerce.controller;

import com.example.ecommerce.model.Pedido;
import com.example.ecommerce.model.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {


    @GetMapping("/home")
    public String home(Model model){
        BigDecimal valor = new BigDecimal("1399.00");
        Produto produto = new Produto();
        produto.setNome("Moto G10");
        produto.setUrlFoto("https://images-na.ssl-images-amazon.com/images/I/61pBPPHcV2S._AC_SL1000_.jpg");
        produto.setDescricao("Smartphone Moto G10 Cinza, com Tela de 6,5, 4G, 64GB e Câmera de 48MP* + 2MP");
        produto.setValor(valor);

        List<Produto> produtos = Arrays.asList(produto, produto);
        model.addAttribute("produtos", produtos);

        return "home";
    }

}
