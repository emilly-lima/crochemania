<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho.jsp" %>

<main class="main-container" style="margin-top: 2.5rem; margin-bottom: 3.5rem;">
    <div class="card-autenticacao" style="max-width: 480px; margin: 0 auto;">
        <h1 class="card-titulo">Acesse sua Conta</h1>
        <p class="card-subtitulo">Identifique-se para gerenciar seus pedidos e compras</p>

        <form action="<%= request.getContextPath() %>/Login" method="post" id="formLogin" class="needs-validation" novalidate>
            <div class="form-grupo">
                <label for="formControlLogin" class="form-label">Login de Usuário</label>
                <input type="text" name="login" class="form-input form-control" id="formControlLogin" placeholder="Digite seu login" required autocomplete="username"/>
                <div class="invalid-feedback">
                    Por favor, informe seu login de acesso.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlSenha" class="form-label">Senha</label>
                <input type="password" name="senha" class="form-input form-control" id="formControlSenha" placeholder="Digite sua senha" required autocomplete="current-password"/>
                <div class="invalid-feedback">
                    Por favor, informe sua senha.
                </div>
            </div>

            <button class="btn btn-primario mt-3" type="submit">
                <i class="bi bi-box-arrow-in-right me-2"></i> Entrar no Crochê Mania
            </button>

            <div class="link-rodape">
                Não tem uma conta ainda? <a href="<%= request.getContextPath() %>/novoCliente.jsp">Cadastre-se aqui</a>
            </div>
        </form>
    </div>
</main>

<%@include file="rodape.jsp" %>
