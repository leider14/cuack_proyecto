<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuario = sesion.getAttribute("user").toString();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sobre Nosotros</title>
    
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
        <a href="carrito.jsp"><i class="fas fa-shopping-cart"></i> Carro de compras</a>
        <a href="buscador.jsp"><i class="fas fa-search"></i> Buscar</a>
        <a href="login.jsp?cerrar=true"> <i class="fas fa-user"></i><%=usuario%></a>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Sobre Nosotros</h2>
        <div class="row mt-4">
            <div class="col-md-6">
                <img src="imagenes/iconos/icono.png" class="img-fluid" alt="Sobre Nosotros">
            </div>
            <div class="col-md-6">
                <h3>Nuestra Historia</h3>
                <p>Somos una tienda especializada en frutas frescas y de alta calidad, dedicada a ofrecer lo mejor de cada cosecha para nuestros clientes. Fundada en 2024, nuestra misión es brindar productos saludables y frescos directamente del campo, junto con una atención al cliente excepcional.</p>
                <h3>Nuestra Misión</h3>
                <p>IOfrecer Calidad de productosy ayudar a nustros campesinos</p>
                <h3>Contáctanos</h3>
                <p>Email: contacto@Cuack Dev.com</p>
                <p>Teléfono: (123) 456-7890</p>
                <p>Dirección: Chile</p>
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
    /* Añadir estos estilos si no están ya presentes */
    body{
        padding-top: 50px;
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
    height: 60px;
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

.container {
    margin-top: 100px;
}

.footer {
    background-color: #000;
    color: #FFF;
    padding: 20px 0;
    text-align: center;
}

img.img-fluid {
    border-radius: 10px;
    filter: drop-shadow(0px 5px 5px #FDBD0D); 
    transition-duration: 2s;
}

.container:hover .img-fluid {
    border-radius: 10px;
    transform: scale(1.2);
    filter: drop-shadow(0px 20px 40px rgba(0, 0, 0, 0.5)); 
}

</style>