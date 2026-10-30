package controle.usuario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.usuario.Usuario;
import modelo.usuario.UsuarioDAO;

/**
 * Prepara o formulário de alteração de dados pessoais do usuário.
 */
public class UsuarioFormServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/secure/principal.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idParam.trim());
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.obterPorId(id);
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("/secure/alterarUsuario.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/secure/principal.jsp");
        }
    }
}
