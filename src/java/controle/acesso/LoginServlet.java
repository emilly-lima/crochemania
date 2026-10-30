package controle.acesso;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.usuario.Usuario;
import modelo.usuario.UsuarioDAO;

/**
 * Controlador de login e criação de sessão de usuário no Crochê Mania.
 */
public class LoginServlet extends HttpServlet {
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (login == null || login.trim().isEmpty() || senha == null || senha.trim().isEmpty()) {
            request.setAttribute("mensagem", "Por favor, preencha o login e a senha.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.obterPorLogin(login.trim());
        boolean sucesso = (usuario != null && usuario.getSenha() != null && usuario.getSenha().equals(senha.trim()));

        if (sucesso) {
            HttpSession sessao = request.getSession(true);
            sessao.setAttribute("usuario", usuario);
            response.sendRedirect(request.getContextPath() + "/secure/principal.jsp");
        } else {
            request.setAttribute("mensagem", "Login ou senha inválidos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
