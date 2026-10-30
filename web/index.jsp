<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabecalho.jsp" %>

<!-- Seção de Categorias de Produtos -->
<nav class="site-categorias" aria-label="Categorias de produtos" style="margin-top: 1.5rem;">
    <ul class="nav-categorias">
        <li>
            <a href="#amigurumi">
                <img src="<%= request.getContextPath() %>/img/amigurumi.svg" alt="Categoria Amigurumi">
                <div class="titulo-categoria" id="amigurumi">AMIGURUMI</div>
            </a>
        </li>
        <li>
            <a href="#chaveiros">
                <img src="<%= request.getContextPath() %>/img/chaveiros.svg" alt="Categoria Chaveiros">
                <div class="titulo-categoria" id="chaveiros">CHAVEIROS</div>
            </a>
        </li>
        <li>
            <a href="#acessorios">
                <img src="<%= request.getContextPath() %>/img/acessorios.svg" alt="Categoria Acessórios">
                <div class="titulo-categoria" id="acessorios">ACESSÓRIOS</div>
            </a>
        </li>
        <li>
            <a href="#roupas">
                <img src="<%= request.getContextPath() %>/img/roupas.svg" alt="Categoria Roupas">
                <div class="titulo-categoria" id="roupas">ROUPAS</div>
            </a>
        </li>
        <li>
            <a href="#bolsas">
                <img src="<%= request.getContextPath() %>/img/bolsas.svg" alt="Categoria Bolsas">
                <div class="titulo-categoria" id="bolsas">BOLSAS</div>
            </a>
        </li>
    </ul>
</nav>

<!-- Vitrine de Produtos em Destaque -->
<main class="vitrine-produtos">
    <h2 class="vitrine-titulo">Destaques da Nossa Coleção</h2>
    <div class="produtos-grid">
        <article class="produto-card">
            <img src="<%= request.getContextPath() %>/img/amigurumi.svg" alt="Polvo Amigurumi" class="produto-img">
            <h3 class="produto-nome">Polvo Amigurumi</h3>
            <p class="produto-preco">R$ 45,00</p>
            <button class="btn btn-primario" style="font-size: 0.9rem; padding: 0.6rem 1rem;">
                <i class="bi bi-cart-plus me-1"></i> Comprar
            </button>
        </article>

        <article class="produto-card">
            <img src="<%= request.getContextPath() %>/img/chaveiros.svg" alt="Chaveiro Coração" class="produto-img">
            <h3 class="produto-nome">Chaveiro Coração Crochê</h3>
            <p class="produto-preco">R$ 15,00</p>
            <button class="btn btn-primario" style="font-size: 0.9rem; padding: 0.6rem 1rem;">
                <i class="bi bi-cart-plus me-1"></i> Comprar
            </button>
        </article>

        <article class="produto-card">
            <img src="<%= request.getContextPath() %>/img/acessorios.svg" alt="Scrunchie de Crochê" class="produto-img">
            <h3 class="produto-nome">Scrunchie de Seda</h3>
            <p class="produto-preco">R$ 18,00</p>
            <button class="btn btn-primario" style="font-size: 0.9rem; padding: 0.6rem 1rem;">
                <i class="bi bi-cart-plus me-1"></i> Comprar
            </button>
        </article>

        <article class="produto-card">
            <img src="<%= request.getContextPath() %>/img/roupas.svg" alt="Top Cropped" class="produto-img">
            <h3 class="produto-nome">Top Cropped Colorido</h3>
            <p class="produto-preco">R$ 85,00</p>
            <button class="btn btn-primario" style="font-size: 0.9rem; padding: 0.6rem 1rem;">
                <i class="bi bi-cart-plus me-1"></i> Comprar
            </button>
        </article>

        <article class="produto-card">
            <img src="<%= request.getContextPath() %>/img/bolsas.svg" alt="Bolsa de Praia" class="produto-img">
            <h3 class="produto-nome">Bolsa Praia Fio de Malha</h3>
            <p class="produto-preco">R$ 120,00</p>
            <button class="btn btn-primario" style="font-size: 0.9rem; padding: 0.6rem 1rem;">
                <i class="bi bi-cart-plus me-1"></i> Comprar
            </button>
        </article>
    </div>
</main>

<%@include file="rodape.jsp" %>
