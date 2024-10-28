<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.UsuarioDB"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Administrar Usuarios</title>
    <link rel="icon" href="imagenes/iconos/icono.png" >
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="menu">
        <a href="index.jsp"><img src="imagenes/iconos/logo.png" alt="logo"/></a>
        <a href="index.jsp">Catálogo</a>
        <a href="registrarProducto.jsp">Registrar Productos</a>
        <a href="categorias.jsp">Categorias</a>
        <a href="adminUsuario.jsp">Usuarios</a>
        <a href="login.jsp?cerrar=true"><%= usuario%></a>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Administrar Usuarios</h2>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuario</th>
                    <th>Nivel</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Usuario> usuarios = UsuarioDB.obtenerUsuarios();
                    for (Usuario u : usuarios) {
                %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getUsuario() %></td>
                    <td><%= u.getNivel() %></td>
                    <td>
                        <a href="modificarUsuario.jsp?id=<%= u.getId() %>" class="btn btn-warning">Editar</a>
                        <a href="ServletAgregarUsuario?action=eliminarUsuario&id=<%= u.getId() %>" class="btn btn-danger">Eliminar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    
        <a href="registrarUsuario.jsp" class="btn btn-primary mb-3">Registrar Nuevo Usuario</a>
    </div>

    <footer class="footer mt-5 py-3 bg-dark text-white">
        <div class="container text-center">
            <p>&copy; 2024 Cuack Dev. Todos los derechos reservados.</p>
            <p>Contacto: contacto@Cuack Dev.com | Teléfono: (123) 456-7890</p>
        </div>
    </footer>
</body>
     <style>
    * {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
    }

    body {
        padding-top: 100px;
        font-family: 'Roboto', sans-serif;
        font-size: 16px;
        background-color: #FFFFFF;
        color: #333;
    }
    
    a:link {
        text-decoration: none;
    }

    #menu {
        width: 100%;
        height: 70px;
        font-size: 22px;
        background: #F5F5F5;
        color: #0E0912;
        display: flex;
        justify-content: space-around;
        align-items: center;
        position: fixed;
        top: 0;
        z-index: 1000;
    }

    #menu img {
        height: 60px;
    }

    #menu a {
        padding: 20px;
        text-decoration: none;
        color: #0E0912;
    }

    #menu a:hover {
        color: #FFA500;
    }
    </style>
</html>
