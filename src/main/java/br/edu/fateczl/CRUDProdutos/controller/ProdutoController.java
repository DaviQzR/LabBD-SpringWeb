package br.edu.fateczl.CRUDProdutos.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.CRUDProdutos.model.Produto;
import br.edu.fateczl.CRUDProdutos.persistence.GenericDao;
import br.edu.fateczl.CRUDProdutos.persistence.ProdutoDao;

@Controller
public class ProdutoController {

    @Autowired
    GenericDao gDao;

    @Autowired
    ProdutoDao pDao;

    // Página inicial do produto
    @RequestMapping(name = "produto", value = "/produto", method = RequestMethod.GET)
    public ModelAndView indexGet(@RequestParam Map<String, String> allRequestParam, ModelMap model) {
        // Obtém os parâmetros da requisição
        String cmd = allRequestParam.get("cmd");
        String codigo = allRequestParam.get("codigo");

        if (cmd != null) {
            Produto p = new Produto();
            p.setCodigo(Integer.parseInt(codigo));

            String saida = "";
            String erro = "";
            List<Produto> produtos = new ArrayList<>();

            try {
                if (cmd.contains("alterar")) {
                    p = buscarProduto(p);
                } else if (cmd.contains("excluir")) {
                    saida = excluirProduto(p);
                }

                produtos = listarProdutos();

            } catch (SQLException | ClassNotFoundException e) {
                erro = e.getMessage();
            } finally {
                model.addAttribute("saida", saida);
                model.addAttribute("erro", erro);
                model.addAttribute("produto", p);
                model.addAttribute("produtos", produtos);
            }
        }
        // Retorna a página "produto.jsp"
        return new ModelAndView("produto");
    }

    // Processa o formulário submetido pelo método POST
    @RequestMapping(name = "produto", value = "/produto", method = RequestMethod.POST)
    public ModelAndView indexPost(@RequestParam Map<String, String> allRequestParam, ModelMap model) {
        // Obtém os parâmetros do formulário
        String cmd = allRequestParam.get("botao");
        String codigo = allRequestParam.get("codigo");
        String nome = allRequestParam.get("nome");
        String valorUnitario = allRequestParam.get("valorUnitario");
        String qtdEstoque = allRequestParam.get("qtdEstoque");

        String saida = "";
        String erro = "";
        Produto p = new Produto();
        List<Produto> produtos = new ArrayList<>();

        if (!cmd.contains("Listar")) {
            p.setCodigo(Integer.parseInt(codigo));
        }
        if (cmd.contains("Cadastrar") || cmd.contains("Alterar")) {
            p.setNome(nome);
            p.setValorUnitario(Float.parseFloat(valorUnitario));
            p.setQtdEstoque(Integer.parseInt(qtdEstoque));
        }

        try {
            if (cmd.contains("Cadastrar")) {
                saida = cadastrarProduto(p);
                p = null;
            }
            if (cmd.contains("Alterar")) {
                saida = alterarProduto(p);
                p = null;
            }
            if (cmd.contains("Excluir")) {
                saida = excluirProduto(p);
                p = null;
            }
            if (cmd.contains("Buscar")) {
                p = buscarProduto(p);
            }
            if (cmd.contains("Listar")) {
                produtos = listarProdutos();
            }

        } catch (SQLException | ClassNotFoundException e) {
            erro = e.getMessage();
        } finally {
            model.addAttribute("saida", saida);
            model.addAttribute("erro", erro);
            model.addAttribute("produto", p);
            model.addAttribute("produtos", produtos);
        }

        // Retorna a página "produto.jsp"
        return new ModelAndView("produto");
    }

    // Método para cadastrar um produto
    private String cadastrarProduto(Produto p) throws SQLException, ClassNotFoundException {
        return pDao.iudProduto("I", p);
    }

    // Método para alterar um produto
    private String alterarProduto(Produto p) throws SQLException, ClassNotFoundException {
        return pDao.iudProduto("U", p);
    }

    // Método para excluir um produto
    private String excluirProduto(Produto p) throws SQLException, ClassNotFoundException {
        // Verifica se o valorUnitario é nulo e, se for, define como 0
        Float valorUnitario = (p.getValorUnitario() != null) ? p.getValorUnitario().floatValue() : 0.0f;
        p.setValorUnitario(valorUnitario);
        // Chama o método de exclusão do DAO
        return pDao.iudProduto("D", p);
    }

    // Método para buscar um produto
    private Produto buscarProduto(Produto p) throws SQLException, ClassNotFoundException {
        // Chama o método de consulta do DAO
        return pDao.consultar(p);
    }

    // Método para listar todos os produtos
    private List<Produto> listarProdutos() throws SQLException, ClassNotFoundException {
        // Chama o método de listagem do DAO
        return pDao.listar();
    }
}
