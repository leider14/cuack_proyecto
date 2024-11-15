<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Catálogo</title>
    <link rel="icon" href="/imagenes/iconos/icono.png" >
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <!-- Footer -->
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <p>2024 Cuack Dev. Todos los derechos reservados.</p>
                    <p>Contacto: <a href="mailto:contacto@CuackDev.com">contacto@CuackDev.com</a> | Teléfono: (123) 456-7890</p>
                </div>
            </div>
        </div>
    </footer>

</body>

<style>
    /* Estilo para el footer */
    #footer {
        background-color: #333;
        color: #fff;
        padding: 20px 0;
        font-size: 16px;
        position: relative;
        bottom: 0;
        width: 100%;
    }

    #footer a {
        color: #FFA500;
        text-decoration: none;
    }

    #footer a:hover {
        text-decoration: underline;
    }

    /* Estilo para la alineación del texto */
    #footer p {
        margin: 0;
        padding: 5px 0;
    }

    /* Estilo responsivo */
    @media (max-width: 767px) {
        #footer p {
            font-size: 14px;
        }
    }

</style>

</html>
