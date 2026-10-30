package modelo.categoria;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe que implementa o padrão DAO para a entidade Categoria no Crochê Mania.
 */
public class CategoriaDAO {

    private static final String JDBC_DRIVER = "org.postgresql.Driver";
    private static final String JDBC_URL = System.getProperty("jdbc.url", System.getenv("JDBC_URL") != null ? System.getenv("JDBC_URL") : "jdbc:postgresql://localhost:5432/crochemania");
    private static final String JDBC_USUARIO = System.getProperty("jdbc.usuario", System.getenv("JDBC_USUARIO") != null ? System.getenv("JDBC_USUARIO") : "postgres");
    private static final String JDBC_SENHA = System.getProperty("jdbc.senha", System.getenv("JDBC_SENHA") != null ? System.getenv("JDBC_SENHA") : "ufc123");

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        return DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
    }

    /**
     * Lista todas as categorias.
     */
    public List<Categoria> listar() {
        List<Categoria> resultado = new ArrayList<>();
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, descricao FROM categoria ORDER BY id ASC");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt("id"));
                categoria.setDescricao(resultSet.getString("descricao"));
                resultado.add(categoria);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return resultado;
        }
        return resultado;
    }

    /**
     * Lista categorias filtradas por descrição.
     */
    public List<Categoria> listar(String descricao) {
        if (descricao == null || descricao.trim().length() == 0) {
            descricao = "%";
        } else {
            descricao = "%" + descricao.trim() + "%";
        }
        List<Categoria> resultado = new ArrayList<>();
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, descricao FROM categoria WHERE descricao ILIKE ? ORDER BY id ASC")) {
            preparedStatement.setString(1, descricao);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Categoria categoria = new Categoria();
                    categoria.setId(resultSet.getInt("id"));
                    categoria.setDescricao(resultSet.getString("descricao"));
                    resultado.add(categoria);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return resultado;
        }
        return resultado;
    }

    /**
     * Obtém uma categoria existente pelo ID.
     */
    public Categoria obterPorId(int id) {
        Categoria categoria = null;
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, descricao FROM categoria WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    categoria = new Categoria();
                    categoria.setId(resultSet.getInt("id"));
                    categoria.setDescricao(resultSet.getString("descricao"));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return categoria;
    }

    /**
     * Insere uma nova categoria.
     */
    public boolean inserir(String descricao) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO categoria (descricao) VALUES (?)")) {
            preparedStatement.setString(1, descricao);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }

    /**
     * Atualiza uma categoria existente.
     */
    public boolean atualizar(String descricao, int id) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categoria SET descricao = ? WHERE id = ?")) {
            preparedStatement.setString(1, descricao);
            preparedStatement.setInt(2, id);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }

    /**
     * Exclui uma categoria existente.
     */
    public boolean excluir(int id) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM categoria WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }
}
