<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <footer class="site-footer">
            <div class="container text-center">
                <p class="mb-1">&copy; <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %> Crochê Mania — Desenvolvido por Emilly Barbosa de Lima.</p>
                <small style="opacity: 0.85;">Sistema de e-commerce “Crochê Mania” desenvolvido para a cadeira de Programação Web</small>
            </div>
        </footer>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Script de Validação de Formulários -->
        <script src="<%= request.getContextPath() %>/js/validation.js"></script>
    </body>
</html>
