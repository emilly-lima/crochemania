package filtro;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import modelo.usuario.Usuario;

/**
 * Filtro de segurança que protege rotas sob /secure/* garantindo sessão ativa.
 */
public class SegurancaFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession sessao = req.getSession(false);
        Usuario usuario = (sessao != null) ? (Usuario) sessao.getAttribute("usuario") : null;
        boolean autenticado = (usuario != null);
        if (autenticado) {
            chain.doFilter(request, response);
        } else {
            request.setAttribute("mensagem", "Você precisa entrar para acessar esta área.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
