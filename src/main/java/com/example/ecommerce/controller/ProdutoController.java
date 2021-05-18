package com.example.ecommerce.controller;

import com.example.ecommerce.model.Produto;
import com.example.ecommerce.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class ProdutoController {

    @Autowired
    private ProdutoRepository produtoRepository;

    @GetMapping("administrativo/produtos/cadastrar")
    public ModelAndView cadastrar(Produto produto){
        ModelAndView mv = new ModelAndView("administrativo/produtos/cadastroProduto");
        mv.addObject("produto", produto);
        return mv;
    }

    @GetMapping("administrativo/produtos")
    public String listar(Model model){
        List<Produto> produtos = produtoRepository.findAll();
        model.addAttribute("produtos", produtos);
        return "administrativo/produtos/listaProduto";
    }


    @PostMapping("administrativo/produtos/salvar")
    public ModelAndView salvar(Produto produto, BindingResult result){
        if(result.hasErrors()){
            return cadastrar(produto);
        }
        produtoRepository.saveAndFlush(produto);

        return cadastrar(new Produto());
    }


}
