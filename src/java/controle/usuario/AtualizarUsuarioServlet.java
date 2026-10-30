package controle.usuario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.usuario.UsuarioDAO;

/**
 * Atualiza os dados cadastrais do cliente no Crochê Mania.
 */
public class AtualizarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/secure/principal.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idParam.trim());
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            // Se a senha foi deixada em branco, recupera a senha atual para não sobrescrever com vazio
            if (senha == null || senha.trim().isEmpty()) {
                var usuarioAtual = usuarioDAO.obterPorId(id);
                if (usuarioAtual != null) {
                    senha = usuarioAtual.getSenha();
                }
            }

            boolean sucesso = usuarioDAO.atualizar(nome, endereco, email, login, senha, id);
            if (sucesso) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuario", usuarioDAO.obterPorId(id));
                request.setAttribute("mensagem", "Dados cadastrais atualizados com sucesso!");
            } else {
                request.setAttribute("mensagem", "Não foi possível atualizar os dados.");
            }
            request.getRequestDispatcher("/secure/UsuarioForm?id=" + id).forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/secure/principal.jsp");
        }
    }
}
