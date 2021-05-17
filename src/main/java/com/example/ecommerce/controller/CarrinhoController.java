package com.example.ecommerce.controller;

import com.example.ecommerce.model.ItensPedido;
import com.example.ecommerce.model.Produto;
import com.example.ecommerce.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class CarrinhoController {

    private List<ItensPedido> itensPedido = new ArrayList<ItensPedido>();

    @Autowired
    private ProdutoRepository produtoRepository;

    @GetMapping("/carrinho")
    public ModelAndView chamarCarrinho(){
        ModelAndView mv = new ModelAndView("cliente/carrinho");
        mv.addObject("listaItens", itensPedido );
        return mv;
    }

    @GetMapping("/adicionarCarrinho/{id}")
    public ModelAndView adcionarCarrinho(@PathVariable Long id){
        ModelAndView mv = new ModelAndView("cliente/carrinho");
        
        Optional<Produto> produto = produtoRepository.findById(id);
        Produto produtoPesquisado = produto.get();

        boolean itensRepetidos = false;
        for (ItensPedido it:itensPedido) {
            if(it.getProduto().getId() == produtoPesquisado.getId()){
                it.setQuantidade(it.getQuantidade() + 1);
                itensRepetidos = true;
                break;
            }
        }

        if(!itensRepetidos){
            ItensPedido item = new ItensPedido();
            item.setProduto(produtoPesquisado);
            item.setValorUnitario(produtoPesquisado.getValor());
            item.setQuantidade(item.getQuantidade() + 1);
            item.setValorTotal(item.getQuantidade() * item.getValorUnitario());
            itensPedido.add(item);
        }


        mv.addObject("listaItens", itensPedido );
        return mv;
    }

}
