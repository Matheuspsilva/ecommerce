package com.example.ecommerce.repository;

import com.example.ecommerce.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EnderecoRepository extends JpaRepository<Cliente, Long> {
}
