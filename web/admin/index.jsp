<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList, Modelo.*" %>
<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Catálogo</title>
        <link rel="icon" href="/imagenes/iconos/icono.png" >
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

            #bannerCarousel .carousel-inner img {
                height: 500px;
                object-fit: cover;
            }

            @media (max-width: 768px) {
                #bannerCarousel .carousel-inner img {
                    height: 300px;
                }
            }

            #bannerCarousel .carousel-control-prev-icon,
            #bannerCarousel .carousel-control-next-icon {
                background-color: #000;
                border-radius: 50%;
            }

            #catalogo {
                margin-top: 50px;
            }

            .card {
                margin-bottom: 20px;
                transition: transform 0.3s, box-shadow 0.3s;
                border: 1px solid #ddd;
                border-radius: 10px;
            }

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            }

            .card img {
                object-fit: cover;
                border-radius: 10px 10px 0 0;
            }

            .btn-primary {
                background-color: #FFA500;
                border: none;
                transition: background 0.3s, box-shadow 0.3s;
            }

            .btn-primary:hover {
                background-color: #FF4500;
                box-shadow: 0px 0px 10px rgba(255, 69, 0, 0.5);
            }

            @media (max-width: 768px) {
                .btn-primary {
                    width: 100%;
                    margin-bottom: 10px;
                }
            }

            footer {
                background-color: #000;
                color: #FFF;
                padding: 20px 0;
                text-align: center;
            }

        </style>
    </head>

    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = null;
            String nivel = null;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                usuario = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
            } else {
                out.print("<script>location.replace('login.jsp');</script>");
                return; // Asegura que el resto del código no se ejecute
            }
        %>

        <jsp:include page="<%=Routes.MyComponentNavAdmin%>" />

        <!-- Carrusel -->
        <div id="bannerCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/imagenes/carrusel/banner1.jpg" class="d-block w-100" alt="Banner 1">
                </div>
                <div class="carousel-item">
                    <img src="/imagenes/carrusel/banner2.jpg" class="d-block w-100" alt="Banner 2">
                </div>
                <div class="carousel-item">
                    <img src="/imagenes/carrusel/banner3.jpg" class="d-block w-100" alt="Banner 3">
                </div>
                <div class="carousel-item">
                    <img src="/imagenes/carrusel/banner4.jpg" class="d-block w-100" alt="Banner 4">
                </div>
                <div class="carousel-item">
                    <img src="/imagenes/carrusel/banner5.jpg" class="d-block w-100" alt="Banner 5">
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
                <div class="col-md-3 col-sm-6">
                    <div class="card">
                        <img src="/imagenes/productos/<%= producto.getImagen()%>" class="img-fluid card-img-top" alt="<%= producto.getNombre()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%= producto.getNombre()%></h5>
                            <p class="card-text">$<%= producto.getPrecio()%></p>
                            <button type="button" class="btn btn-danger btn-sm" onclick="window.location = 'eliminarProducto.jsp?id=<%= producto.getCodigoProducto()%>'">Eliminar</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="window.location = 'modificarProducto.jsp?id=<%= producto.getCodigoProducto()%>'">Modificar</button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>
        </div>

        <!-- Footer -->
        <jsp:include page="<%=Routes.MyComponentFooter%>" />

    </body>

</html>
