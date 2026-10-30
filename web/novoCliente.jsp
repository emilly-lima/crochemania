<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho.jsp" %>

<main class="main-container">
    <div class="card-autenticacao">
        <h1 class="card-titulo">Crie sua Conta de Cliente</h1>
        <p class="card-subtitulo">Preencha seus dados para começar a adquirir peças exclusivas feitas à mão</p>

        <form action="<%= request.getContextPath() %>/InserirCliente" method="post" id="formCadastro" class="needs-validation" novalidate>
            <div class="form-grupo">
                <label for="formControlNome" class="form-label">Nome Completo *</label>
                <input type="text" name="nome" class="form-input form-control" id="formControlNome" placeholder="Ex: Maria da Silva" required/>
                <div class="invalid-feedback">
                    Informe seu nome completo.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlEndereco" class="form-label">Endereço Completo para Entrega *</label>
                <input type="text" name="endereco" class="form-input form-control" id="formControlEndereco" placeholder="Ex: Av. das Flores, 123 - Centro" required/>
                <div class="invalid-feedback">
                    Informe seu endereço de entrega.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlEmail" class="form-label">Endereço de E-mail *</label>
                <input type="email" name="email" class="form-input form-control" id="formControlEmail" placeholder="usuario@email.com" required/>
                <div class="invalid-feedback">
                    Informe um e-mail válido.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlLogin" class="form-label">Login de Acesso *</label>
                <input type="text" name="login" class="form-input form-control" id="formControlLogin" placeholder="Escolha um nome de usuário único" required/>
                <div class="invalid-feedback">
                    Escolha um login para acessar o sistema.
                </div>
            </div>

            <div class="form-grupo">
                <label for="formControlSenha" class="form-label">Senha *</label>
                <input type="password" name="senha" class="form-input form-control" id="formControlSenha" placeholder="Crie uma senha de acesso" required minlength="6"/>
                <div class="invalid-feedback">
                    Informe uma senha de no mínimo 6 caracteres.
                </div>
            </div>

            <button class="btn btn-primario mt-3" type="submit">
                <i class="bi bi-person-check me-2"></i> Finalizar Cadastro
            </button>

            <div class="link-rodape">
                Já possui cadastro? <a href="<%= request.getContextPath() %>/index.jsp#login">Clique aqui para entrar</a>
            </div>
        </form>
    </div>
</main>

<%@include file="rodape.jsp" %>
