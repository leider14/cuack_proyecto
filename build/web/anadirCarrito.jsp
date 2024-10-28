<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
    Productos p = ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
    HttpSession sesion = request.getSession();

    String usuario = sesion.getAttribute("user").toString();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir al Carrito</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            <h2 class="text-center">Añadir producto al carrito</h2>
            <div class="row">
                <div class="col-md-6">
                    <img id="img-product" src="imagenes/productos/<%=p.getImagen()%>" class="img-fluid" alt="<%= p.getNombre()%>">
                </div>
                <div class="col-md-6">
                    <form method="post" action="ServletAgregarCarrito">
                        <div class="form-group">
                            <label for="codigo">Código:</label>
                            <input type="text" class="form-control" id="codigo" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="txtNombre" value="<%= p.getNombre()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="precio">Precio:</label>
                            <input type="text" class="form-control" id="precio" name="txtPrecio" value="<%= p.getPrecio()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="cantidad">Cantidad:</label>
                            <input type="number" class="form-control" id="cantidad" value="1" min="0" name="txtCantidad">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Añadir</button>
                        <input type="hidden" name="codigoProducto" value="<%= p.getCodigoProducto()%>">
                    </form>
                    <button class="btn btn-secondary btn-block mt-2" onclick="window.history.back();">Volver</button>
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
    * {
        padding: 0;
        margin: 0;
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
        color: #000;
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

    .container {
        margin-top: 100px;
    }

    footer {
        background-color: #000;
        color: #FFF;
        padding: 20px 0;
        text-align: center;
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
    #img-product{
      width:   70%;  
    }

    .btn-secondary {
        background-color: #6c757d;
        border: none;
        transition: background 0.3s, box-shadow 0.3s;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
        box-shadow: 0px 0px 10px 2px rgba(90, 98, 104, 0.5);
    }

    .form-group {
        margin-top: 20px;
    }

</style>