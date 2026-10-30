package controle.categoria;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.categoria.Categoria;
import modelo.categoria.CategoriaDAO;

/**
 * Prepara o formulário de inclusão ou edição de categoria.
 */
public class CategoriaFormServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idParam.trim());
                CategoriaDAO categoriaDAO = new CategoriaDAO();
                Categoria categoria = categoriaDAO.obterPorId(id);
                request.setAttribute("categoria", categoria);
            } catch (NumberFormatException e) {
                // segue para novo cadastro
            }
        }
        request.getRequestDispatcher("/admin/formCategoria.jsp").forward(request, response);
    }
}
