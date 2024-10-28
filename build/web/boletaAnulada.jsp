<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Boleta Anulada</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Anulación de Boleta</h2>
        <%
            boolean anulado = Boolean.parseBoolean(request.getParameter("anulado"));
            if (anulado) {
        %>
        <div class="alert alert-success">
            La boleta ha sido anulada correctamente.
        </div>
        <% } else { %>
        <div class="alert alert-danger">
            Hubo un error al anular la boleta.
        </div>
        <% } %>
    </div>
</body>
</html>
