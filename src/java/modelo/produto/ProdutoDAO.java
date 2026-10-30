package modelo.produto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe que implementa o padrão DAO para a entidade Produto no Crochê Mania.
 */
public class ProdutoDAO {

    private static final String JDBC_DRIVER = "org.postgresql.Driver";
    private static final String JDBC_URL = System.getProperty("jdbc.url", System.getenv("JDBC_URL") != null ? System.getenv("JDBC_URL") : "jdbc:postgresql://localhost:5432/crochemania");
    private static final String JDBC_USUARIO = System.getProperty("jdbc.usuario", System.getenv("JDBC_USUARIO") != null ? System.getenv("JDBC_USUARIO") : "postgres");
    private static final String JDBC_SENHA = System.getProperty("jdbc.senha", System.getenv("JDBC_SENHA") != null ? System.getenv("JDBC_SENHA") : "ufc123");

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        return DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
    }

    /**
     * Lista produtos que possuem estoque disponível (quantidade > 0).
     */
    public List<Produto> listarEmEstoque() {
        List<Produto> resultado = new ArrayList<>();
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, descricao, preco, foto, quantidade, categoria_id FROM produto WHERE quantidade > 0 ORDER BY id ASC");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Produto produto = new Produto();
                produto.setId(resultSet.getInt("id"));
                produto.setDescricao(resultSet.getString("descricao"));
                produto.setPreco(resultSet.getDouble("preco"));
                produto.setFoto(resultSet.getString("foto"));
                produto.setQuantidade(resultSet.getInt("quantidade"));
                produto.setCategoriaId(resultSet.getInt("categoria_id"));
                resultado.add(produto);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return resultado;
        }
        return resultado;
    }

    /**
     * Obtém um produto pelo ID.
     */
    public Produto obterPorId(int id) {
        Produto produto = null;
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, descricao, preco, foto, quantidade, categoria_id FROM produto WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    produto = new Produto();
                    produto.setId(resultSet.getInt("id"));
                    produto.setDescricao(resultSet.getString("descricao"));
                    produto.setPreco(resultSet.getDouble("preco"));
                    produto.setFoto(resultSet.getString("foto"));
                    produto.setQuantidade(resultSet.getInt("quantidade"));
                    produto.setCategoriaId(resultSet.getInt("categoria_id"));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return produto;
    }
}
