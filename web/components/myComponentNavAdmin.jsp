<%@page import="utils.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel de Administración</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            /* Configuración básica */
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            a:link, a:visited {
                text-decoration: none;
                color: inherit;
            }

            #menu {
                width: 100%;
                height: 80px;
                background-color: #343a40;
                color: #fff;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: fixed;
                top: 0;
                z-index: 1000;
                padding: 0 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s ease;
            }

            .menu-logo img {
                height: 50px;
                transition: transform 0.3s ease;
            }

            .menu-logo:hover img {
                transform: scale(1.1);
            }

            #menu a {
                font-size: 16px;
                padding: 10px 15px;
                display: flex;
                align-items: center;
                color: #fff;
                transition: all 0.3s ease;
            }

            #menu a i {
                margin-right: 8px;
                font-size: 20px;
            }

            #menu a:hover {
                color: #17a2b8;
                background-color: rgba(23, 162, 184, 0.2);
                border-radius: 5px;
            }

            .logout {
                background-color: #dc3545;
                padding: 12px 20px;
                border-radius: 5px;
            }

            .logout:hover {
                background-color: #c82333;
            }

            /* Responsividad */
            @media (max-width: 768px) {
                #menu {
                    flex-wrap: wrap;
                    justify-content: center;
                }

                #menu a {
                    font-size: 14px;
                    padding: 8px 12px;
                }

                #menu a i {
                    margin-right: 5px;
                }

                .menu-logo img {
                    height: 40px;
                }
            }

            @media (max-width: 480px) {
                #menu a {
                    font-size: 12px;
                    padding: 6px 10px;
                }

                #menu a i {
                    font-size: 16px;
                }
            }

            /* Efecto al hacer scroll */
            body.scrolled #menu {
                background-color: #212529;
            }
        </style>
    </head>
    <body>
        <div id="menu">
            <a href="<%=Routes.AdminHomePage%>" class="menu-logo">
                <img src="/imagenes/iconos/logo.png" alt="logo"/>
            </a>
            <a href="<%=Routes.AdminHomePage%>"><i class="fas fa-tachometer-alt"></i>Inicio</a>
            <a href="<%=Routes.AdminAddProductos%>"><i class="fas fa-box"></i> Productos</a>
            <a href="<%=Routes.AdminCategorias%>"><i class="fas fa-list"></i> Categorías</a>
            <a href="<%=Routes.AdminUsuarios%>"><i class="fas fa-user-cog"></i> Usuarios</a>
            <a href="<%=Routes.LoginPage%>?cerrar=true" class="logout"><i class="fas fa-sign-out-alt"></i> Salir</a>
        </div>

        <script>
            window.onscroll = function () {
                if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                    document.body.classList.add("scrolled");
                } else {
                    document.body.classList.remove("scrolled");
                }
            };
        </script>
    </body>
</html>
