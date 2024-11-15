<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
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
    <link rel="icon" href="/imagenes/iconos/icono.png" >
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="<%=Routes.MyComponentNavAdmin%>" />
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
                        <a href="/ServletAgregarUsuario?action=eliminarUsuario&id=<%= u.getId() %>" class="btn btn-danger">Eliminar</a>
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
    
    </style>
</html>
