<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../cabecalho.jsp" %>

<main class="main-container">
    <div class="painel-grid">
        <section class="secao-perfil">
            <h1 class="card-titulo" style="text-align: left; font-size: 1.8rem;">
                <i class="bi bi-person-circle me-2" style="color: #5444AF;"></i>Painel da Conta
            </h1>
            <p class="card-subtitulo" style="text-align: left; margin-bottom: 1.5rem;">
                Bem-vindo ao seu espaço exclusivo no Crochê Mania
            </p>

            <div class="perfil-info-item">
                <span class="perfil-info-label">Identificador (ID):</span>
                <span class="perfil-info-valor">#<%= usuario.getId() %></span>
            </div>
            <div class="perfil-info-item">
                <span class="perfil-info-label">Nome Completo:</span>
                <span class="perfil-info-valor"><%= usuario.getNome() %></span>
            </div>
            <div class="perfil-info-item">
                <span class="perfil-info-label">Login de Acesso:</span>
                <span class="perfil-info-valor"><%= usuario.getLogin() %></span>
            </div>
            <div class="perfil-info-item">
                <span class="perfil-info-label">Endereço de E-mail:</span>
                <span class="perfil-info-valor"><%= usuario.getEmail() %></span>
            </div>
            <div class="perfil-info-item">
                <span class="perfil-info-label">Endereço de Entrega:</span>
                <span class="perfil-info-valor"><%= usuario.getEndereco() %></span>
            </div>
            <div class="perfil-info-item">
                <span class="perfil-info-label">Tipo de Perfil:</span>
                <span class="perfil-info-valor">
                    <strong><%= Boolean.TRUE.equals(usuario.getAdministrador()) ? "Administrador" : "Cliente" %></strong>
                </span>
            </div>

            <div class="d-flex flex-wrap gap-2 mt-4">
                <a href="<%= request.getContextPath() %>/secure/UsuarioForm?id=<%= usuario.getId() %>" class="btn btn-primary" style="background: #5444AF; border-color: #5444AF;">
                    <i class="bi bi-pencil-square me-1"></i> Alterar Meus Dados
                </a>
                <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-secondary">
                    <i class="bi bi-shop me-1"></i> Explorar Vitrine de Crochê
                </a>
            </div>

            <div class="zona-perigo mt-4">
                <h3 style="margin: 0; color: #D32F2F; font-size: 1.1rem;">
                    <i class="bi bi-exclamation-triangle me-1"></i> Exclusão de Conta
                </h3>
                <p style="margin: 0; font-size: 0.9rem; color: #666;">
                    Caso deseje remover sua conta, todos os seus dados cadastrais serão permanentemente excluídos do sistema.
                </p>
                <div>
                    <a href="<%= request.getContextPath() %>/secure/RemoverUsuario?id=<%= usuario.getId() %>" 
                       class="btn btn-perigo" 
                       onclick="return confirm('⚠️ Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.');">
                        <i class="bi bi-trash me-1"></i> Excluir Minha Conta Definitivamente
                    </a>
                </div>
            </div>
        </section>
    </div>
</main>

<%@include file="../rodape.jsp" %>
