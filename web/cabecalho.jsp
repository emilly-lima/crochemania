<%@page import="modelo.usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String servletPath = request.getServletPath();
    String paginaAtual = servletPath.substring(servletPath.lastIndexOf("/") + 1);
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crochê Mania — E-Commerce de Crochê Artesanal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Google Fonts: Mali e Baloo Bhai -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai&family=Mali:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <!-- Bootstrap 5 e Ícones -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        
        <!-- Identidade Visual Oficial do Crochê Mania -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css?v=<%= System.currentTimeMillis() %>">
        <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/img/favicon.png">
        <style>
            /* Bloqueio estrito de sublinhados e efeitos de hover (Bootstrap & User-Agent override) */
            a, a:hover, a:focus, a:active, a:visited,
            .brand, .brand:hover,
            .nav-list a, .nav-list a:hover,
            .nav-categorias a, .nav-categorias a:hover,
            .nav-categorias li a, .nav-categorias li a:hover,
            .titulo-categoria, .titulo-categoria:hover,
            .link-rodape a, .link-rodape a:hover,
            .produto-card a, .produto-card a:hover {
                text-decoration: none !important;
                outline: none !important;
            }
            .nav-categorias li a:hover,
            .produto-card:hover {
                transform: none !important;
                background: transparent !important;
                box-shadow: none !important;
            }
            /* Menus Dropdown (Meu Perfil e Administração) com background igual ao header */
            .site-header .dropdown-menu {
                background: linear-gradient(135deg, #5444AF 0%, #2D2365 100%) !important;
                background-color: #2D2365 !important;
                border: 1px solid rgba(254, 250, 238, 0.25) !important;
                border-radius: 12px !important;
                box-shadow: 0 8px 24px rgba(45, 35, 101, 0.3) !important;
                padding: 0.5rem 0 !important;
                margin-top: 0.5rem !important;
            }
            .site-header .dropdown-item {
                color: #FEFAEE !important;
                font-family: "Mali", cursive !important;
                font-size: 0.95rem !important;
                padding: 0.55rem 1.25rem !important;
                display: flex !important;
                align-items: center !important;
                gap: 0.5rem !important;
                background-color: transparent !important;
                text-decoration: none !important;
            }
            .site-header .dropdown-item:hover,
            .site-header .dropdown-item:focus {
                background-color: rgba(254, 250, 238, 0.18) !important;
                color: #FFFFFF !important;
                text-decoration: none !important;
            }
        </style>
    </head>
    <body>
        <header class="site-header">
            <div class="header-container">
                <a class="brand" href="<%= request.getContextPath() %>/index.jsp" aria-label="Crochemania — início">
                    Crochê Mania
                </a>

                <nav aria-label="Navegação principal">
                    <ul class="nav-list">
                        <% if (usuario != null) { %>
                            <li>
                                <span class="usuario-saudacao"><i class="bi bi-person-heart"></i> Olá, <%= usuario.getNome().split(" ")[0] %>!</span>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #FEFAEE;">
                                    <i class="bi bi-person-circle"></i> Meu Perfil
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="<%= request.getContextPath() %>/secure/principal.jsp">
                                            <i class="bi bi-person-vcard"></i> Visualizar Perfil
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="<%= request.getContextPath() %>/secure/UsuarioForm?id=<%= usuario.getId() %>">
                                            <i class="bi bi-pencil-square"></i> Alterar Dados
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <% if (Boolean.TRUE.equals(usuario.getAdministrador())) { %>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #FEFAEE;">
                                        <i class="bi bi-gear"></i> Administração
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/ListarCategoriaForm"><i class="bi bi-tags"></i> Gerenciar Categorias</a></li>
                                        <li><a class="dropdown-item" href="#"><i class="bi bi-box-seam"></i> Gerenciar Produtos</a></li>
                                    </ul>
                                </li>
                            <% } %>
                            <li>
                                <a href="<%= request.getContextPath() %>/Logout"><i class="bi bi-door-open"></i> Sair</a>
                            </li>
                        <% } else { %>

                            <li>
                                <a href="<%= request.getContextPath() %>/login.jsp"><i class="bi bi-box-arrow-in-right"></i> Entrar</a>
                            </li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </header>

        <%
            String mensagem = (String) request.getAttribute("mensagem");
            if (mensagem != null && mensagem.trim().length() > 0) {
        %>
        <div class="main-container" style="margin-top: 1.5rem; margin-bottom: 0;">
            <div class="alert alert-info alert-dismissible fade show" role="alert" style="border-radius: 12px; font-weight: 500;">
                <i class="bi bi-info-circle-fill me-2"></i><strong><%= mensagem %></strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fechar"></button>
            </div>
        </div>
        <%
            }
        %>
