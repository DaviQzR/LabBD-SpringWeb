package br.edu.fateczl.CRUDProdutos.persistence;

import java.sql.SQLException;
import java.util.List;
import br.edu.fateczl.CRUDProdutos.model.Produto;

// Interface para operações específicas de Produto
public interface IProdutoDao {
    
    // Insere, atualiza ou deleta um produto
    public String iudProduto(String acao, Produto p) throws SQLException, ClassNotFoundException;
    
    // Lista todos os produtos
    public List<Produto> listarProduto() throws SQLException, ClassNotFoundException;
}
