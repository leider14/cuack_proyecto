<%@page import="Modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList, Modelo.*"  %>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo</title>
        <link rel="icon" href="imagenes/iconos/icono.png" >
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
            <a href="consultarMisCompras.jsp"><i class="fas fa-users"></i> Consultar compras</a>
            <a href="carrito.jsp"><i class="fas fa-shopping-cart"></i> Carro de compras</a>
            <a href="buscador.jsp"><i class="fas fa-search"></i> Buscar</a>
            <a href="login.jsp?cerrar=true"> <i class="fas fa-user"></i><%=usuario%></a>
        </div>

        <!-- Carrusel -->
        <div id="bannerCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="imagenes/carrusel/banner1.jpg" class="d-block w-100" alt="Banner 1">
                </div>
                <div class="carousel-item">
                    <img src="imagenes/carrusel/banner2.jpg" class="d-block w-100" alt="Banner 2">
                </div>
                <div class="carousel-item">
                    <img src="imagenes/carrusel/banner3.jpg" class="d-block w-100" alt="Banner 3">
                </div>
                <div class="carousel-item">
                    <img src="imagenes/carrusel/banner4.jpg" class="d-block w-100" alt="Banner 4">
                </div>
                <div class="carousel-item">
                    <img src="imagenes/carrusel/banner5.jpg" class="d-block w-100" alt="Banner 5">
                </div>
            </div>
            <a class="carousel-control-prev" href="#bannerCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#bannerCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!-- Sección de Promociones -->
        <div id="promociones" class="container mt-5">
            <h2 class="text-center">Promociones Especiales</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="promo-item">
                        <img src="imagenes/promociones/promo1.jpg" class="img-fluid" alt="Promoción 1">
                        <h3>Promoción de Manzanas</h3>
                        <p>Llevate una libra  de manzanas Gratis</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="promo-item">
                        <img src="imagenes/promociones/promo2.jpg" class="img-fluid" alt="Promoción 2">
                        <h3>Combo Especial</h3>
                        <p>Compra 2 pares de zapatos y lleva un accesorio gratis.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="promo-item">
                        <img src="imagenes/promociones/promo3.jpg" class="img-fluid" alt="Promoción 3">
                        <h3>Envío Gratis 31 de Octubre</h3>
                        <p>Gratis 31 de Octubre en compras superiores a $100.</p>
                    </div>
                </div>
            </div>
        </div>


        <!-- Sección de Categorías -->
        <div id="catalogo" class="container mt-5">
            <h2 class="text-center">Catálogo de Productos</h2>
            <%
                ArrayList<Categoria> categorias = CategoriaDB.obtenerCategorias();
                for (int i = 0; i < categorias.size(); i++) {
                    Categoria categoria = categorias.get(i);
            %>
            <div class="row">
                <h3 class="col-12"><%= categoria.getNombreCategoria()%></h3>
                <%
                    ArrayList<Productos> productos = ProductoDB.obtenerProductosPorCategoria(categoria.getIdCategoria());
                    for (int a = 0; a < productos.size(); a++) {
                        Productos producto = productos.get(a);
                %>
                <div class="col-md-3">
                    <div class="card">
                        <img src="imagenes/productos/<%= producto.getImagen()%>" class="img-fluid card-img-top" alt="<%= producto.getNombre()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%= producto.getNombre()%></h5>
                            <p class="card-text">$<%= producto.getPrecio()%></p>
                            <button type="button" class="btn btn-primary" onclick="window.location = 'anadirCarrito.jsp?id=<%= producto.getCodigoProducto()%>'">Agregar Carrito</button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% }%>
        </div>


        <!-- Footer -->
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
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
    }

    body {
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
        height: 40px;
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

    #bannerCarousel .carousel-inner img {
        height: 500px;
        object-fit: cover;
    }

    #bannerCarousel .carousel-control-prev-icon,
    #bannerCarousel .carousel-control-next-icon {
        background-color: #000;
        border-radius: 50%;
    }

    .container {
        margin-top: 100px;
    }

    #promociones .promo-item {
        text-align: center;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
        margin: 10px 0;
        background-color: #f9f9f9;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    #promociones .promo-item:hover {
        transform: scale(1.05);
        box-shadow: 0px 0px 15px 5px rgba(255, 165, 0, 0.4);
    }

    #catalogo {
        align-content: center;
        justify-content: center;
        display: flex;
        flex-direction: column;
        margin-top: 50px;
    }

    .cardproduct {
        background-color: #FFF;
        color: #000;
        border-radius: 10px;
        padding: 20px;
        margin: 10px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s;
        border: 1px solid #ddd;
    }

    .cardproduct:hover {
        transform: scale(1.05);
        box-shadow: 0px 20px 30px rgba(0, 0, 0, 0.1);
    }

    .cardproduct img {
        width: 100%;
        border-radius: 10px;
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