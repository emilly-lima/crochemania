package controle.categoria;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.categoria.CategoriaDAO;

/**
 * Remove uma categoria existente.
 */
public class ExcluirCategoriaServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idParam.trim());
                CategoriaDAO categoriaDAO = new CategoriaDAO();
                boolean sucesso = categoriaDAO.excluir(id);
                if (sucesso) {
                    request.setAttribute("mensagem", "Categoria removida com sucesso!");
                } else {
                    request.setAttribute("mensagem", "Não foi possível remover a categoria.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Identificador de categoria inválido.");
            }
        }
        request.getRequestDispatcher("/admin/ListarCategoriaForm").forward(request, response);
    }
}
