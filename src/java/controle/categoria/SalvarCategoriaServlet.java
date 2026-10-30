package controle.categoria;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.categoria.CategoriaDAO;

/**
 * Salva (insere ou atualiza) uma categoria no Crochê Mania.
 */
public class SalvarCategoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String descricao = request.getParameter("descricao");

        if (descricao == null || descricao.trim().isEmpty()) {
            request.setAttribute("mensagem", "A descrição da categoria é obrigatória.");
            request.getRequestDispatcher("/admin/formCategoria.jsp").forward(request, response);
            return;
        }

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        boolean sucesso;

        if (idParam == null || idParam.trim().isEmpty()) {
            // Inserir
            sucesso = categoriaDAO.inserir(descricao.trim());
        } else {
            // Atualizar
            try {
                int id = Integer.parseInt(idParam.trim());
                sucesso = categoriaDAO.atualizar(descricao.trim(), id);
            } catch (NumberFormatException e) {
                sucesso = false;
            }
        }

        if (sucesso) {
            request.setAttribute("mensagem", "Categoria salva com sucesso!");
        } else {
            request.setAttribute("mensagem", "Não foi possível salvar a categoria.");
        }
        request.getRequestDispatcher("/admin/ListarCategoriaForm").forward(request, response);
    }
}
