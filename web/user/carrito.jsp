<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false); // Obtener la sesión existente sin crear una nueva
    if (sesion == null) {
        // Manejar el caso en que no haya sesión activa
        response.sendRedirect(Routes.LoginPage);
        return;
    }

    String usuario = (String) sesion.getAttribute("user");
    Object idUserObj = sesion.getAttribute("idUser");

    if (idUserObj == null || !(idUserObj instanceof Integer)) {
        // Manejar el caso en que idUser no esté en la sesión o no sea un Integer
        System.out.println("Error: idUser no está configurado correctamente en la sesión.");
        response.sendRedirect(Routes.LoginPage);
        return;
    }

    int idUser = (Integer) idUserObj;

    ArrayList<Articulo> articulos = (ArrayList<Articulo>) sesion.getAttribute("carrito");

    // Eliminar productos del carrito si el pago fue exitoso
    if (request.getParameter("success") != null) {
        BoletaDB.generarBoleta(idUser, idUser + "", 12, articulos);
        sesion.setAttribute("carrito", null);
        articulos = null;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro de Compras</title>
        <link rel="icon" href="/imagenes/iconos/icono.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <jsp:include page="<%=Routes.MyComponentNav%>" />

        <div class="container mt-5">
            <h2 class="text-center">Carro de Compras</h2>

            <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success text-center">
                Tu pago ha sido exitoso. ¡Gracias por tu compra!
            </div>
            <% } else if (request.getParameter("fail") != null) { %>
            <div class="alert alert-danger text-center">
                Hubo un problema con tu pago. Inténtalo de nuevo.
            </div>
            <% } %>

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th>Item</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int total = 0;
                            if (articulos != null) {
                                for (Articulo a : articulos) {
                                    Productos producto = ProductoDB.obtenerProducto(a.getCodigoProducto());
                                    total += a.getCantidad() * producto.getPrecio();
                        %>
                        <tr>
                            <td>
                                <img src="/imagenes/productos/<%= producto.getImagen()%>" width="100px" alt="<%= producto.getNombre()%>">
                            </td>
                            <td>
                                <%= producto.getNombre()%><br>
                                Código: <%= producto.getCodigoProducto()%>
                            </td>
                            <td>
                                $<%= producto.getPrecio()%>
                            </td>
                            <td>
                                <%= a.getCantidad()%>
                            </td>
                            <td>
                                $<%= Math.round(producto.getPrecio() * a.getCantidad())%>
                            </td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="5">
                                <h3>No hay artículos en el carrito</h3>
                            </td>
                        </tr>
                        <% }%>
                        <tr class="table-secondary">
                            <td colspan="5">
                                <strong>Total: $<%= total%></strong>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <% if (articulos != null) { %>
            <div class="text-center mt-4">
                <%
                    int randomId = new java.util.Random().nextInt(1000000); // Generar ID aleatorio
                    String successUrl = request.getRequestURL() + "?success=" + randomId; // Crear URL de éxito con ID aleatorio
                %>

                <div class="text-center mt-4">
                    <a class="btn btn-outline-primary" href="<%=Routes.UserHomePage%>">Seguir Comprando</a>
                    <button class="btn btn-primary" onclick="window.location.href = '<%= successUrl%>'">Pagar</button>
                </div>


            </div>
            <% }%>

        </div>

        <jsp:include page="<%=Routes.MyComponentFooter%>" />
        <script src="js/carro.js"></script>
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

    .container {
        margin-top: 100px;
    }

    footer {
        background-color: #000;
        color: #FFF;
        padding: 20px 0;
        text-align: center;
    }

    .btn-outline-primary {
        border-color: #FFA500;
        color: #FFA500;
        transition: background 0.3s, box-shadow 0.3s;
    }

    .btn-outline-primary:hover {
        background-color: #FFA500;
        color: #FFF;
        box-shadow: 0px 0px 10px 2px rgba(255, 165, 0, 0.5);
    }

    .btn-success {
        background-color: #28a745;
        border: none;
        transition: background 0.3s, box-shadow 0.3s;
    }

    .btn-success:hover {
        background-color: #218838;
        box-shadow: 0px 0px 10px 2px rgba(33, 136, 56, 0.5);
    }

    .table {
        margin-bottom: 0;
    }

    .table-secondary {
        background-color: #f8f9fa;
    }
</style>
