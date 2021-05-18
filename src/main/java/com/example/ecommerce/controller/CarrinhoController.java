package com.example.ecommerce.controller;

import com.example.ecommerce.model.Cliente;
import com.example.ecommerce.model.ItensPedido;
import com.example.ecommerce.model.Pedido;
import com.example.ecommerce.model.Produto;
import com.example.ecommerce.repository.ClienteRepository;
import com.example.ecommerce.repository.ItensPedidoRepository;
import com.example.ecommerce.repository.PedidoRepository;
import com.example.ecommerce.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class CarrinhoController {

    private List<ItensPedido> itensPedido = new ArrayList<ItensPedido>();
    private Pedido pedido = new Pedido();
    private Cliente cliente;

    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private PedidoRepository pedidoRepository;

    @Autowired
    private ItensPedidoRepository itensPedidoRepository;

    private void calcularTotal()
    {
        pedido.setValor(0.0);
        for (ItensPedido it:itensPedido) {
            pedido.setValor(pedido.getValor() + it.getValorTotal());
        }
    }
    @GetMapping("/carrinho")
    public ModelAndView chamarCarrinho(){
        ModelAndView mv = new ModelAndView("cliente/carrinho");
        calcularTotal();
        mv.addObject("pedido", pedido);
        mv.addObject("listaItens", itensPedido );
        return mv;
    }

    private void buscarUsuarioLogado(){
        Authentication UsuarioAutenticado = SecurityContextHolder.getContext().getAuthentication();
        if(!(UsuarioAutenticado instanceof AnonymousAuthenticationToken)){
            String email = UsuarioAutenticado.getName();
            cliente = clienteRepository.buscarClienteEmail(email).get(0);
        }
    }

    @GetMapping("/finalizar")
    public ModelAndView finalizarPedido(){
        buscarUsuarioLogado();
        ModelAndView mv = new ModelAndView("cliente/finalizar");
        calcularTotal();
        mv.addObject("pedido", pedido);
        mv.addObject("listaItens", itensPedido );
        mv.addObject("cliente", cliente);
        return mv;
    }

    @PostMapping("/finalizar/confirmar")
    public ModelAndView confirmarPedido(String formaPagamento){
        ModelAndView mv = new ModelAndView("cliente/pedidoRealizado");
        pedido.setCliente(cliente);
        pedido.setFormaPagamento(formaPagamento);
        pedidoRepository.saveAndFlush(pedido);

        for(ItensPedido ip:itensPedido){
            ip.setPedido(pedido);
            itensPedidoRepository.saveAndFlush(ip);
        }
        itensPedido = new ArrayList<>();
        pedido = new Pedido();
        return mv;
    }

    @GetMapping("/alterarQuantidade/{id}/{acao}")
    public String alterarQuantidade(@PathVariable Long id, @PathVariable Integer acao){
        for (ItensPedido it:itensPedido) {
            if(it.getProduto().getId() == id){
                if(acao.equals(1)){
                    it.setQuantidade(it.getQuantidade() + 1);
                    it.setValorTotal(0.0);
                    it.setValorTotal(it.getValorTotal() + (it.getQuantidade() * it.getValorUnitario()));
                }else if (acao.equals(0)){
                    it.setQuantidade(it.getQuantidade() - 1);
                    it.setValorTotal(0.0);
                    it.setValorTotal(it.getValorTotal() + (it.getQuantidade() * it.getValorUnitario()));
                }
                break;
            }
        }

        return "redirect:/carrinho";
    }

    @GetMapping("/removerProduto/{id}")
    public String removerProdutoCarrinho(@PathVariable Long id){
        for (ItensPedido it:itensPedido) {
            if(it.getProduto().getId() == id){
                itensPedido.remove(it);
                break;
            }
        }

        return "redirect:/carrinho";
    }

    @GetMapping("/adicionarCarrinho/{id}")
    public String adcionarCarrinho(@PathVariable Long id){
        
        Optional<Produto> produto = produtoRepository.findById(id);
        Produto produtoPesquisado = produto.get();

        boolean itensRepetidos = false;
        for (ItensPedido it:itensPedido) {
            if(it.getProduto().getId() == produtoPesquisado.getId()){
                it.setQuantidade(it.getQuantidade() + 1);
                it.setValorTotal(0.0);
                it.setValorTotal(it.getValorTotal() + (it.getQuantidade() * it.getValorUnitario()));
                itensRepetidos = true;
                break;
            }
        }

        if(!itensRepetidos){
            ItensPedido item = new ItensPedido();
            item.setProduto(produtoPesquisado);
            item.setValorUnitario(produtoPesquisado.getValor());
            item.setQuantidade(item.getQuantidade() + 1);
            item.setValorTotal(item.getValorTotal() + (item.getQuantidade() * item.getValorUnitario()));
            itensPedido.add(item);
        }

        return "redirect:/carrinho";
    }

}
