<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrar Usuario</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="menu">
        <a href="index.jsp"><img src="imagenes/iconos/logo.png" alt="logo"/></a>
        <a href="index.jsp">Catálogo</a>
        <a href="adminUsuarios.jsp">Administrar Usuarios</a>
        <a href="login.jsp?cerrar=true">Cerrar Sesión</a>
        <a><%= session.getAttribute("user").toString() %></a>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Registrar Usuario</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="ServletAgregarUsuario" method="post">
                    <div class="form-group">
                        <label for="txtUsuario">Usuario</label>
                        <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" required>
                    </div>
                    <div class="form-group">
                        <label for="txtContraseña">Contraseña</label>
                        <input type="password" class="form-control" id="txtClave" name="txtClave" required>
                    </div>
                    <div class="form-group">
                        <label for="selectNivel">Nivel</label>
                        <select class="form-control" id="selectNivel" name="selectNivel" required>
                            <option value="1">Administrador</option>
                            <option value="2">Usuario</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" name="action" value="registrarUsuario">Registrar Usuario</button>
                    <input type="hidden" name="accion" value="registrarUsuario"></input>
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

a:link {
    text-decoration: none;
}

#menu {
    width: 100%;
    height: 70px;
    font-size: 22px;
    background: #fff;
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
