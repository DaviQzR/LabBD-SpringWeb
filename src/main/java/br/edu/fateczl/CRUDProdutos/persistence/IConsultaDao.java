package br.edu.fateczl.CRUDProdutos.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.CRUDProdutos.model.Produto;

// Interface para operações de consulta específicas
public interface IConsultaDao {
    
    // Lista produtos com base em um valor específico
    public List<Produto> listarProduto(int valor) throws SQLException, ClassNotFoundException;
    
    // Calcula a quantidade de produtos abaixo de um determinado valor
    public int calcularQtdProdutos(int QtdProdutos) throws SQLException, ClassNotFoundException;

}
