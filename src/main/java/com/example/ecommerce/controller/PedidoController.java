package com.example.ecommerce.controller;

import com.example.ecommerce.model.Pedido;
import com.example.ecommerce.repository.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Optional;

@RestController
public class PedidoController {

    @Autowired
    private PedidoRepository pedidoRepository;

    @RequestMapping(value = "/pedido", method = RequestMethod.GET)
    public List<Pedido> GET(Model model){
        List<Pedido> pedidos = pedidoRepository.findAll();
        return pedidos;
    }

    @RequestMapping(value = "/pedido/{id}", method = RequestMethod.GET)
    public ResponseEntity<Pedido> GetById(@PathVariable(value = "id") long id)
    {
        Optional<Pedido> pedido = pedidoRepository.findById(id);
        if(((Optional<?>) pedido).isPresent())
            return new ResponseEntity<Pedido>(pedido.get(), HttpStatus.OK);
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }


}
