<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Boletas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container mt-5">
            <h2 class="text-center">Consulta de Boletas</h2>

            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            Listado de Boletas
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID Boleta</th>
                                        <th>RUT Cliente</th>
                                        <th>Fecha de Compra</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<Boleta> boletas = (ArrayList<Boleta>) request.getAttribute("boletas");
                                        if (boletas != null && !boletas.isEmpty()) {
                                            for (Boleta boleta : boletas) {
                                                String estado = boleta.getEstado();
                                    %>
                                    <tr>
                                        <td><%= boleta.getIdBoleta()%></td>
                                        <td><%= boleta.getRutCliente()%></td>
                                        <td><%= boleta.getFechaCompra()%></td>
                                        <td>$ <%= boleta.getTotal()%></td>
                                        <td>
                                            <%
                                                    if ("En Espera".equals(estado)) {%>
                                            <span class="badge badge-warning"><%= estado%></span>
                                            <% } else if ("Pagado".equals(estado)) {%>
                                            <span class="badge badge-success"><%= estado%></span>
                                            <% } else if ("Cancelado".equals(estado)) {%>
                                            <span class="badge badge-danger"><%= estado%></span>
                                            <% }%>
                                        </td>
                                        <td>
                                            <form action="/ServletBoletas" method="post">
                                                <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta()%>">
                                                <% if ("En Espera".equals(estado)) {%>
                                                <a class="btn btn-outline-primary" href="http://localhost/Cuack Dev/index.php?action=init&amount=<%=boleta.getTotal()%>">Pagar</a>
                                                <button type="submit" name="accion" value="anularBoleta" class="btn btn-danger btn-sm">Anular</button>
                                                <% } else if ("Pagado".equals(estado)) { %>
                                                <button type="submit" name="accion" value="anularBoleta" class="btn btn-danger btn-sm">Anular</button>
                                                <% } %>
                                            </form>
                                        </td>
                                    </tr>
                                    <% }
                                    } else { %>
                                    <tr>
                                        <td colspan="6" class="text-center">No se encontraron boletas.</td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

