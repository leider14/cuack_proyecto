<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<%
    int idCategoria = Integer.parseInt(request.getParameter("id"));
    Categoria categoria = CategoriaDB.obtenerCategoria(idCategoria);
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Categoría</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="icon" href="/imagenes/iconos/icono.png" >
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <jsp:include page="<%=Routes.MyComponentNavAdmin%>" />


        <div class="container mt-5">
            <h2 class="text-center">Eliminar Categoría</h2>
            <div class="alert alert-danger">
                ¿Está seguro de que desea eliminar la categoría <strong><%= categoria.getNombreCategoria()%>,</strong> tenga en cuenta que tambien eliminara los productos de esta categoria?
            </div>
            <div class="text-center">
                <form method="post" action="/ServletEliminarCategoria">
                    <input type="hidden" name="id" value="<%=idCategoria%>">
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                    <a href="/admin/adminCategorias.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
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
    .alert{
        max-width: 550px;
        margin: 20px auto;
    }
    body {
        padding-top: 100px;
        font-family: 'Roboto', sans-serif;
        font-size: 16px;
        background-color: #FFFFFF;
        display: flex;
        flex-direction: column;
        color: #333;
    }

    </style>
</html>
