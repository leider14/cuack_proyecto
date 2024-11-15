<%@page import="utils.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Catálogo</title>
    <link rel="icon" href="/imagenes/iconos/icono.png" >
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <!-- Menú Header -->
    <div id="menu">
        <a href="<%=Routes.UserHomePage %>" class="menu-logo">
            <img src="/imagenes/iconos/logo.png" alt="logo"/>
        </a>
        <a href="<%=Routes.UserHomePage %>"><i class="fas fa-book"></i> Catálogo</a>
        <a href="<%=Routes.UserAbout %>"><i class="fas fa-users"></i> Nosotros</a>
        <a href="<%=Routes.UserCompras %>"><i class="fas fa-box-open"></i> Consultar Compras</a>
        <a href="<%=Routes.UserCarrito %>"><i class="fas fa-shopping-cart"></i> Carro de Compras</a>
        <a href="<%=Routes.UserBusqueda %>"><i class="fas fa-search"></i> Buscar</a>
        <a href="<%=Routes.LoginPage %>?cerrar=true" class="logout"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
    </div>

</body>

<style>
    /* Estilo básico para los enlaces */
    a:link, a:visited {
        text-decoration: none;
        color: inherit;
    }

    /* Menú principal */
    #menu {
        width: 100%;
        height: 80px;
        background-color: #333;
        color: #fff;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        position: fixed;
        top: 0;
        z-index: 1000;
        padding: 0 20px;
    }

    /* Logo de menú */
    .menu-logo img {
        height: 50px;
        transition: transform 0.3s ease;
    }

    .menu-logo:hover img {
        transform: scale(1.1);
    }

    /* Estilo de los enlaces */
    #menu a {
        font-size: 16px;
        padding: 10px 15px;
        display: flex;
        align-items: center;
        color: #fff;
        transition: all 0.3s ease;
    }

    /* Espacio entre el icono y el texto */
    #menu a i {
        margin-right: 8px;
        font-size: 20px;
    }

    /* Hover de los enlaces */
    #menu a:hover {
        color: #FFA500;
        background-color: rgba(255, 165, 0, 0.2);
        border-radius: 5px;
    }

    /* Estilo para el enlace de Cerrar sesión */
    .logout {
        background-color: #e74c3c;
        padding: 12px 20px;
        border-radius: 5px;
    }

    .logout:hover {
        background-color: #c0392b;
    }

    /* Menú flotante cuando se hace scroll */
    #menu {
        transition: background-color 0.3s ease;
    }

    /* Fondo transparente al hacer scroll */
    body.scrolled #menu {
        background-color: #111;
    }

</style>

<!-- Script para cambiar color del menú al hacer scroll -->
<script>
    window.onscroll = function() {
        if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            document.body.classList.add("scrolled");
        } else {
            document.body.classList.remove("scrolled");
        }
    };
</script>

</html>
