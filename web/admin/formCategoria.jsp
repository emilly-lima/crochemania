<%@page import="modelo.categoria.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../cabecalho.jsp" %>
<%
    Categoria c = (Categoria) request.getAttribute("categoria");
    boolean edicao = (c != null && c.getId() != null);
%>

<main class="main-container">
    <div class="card-autenticacao" style="max-width: 600px;">
        <h1 class="card-titulo">
            <i class="bi bi-tag me-2" style="color: #5444AF;"></i><%= edicao ? "Editar Categoria" : "Nova Categoria" %>
        </h1>
        <p class="card-subtitulo">
            <%= edicao ? "Atualize a descrição da categoria selecionada" : "Cadastre uma nova linha de produtos de crochê" %>
        </p>

        <form action="<%= request.getContextPath() %>/admin/SalvarCategoria" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="<%= edicao ? c.getId() : "" %>" />

            <div class="form-grupo">
                <label for="formControlDescricao" class="form-label">Descrição da Categoria *</label>
                <input type="text" name="descricao" class="form-input form-control" id="formControlDescricao" 
                       placeholder="Ex: Amigurumi, Chaveiros, Bolsas..." 
                       value="<%= edicao ? c.getDescricao() : "" %>" required/>
                <div class="invalid-feedback">
                    Informe a descrição da categoria.
                </div>
            </div>

            <button class="btn btn-primario mt-3" type="submit">
                <i class="bi bi-floppy me-2"></i> <%= edicao ? "Salvar Alterações" : "Cadastrar Categoria" %>
            </button>

            <div class="mt-3 text-center">
                <a href="<%= request.getContextPath() %>/admin/ListarCategoriaForm" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Cancelar e Voltar à Lista
                </a>
            </div>
        </form>
    </div>
</main>

<%@include file="../rodape.jsp" %>
