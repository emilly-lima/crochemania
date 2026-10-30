<%@page import="modelo.categoria.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../cabecalho.jsp" %>

<main class="main-container">
    <div class="card-autenticacao" style="max-width: 900px;">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1 class="card-titulo mb-0" style="font-size: 1.8rem; text-align: left;">
                <i class="bi bi-tags me-2" style="color: #5444AF;"></i>Gerenciamento de Categorias
            </h1>
            <a href="<%= request.getContextPath() %>/admin/CategoriaForm" class="btn btn-primary" style="background: #5444AF; border-color: #5444AF;">
                <i class="bi bi-plus-circle me-1"></i> Nova Categoria
            </a>
        </div>

        <p class="card-subtitulo" style="text-align: left; margin-bottom: 1.5rem;">
            Consulte, cadastre ou altere as categorias de produtos de crochê
        </p>

        <!-- Formulário de Consulta com Filtro -->
        <form action="<%= request.getContextPath() %>/admin/ListarCategorias" method="post" class="mb-4">
            <div class="input-group">
                <input type="text" name="descricao" class="form-control form-input" placeholder="Buscar categoria por descrição (ex: Amigurumi)..."/>
                <button class="btn btn-primario" type="submit" style="width: auto; padding: 0.8rem 1.5rem;">
                    <i class="bi bi-search me-1"></i> Filtrar
                </button>
            </div>
        </form>

        <%
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
            if (categorias != null && !categorias.isEmpty()) {
        %>
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead style="background-color: #ECE8F7; color: #2D2365;">
                    <tr>
                        <th scope="col" style="width: 10%;">#</th>
                        <th scope="col" style="width: 15%;">ID</th>
                        <th scope="col">Descrição</th>
                        <th scope="col" class="text-end" style="width: 30%;">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < categorias.size(); i++) { 
                        Categoria cat = categorias.get(i);
                    %>
                    <tr>
                        <td><strong><%= (i + 1) %></strong></td>
                        <td>#<%= cat.getId() %></td>
                        <td><%= cat.getDescricao() %></td>
                        <td class="text-end">
                            <a href="<%= request.getContextPath() %>/admin/CategoriaForm?id=<%= cat.getId() %>" class="btn btn-sm btn-secondary me-1">
                                <i class="bi bi-pencil-square"></i> Editar
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/ExcluirCategoria?id=<%= cat.getId() %>" 
                               class="btn btn-sm btn-perigo" 
                               onclick="return confirm('⚠️ Deseja realmente remover a categoria <%= cat.getDescricao() %>?');">
                                <i class="bi bi-trash"></i> Excluir
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } else if (request.getMethod().equalsIgnoreCase("POST")) { %>
            <div class="alert alert-warning" role="alert" style="border-radius: 10px;">
                <i class="bi bi-search me-2"></i>Nenhuma categoria encontrada com o termo informado.
            </div>
        <% } %>

        <div class="mt-4">
            <a href="<%= request.getContextPath() %>/secure/principal.jsp" class="btn btn-secondary">
                <i class="bi bi-arrow-left me-1"></i> Voltar ao Painel
            </a>
        </div>
    </div>
</main>

<%@include file="../rodape.jsp" %>
