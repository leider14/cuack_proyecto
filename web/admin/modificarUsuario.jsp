<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuari = sesion.getAttribute("user").toString();
%>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Usuario</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="icon" href="/imagenes/iconos/icono.png" >
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="<%=Routes.MyComponentNavAdmin%>" />

    <div class="container mt-5">
        <h2 class="text-center">Modificar Usuario</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <%
                    int idUsuario = Integer.parseInt(request.getParameter("id"));
                    Usuario usuario = UsuarioDB.obtenerUsuarioId(idUsuario);
                %>
                <form action="/ServletAgregarUsuario" method="post">
                    <div class="form-group">
                        <label for="txtUsuario">Usuario</label>
                        <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" value="<%= usuario.getUsuario() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="txtClave">Contraseña</label>
                        <input type="password" class="form-control" id="txtClave" name="txtClave" value="<%= usuario.getContraseña() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="selectNivel">Nivel</label>
                        <select class="form-control" id="selectNivel" name="selectNivel" required>
                            <option value="1" <%= usuario.getNivel() == 1 ? "selected" : "" %>>Administrador</option>
                            <option value="2" <%= usuario.getNivel() == 2 ? "selected" : "" %>>Usuario</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" name="action" value="modificarUsuario">Modificar Usuario</button>
                    <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>">
                    <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>">
                </form>
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
    padding: 0px;
    margin: 0px;
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

.form-group {
    margin-bottom: 15px;
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
