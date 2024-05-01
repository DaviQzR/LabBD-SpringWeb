package br.edu.fateczl.CRUDProdutos.persistence;

import java.sql.SQLException;
import java.util.List;

// Interface genérica para operações CRUD
public interface ICrud<T> {	
    
    // Consulta um objeto do tipo T
    public T consultar(T t) throws SQLException, ClassNotFoundException;
    
    // Lista todos os objetos do tipo T
    public List<T> listar() throws SQLException, ClassNotFoundException;
}
