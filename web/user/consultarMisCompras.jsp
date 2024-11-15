<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Boletas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="<%=Routes.MyComponentNav%>" />
        <div class="container mt-5">
            <h2 class="text-center">Consulta de Boletas</h2>

            <%
                String status = request.getParameter("status");
                if ("success".equals(status)) {
                    out.println("<div class='alert alert-success text-center'>Pago completado exitosamente.</div>");
                } else if ("fail".equals(status)) {
                    out.println("<div class='alert alert-danger text-center'>El pago no se completó. Por favor, intente nuevamente.</div>");
                }
                
                out.println(idUser);

                ArrayList<Boleta> boletas = BoletaDB.consultarMisCompras(idUser+"");
                if (boletas.isEmpty()) {
            %>
            <div class="alert alert-warning text-center">
                No tienes boletas registradas.
            </div>
            <% } else { %>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID Boleta</th>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Boleta boleta : boletas) {
                    %>
                    <tr>
                        <td><%= boleta.getIdBoleta() %></td>
                        <td><%= boleta.getFechaCompra()%></td>
                        <td>$<%= boleta.getTotal()%></td>
                        <td><%= boleta.getEstado() %></td>
                        <td>
                            <%
                                if ("vendido".equals(boleta.getEstado())) {
                            %>
                            
                            <form action="<%=Routes.UserAnularBoleta%>" method="post">
                                <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Anular</button>
                            </form>
                            <%
                                } else {
                                    out.print("No hay acciones disponibles.");
                                }
                            %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } %>
        </div>
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

</html>
