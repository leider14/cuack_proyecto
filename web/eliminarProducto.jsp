

<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.ProductoDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Categoria"%>
<%@page import="Modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    Productos p = ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar producto</title>
        <link rel="icon" href="imagenes/iconos/icono.png" >
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <div id="menu">
        <a href="index.jsp"><img src="imagenes/iconos/logo.png" alt="logo"/></a>
        <a href="index.jsp">Catálogo</a>
        <a href="registrarProducto.jsp">Registrar Productos</a>
        <a href="categorias.jsp">Categorias</a>
        <a href="adminUsuario.jsp">Usuarios</a>
        <a href="login.jsp?cerrar=true"><%= usuario%></a>
    </div>
    <body>
        <div class="card">
            <img src="imagenes/productos/<%= p.getImagen()%>" class="img-fluid card-img-top" alt="<%= p.getNombre()%>">
            <div class="card-body">
                <h4>¿Está seguro de eliminar este producto?</h4>
                <h5 class="card-title"><%= p.getNombre()%></h5>
                <p class="card-text">$<%= p.getPrecio()%></p>
                <form action="ServletEliminarProducto" method="post" >
                    <input type="hidden" name="id" value="<%= p.getCodigoProducto()%>">
                    <button onclick="window.location = 'index.jsp'" type="button" class="btn btn-secondary">Cancelar</button>
                    <button type="submit" class="btn btn-danger" >Eliminar</button>
                </form>
            </div>
        </div>
    </body>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-content: center;
            justify-items: center;
            align-items: center;
        }
        .card {
            max-width: 300px;
        }

    </style>

    <style>
        * {
            padding: 0px;
            margin: 0px;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            background-color: #FFFFFF;
            color: #333;
            padding-top: 50px;
        }

        a:link {
            text-decoration: none;
        }

        #menu {
            width: 100%;
            height: 70px;
            font-size: 22px;
            background: #fff;
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
            color: #000;
        }

        #menu a:hover {
            color: #FFA500;
        }

        .container {
            margin-top: 100px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #FFA500;
            border: none;
            transition: background 0.3s, box-shadow 0.3s;
        }

        .btn-primary:hover {
            background-color: #FF4500;
            box-shadow: 0px 0px 10px 2px rgba(255, 69, 0, 0.5);
        }

        .footer {
            background-color: #000;
            color: #FFF;
            padding: 20px 0;
            text-align: center;
        }
    </style>

</html>
