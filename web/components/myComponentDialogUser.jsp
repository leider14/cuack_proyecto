<%@page import="utils.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mensaje</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <img src="/imagenes/banner2.png" class="img-fluid" alt="Banner">
            </div>
        </div>
        <h1 class="text-center mt-4">
            <%
                if (request.getParameter("men") != null) {
                    out.println(request.getParameter("men"));
                }
            %>
        </h1>
        <br>
        <h2 class="text-center">
            <a class="btn btn-primary" href="<%=Routes.UserHomePage%>">Volver a principal</a>
        </h2>
    </div>
</body>
</html>
