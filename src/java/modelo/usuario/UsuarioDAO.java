package modelo.usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe que implementa o padrão DAO para a entidade Usuario no Crochê Mania.
 */
public class UsuarioDAO {

    private static final String JDBC_DRIVER = "org.postgresql.Driver";
    private static final String JDBC_URL = System.getProperty("jdbc.url", System.getenv("JDBC_URL") != null ? System.getenv("JDBC_URL") : "jdbc:postgresql://localhost:5432/crochemania");
    private static final String JDBC_USUARIO = System.getProperty("jdbc.usuario", System.getenv("JDBC_USUARIO") != null ? System.getenv("JDBC_USUARIO") : "postgres");
    private static final String JDBC_SENHA = System.getProperty("jdbc.senha", System.getenv("JDBC_SENHA") != null ? System.getenv("JDBC_SENHA") : "ufc123");

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        return DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
    }

    /**
     * Lista todos os usuários cadastrados.
     */
    public List<Usuario> listar() {
        List<Usuario> resultado = new ArrayList<>();
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, nome, endereco, email, login, senha, administrador FROM usuario ORDER BY id ASC");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEndereco(resultSet.getString("endereco"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setLogin(resultSet.getString("login"));
                usuario.setSenha(resultSet.getString("senha"));
                usuario.setAdministrador(resultSet.getBoolean("administrador"));
                resultado.add(usuario);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return resultado;
        }
        return resultado;
    }

    /**
     * Obtém um usuário existente pelo ID.
     */
    public Usuario obterPorId(int id) {
        Usuario usuario = null;
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, nome, endereco, email, login, senha, administrador FROM usuario WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    usuario = new Usuario();
                    usuario.setId(resultSet.getInt("id"));
                    usuario.setNome(resultSet.getString("nome"));
                    usuario.setEndereco(resultSet.getString("endereco"));
                    usuario.setEmail(resultSet.getString("email"));
                    usuario.setLogin(resultSet.getString("login"));
                    usuario.setSenha(resultSet.getString("senha"));
                    usuario.setAdministrador(resultSet.getBoolean("administrador"));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return usuario;
    }

    /**
     * Obtém um usuário existente pelo login para autenticação.
     */
    public Usuario obterPorLogin(String login) {
        Usuario usuario = null;
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, nome, endereco, email, login, senha, administrador FROM usuario WHERE login = ?")) {
            preparedStatement.setString(1, login);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    usuario = new Usuario();
                    usuario.setId(resultSet.getInt("id"));
                    usuario.setNome(resultSet.getString("nome"));
                    usuario.setEndereco(resultSet.getString("endereco"));
                    usuario.setEmail(resultSet.getString("email"));
                    usuario.setLogin(resultSet.getString("login"));
                    usuario.setSenha(resultSet.getString("senha"));
                    usuario.setAdministrador(resultSet.getBoolean("administrador"));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return usuario;
    }

    /**
     * Insere um novo usuário no banco de dados.
     */
    public boolean inserir(String nome, String endereco, String email, String login, String senha, boolean administrador) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO usuario (nome, endereco, email, login, senha, administrador) VALUES (?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, endereco);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, login);
            preparedStatement.setString(5, senha);
            preparedStatement.setBoolean(6, administrador);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }

    /**
     * Atualiza os dados de um usuário existente, incluindo o status de administrador.
     */
    public boolean atualizar(String nome, String endereco, String email, String login, String senha, boolean administrador, int id) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE usuario SET nome = ?, endereco = ?, email = ?, login = ?, senha = ?, administrador = ? WHERE id = ?")) {
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, endereco);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, login);
            preparedStatement.setString(5, senha);
            preparedStatement.setBoolean(6, administrador);
            preparedStatement.setInt(7, id);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }

    /**
     * Atualiza os dados pessoais de um usuário (sem alterar privilégios de administrador).
     */
    public boolean atualizar(String nome, String endereco, String email, String login, String senha, int id) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE usuario SET nome = ?, endereco = ?, email = ?, login = ?, senha = ? WHERE id = ?")) {
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, endereco);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, login);
            preparedStatement.setString(5, senha);
            preparedStatement.setInt(6, id);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }

    /**
     * Remove um usuário pelo ID.
     */
    public boolean excluir(int id) {
        try (Connection connection = obterConexao();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM usuario WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            return (preparedStatement.executeUpdate() == 1);
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
    }
}
