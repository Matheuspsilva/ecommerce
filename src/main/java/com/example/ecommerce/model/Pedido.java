package com.example.ecommerce.model;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;

public class Pedido {

    private BigInteger id;
    private BigDecimal valor;
    private LocalDate dataPedido;
    private LocalDate dataEntrega;
    private String status;
    private String observacoes;

}
