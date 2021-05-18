package com.example.ecommerce.controller;

import com.example.ecommerce.model.Cliente;
import com.example.ecommerce.model.Endereco;
import com.example.ecommerce.model.Produto;
import com.example.ecommerce.repository.ClienteRepository;
import com.example.ecommerce.repository.EnderecoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class ClienteController {

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private EnderecoRepository enderecoRepository;

    @GetMapping("cliente/cadastrar")
    public ModelAndView cadastrar(Cliente cliente){
        ModelAndView mv = new ModelAndView("cliente/cadastroCliente");
        mv.addObject("cliente", cliente);
//        mv.addObject("listaEnderecos", enderecoRepository.findAll());
        return mv;
    }

    @GetMapping("cliente/editar/{id}")
    public ModelAndView editar(@PathVariable("id") Long id){
        Optional<Cliente> cliente = clienteRepository.findById(id);
        return cadastrar(cliente.get());
    }

    @PostMapping("cliente/salvar")
    public ModelAndView salvar(Cliente cliente, BindingResult result){
        if(result.hasErrors()){
            return cadastrar(cliente);
        }
        cliente.setSenha(new BCryptPasswordEncoder().encode(cliente.getSenha()));

        clienteRepository.saveAndFlush(cliente);
        return cadastrar(new Cliente());
    }

}
