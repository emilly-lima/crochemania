package filtro;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import modelo.usuario.Usuario;

/**
 * Filtro de segurança que protege rotas administrativas sob /admin/* garantindo perfil admin.
 */
public class AdministradorFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession sessao = req.getSession(false);
        Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
        boolean admin = (usuario != null && Boolean.TRUE.equals(usuario.getAdministrador()));
        if (admin) {
            chain.doFilter(request, response);
        } else {
            request.setAttribute("mensagem", "Acesso restrito a administradores do sistema.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
