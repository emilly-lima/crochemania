package controle.usuario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.usuario.UsuarioDAO;

/**
 * Remove o cadastro do usuário e encerra a sessão.
 */
public class RemoverUsuarioServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idParam.trim());
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                boolean sucesso = usuarioDAO.excluir(id);
                if (sucesso) {
                    request.setAttribute("mensagem", "Sua conta foi excluída com sucesso.");
                } else {
                    request.setAttribute("mensagem", "Não foi possível excluir a conta.");
                }
            } catch (NumberFormatException e) {
                // ignora e prossegue para logout
            }
        }
        request.getRequestDispatcher("/Logout").forward(request, response);
    }
}
