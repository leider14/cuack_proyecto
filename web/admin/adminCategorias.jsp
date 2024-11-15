<%@page import="utils.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Categorías</title>
        <link rel="icon" href="/imagenes/iconos/icono.png" >
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="<%=Routes.MyComponentNavAdmin%>" />

        <div class="container mt-5">
            <h2 class="text-center">Listar Categorías</h2>
            <table class="table table-striped mt-4">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Categoria> categorias = CategoriaDB.obtenerCategorias();
                        for (Categoria categoria : categorias) {
                    %>
                    <tr>
                        <td><%= categoria.getIdCategoria() %></td>
                        <td><%= categoria.getNombreCategoria() %></td>
                        <td>
                            <a href="/admin/editarCategoria.jsp?id=<%= categoria.getIdCategoria() %>" class="btn btn-primary btn-sm">Editar</a>
                            <a href="/admin/eliminarCategoria.jsp?id=<%= categoria.getIdCategoria() %>" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="text-center mt-4">
                <a href="/admin/registrarCategoria.jsp" class="btn btn-success">Registrar Nueva Categoría</a>
            </div>
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
