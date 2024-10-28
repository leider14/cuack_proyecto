<%@page import="Modelo.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Productos</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  
    </head>
    <body>
        <div id="menu">
            <a href="indexUser.jsp"><img src="imagenes/iconos/logo.png" alt="logo"/></a>
            <a href="indexUser.jsp"><i class="fas fa-book"></i> Catálogo</a>
            <a href="sobreNosotros.jsp"><i class="fas fa-users"></i> Nosotros</a>
            <a href="consultarMisCompras.jsp"><i class="fas fa-file"></i> Consultar compras</a>
            <a href="carrito.jsp"><i class="fas fa-shopping-cart"></i> Carro de compras</a>
            <a href="buscador.jsp"><i class="fas fa-search"></i> Buscar</a>
            <a href="login.jsp?cerrar=true"> <i class="fas fa-user"></i><%=usuario%></a>
        </div>
        <div class="container mt-5">
            <h2 class="text-center">Buscar Productos</h2>
            <form action="ServletBuscarProducto" method="get" class="mt-4">
                <div class="form-group">
                    <input type="text" class="form-control" id="search" name="search" placeholder="Buscar productos..." required>
                </div>
                <button type="submit" class="btn btn-primary">Buscar</button>
            </form>

            <div class="mt-5">
                <h3>Resultados de la búsqueda:</h3>
                <div id="resultados">
                    <%
                        ArrayList<Productos> productos = (ArrayList<Productos>) request.getAttribute("productos");
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                            out.println("<p class='text-danger'>" + error + "</p>");
                        }
                        if (productos != null && !productos.isEmpty()) {
                            for (Productos producto : productos) {
                    %>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="imagenes/productos/<%= producto.getImagen()%>" class="card-img" alt="<%= producto.getNombre()%>">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= producto.getNombre()%></h5>
                                    <p class="card-text">Código: <%= producto.getCodigoProducto()%></p>
                                    <p class="card-text">Precio: $<%= producto.getPrecio()%></p>
                                    <button type="button" class="btn btn-primary" onclick="window.location = 'anadirCarrito.jsp?id=<%= producto.getCodigoProducto()%>'">Ver</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else if (request.getParameter("search") != null) {
                    %>
                    <p>No se encontraron productos para la búsqueda "<%= request.getParameter("search")%>".</p>
                    <% }%>
                </div>
            </div>
        </div>

        <footer class="footer mt-5 py-3 bg-dark text-white">
            <div class="container text-center">
                <p>&copy; 2024 Cuack Dev. Todos los derechos reservados.</p>
                <p>Contacto: contacto@Cuack Dev.com | Teléfono: (123) 456-7890</p>
            </div>
        </footer>
    </body>
</html>

<style>
    body{
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
        font-size: 18px;
        padding: 20px;
        text-decoration: none;
        color: #000;
    }

    #menu a:hover {
        color: #FFA500;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    }

    .card-img {
        border-radius: 10px 0 0 10px;
    }

    .card-body {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

</style>
