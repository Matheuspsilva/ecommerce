package com.example.ecommerce.repository;

import com.example.ecommerce.model.Cliente;
import com.example.ecommerce.model.Endereco;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EnderecoRepository extends JpaRepository<Cliente, Long> {
    @Query("from Endereco where cliente_id=?1")
    public List<Endereco> buscarClienteEndereco(long id);

    @Query("from Endereco where id=?1")
    public List<Endereco> buscarEndereco(long id);

}
