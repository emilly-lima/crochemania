<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../cabecalho.jsp" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
    if (u == null) {
        u = usuario;
    }
%>

<main class="main-container">
    <div class="card-autenticacao">
        <h1 class="card-titulo">Alterar Dados Pessoais</h1>
        <p class="card-subtitulo">Atualize suas informações cadastrais para entregas e segurança</p>

        <form action="<%= request.getContextPath() %>/secure/AtualizarUsuario" method="post" id="formAtualizar" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="<%= u != null ? u.getId() : "" %>" />

            <div class="form-grupo">
                <label for="formControlNome" class="form-label">Nome Completo *</label>
                <input type="text" name="nome" class="form-input form-control" id="formControlNome" value="<%= u != null ? u.getNome() : "" %>" required/>
                <div class="invalid-feedback">
                    Informe seu nome completo.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlEndereco" class="form-label">Endereço de Entrega *</label>
                <input type="text" name="endereco" class="form-input form-control" id="formControlEndereco" value="<%= u != null ? u.getEndereco() : "" %>" required/>
                <div class="invalid-feedback">
                    Informe seu endereço de entrega.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlEmail" class="form-label">Endereço de E-mail *</label>
                <input type="email" name="email" class="form-input form-control" id="formControlEmail" value="<%= u != null ? u.getEmail() : "" %>" required/>
                <div class="invalid-feedback">
                    Informe um e-mail válido.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlLogin" class="form-label">Login de Acesso *</label>
                <input type="text" name="login" class="form-input form-control" id="formControlLogin" value="<%= u != null ? u.getLogin() : "" %>" required/>
                <div class="invalid-feedback">
                    Informe seu login de acesso.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlSenha" class="form-label">Nova Senha (deixe em branco para manter a atual)</label>
                <input type="password" name="senha" class="form-input form-control" id="formControlSenha" placeholder="Digite uma nova senha caso queira alterar"/>
            </div>

            <button class="btn btn-primario mt-3" type="submit">
                <i class="bi bi-floppy me-2"></i> Salvar Alterações
            </button>

            <div class="d-flex justify-content-between align-items-center mt-3">
                <a href="<%= request.getContextPath() %>/secure/principal.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Voltar ao Painel
                </a>
                
                <a href="<%= request.getContextPath() %>/secure/RemoverUsuario?id=<%= u != null ? u.getId() : "" %>" 
                   class="btn btn-perigo" 
                   onclick="return confirm('⚠️ Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.');">
                    <i class="bi bi-trash me-1"></i> Excluir Conta
                </a>
            </div>
        </form>
    </div>
</main>

<%@include file="../rodape.jsp" %>
