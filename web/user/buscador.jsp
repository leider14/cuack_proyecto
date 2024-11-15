<%@page import="utils.Routes"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buscar Productos</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Body and container adjustments */
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                padding-top: 50px;
                background-color: #f8f9fa;
            }
            .ContainerBuscador {
                flex: 1;
                margin-top: 120px;
                margin-left:  10%;
                margin-right: 10%;
                padding-bottom: 30px;
            }

            /* Responsive Card styles */
            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            .card:hover {
                transform: scale(1.02);
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
            }
            .card-img {
                border-radius: 10px 10px 0 0;
                object-fit: cover;
                width: 100%;
            }
            @media (min-width: 768px) {
                .card-img {
                    border-radius: 10px 0 0 10px;
                }
            }
            .card-body {
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <jsp:include page="<%=Routes.MyComponentNav%>" />

        <!-- Main container -->
        <div class="ContainerBuscador">
            <h2 class="text-center">Buscar Productos</h2>
            <form action="/ServletBuscarProducto" method="get" class="mt-4">
                <div class="input-group">
                    <input type="text" class="form-control" id="search" name="search" placeholder="Buscar productos..." required>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">Buscar</button>
                    </div>
                </div>
            </form>

            <!-- Search Results -->
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
                    <div class="card mb-4 mx-auto" style="max-width: 700px;">
                        <div class="row no-gutters">
                            <div class="col-12 col-md-4">
                                <img src="/imagenes/productos/<%= producto.getImagen()%>" class="card-img" alt="<%= producto.getNombre()%>">
                            </div>
                            <div class="col-12 col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= producto.getNombre()%></h5>
                                    <p class="card-text">Código: <%= producto.getCodigoProducto()%></p>
                                    <p class="card-text">Precio: $<%= producto.getPrecio()%></p>
                                    <button type="button" class="btn btn-primary" onclick="window.location = '<%=Routes.UserAddCar%>?id=<%= producto.getCodigoProducto()%>'">Ver</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else if (request.getParameter("search") != null) {
                    %>
                    <p class="text-center">No se encontraron productos para la búsqueda "<%= request.getParameter("search")%>".</p>
                    <% } %>
                </div>
            </div>
        </div>

        <jsp:include page="<%=Routes.MyComponentFooter%>" />
    </body>
</html>
