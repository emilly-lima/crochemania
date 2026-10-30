package controle.usuario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.usuario.UsuarioDAO;

/**
 * Controlador para cadastro de novo cliente (administrador = false).
 */
public class InserirClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (nome == null || nome.trim().isEmpty() ||
            endereco == null || endereco.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            login == null || login.trim().isEmpty() ||
            senha == null || senha.trim().isEmpty()) {
            request.setAttribute("mensagem", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("/novoCliente.jsp").forward(request, response);
            return;
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        if (usuarioDAO.obterPorLogin(login.trim()) != null) {
            request.setAttribute("mensagem", "Este login já está em uso. Por favor, escolha outro.");
            request.getRequestDispatcher("/novoCliente.jsp").forward(request, response);
            return;
        }

        boolean sucesso = usuarioDAO.inserir(nome.trim(), endereco.trim(), email.trim(), login.trim(), senha.trim(), false);
        if (sucesso) {
            request.setAttribute("mensagem", "Cliente cadastrado com sucesso! Faça seu login para continuar.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.setAttribute("mensagem", "Não foi possível efetuar o cadastro. Verifique os dados.");
            request.getRequestDispatcher("/novoCliente.jsp").forward(request, response);
        }
    }
}
