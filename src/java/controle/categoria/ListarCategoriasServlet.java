package controle.categoria;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import modelo.categoria.Categoria;
import modelo.categoria.CategoriaDAO;

/**
 * Consulta categorias filtrando por descrição e encaminha para a visualização.
 */
public class ListarCategoriasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String descricao = request.getParameter("descricao");
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> categorias = categoriaDAO.listar(descricao);
        request.setAttribute("categorias", categorias);
        request.getRequestDispatcher("/admin/listarCategoria.jsp").forward(request, response);
    }
}
