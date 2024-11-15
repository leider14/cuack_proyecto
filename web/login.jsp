<%@page import="utils.Routes"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Snackers Stars</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            background-color: #E75E0E;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #containerlogin {
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        .il {
            display: block;
            width: 100%;
            padding: 10px 15px;
            font-size: 17px;
            border: 1px solid rgba(48, 46, 46, 0.5);
            margin: 10px 0;
            border-radius: 10px;
            background-color: #E9E9E9;
        }

        #messageLogin {
            margin-top: 10px;
            text-align: center;
            font-size: 18px;
            color: red;
        }

        #messageLoginHide {
            color: white;
            margin-top: 10px;
            text-align: center;
            font-size: 18px;
        }

        .btn-primary {
            background-color: #FFA500;
            border: none;
            transition: background 0.3s, box-shadow 0.3s;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 10px;
            width: 60%;
        }

        .btn-primary:hover {
            background-color: #FF4500;
            box-shadow: 0px 0px 10px 2px rgba(255, 69, 0, 0.5);
        }

        .btn-secondary {
            background-color: transparent;
            color: black;
            border: none;
            transition: color 0.3s;
            padding: 10px 20px;
            font-size: 18px;
        }

        .btn-secondary:hover {
            color: #FF4500;
            background-color: transparent;
        }

        #buttons-row {
            display: flex;
            justify-content: space-between;
        }
        img{
            width: 400px;
        }
    </style>
    <body>
        <div id="containerlogin">
            <img src="./imagenes/iconos/logo.png" alt="logo"/>
            <h2>Iniciar Sesión</h2>
            <form action="<%= Routes.LoginPage %>">
                <input type="text" class="il" id="search" name="txtUsuario" placeholder="Usuario" >
                <input class="il" placeholder="Contraseña" type="password" name="txtContra" >
                <%
                    try {
                        UsuarioDB udb = new UsuarioDB();
                        if (request.getParameter("btnCrearCuenta") != null) {
                            response.sendRedirect(Routes.CreateCount);
                        }
                        if (request.getParameter("btnIngresar") != null) {
                            String nombre = request.getParameter("txtUsuario");
                            String contra = request.getParameter("txtContra");
                            HttpSession sesion = request.getSession();
                            Usuario usr = udb.obtenerUsuario(nombre, contra);
                            System.out.println(usr);
                            if (usr.getNivel() != 0) {
                                switch (usr.getNivel()) {
                                    case 1:
                                        sesion.setAttribute("user", nombre);
                                        sesion.setAttribute("nivel", "1");
                                        sesion.setAttribute("idUser", usr.getId());
                                        response.sendRedirect(Routes.AdminHomePage);
                                        break;
                                    case 2:
                                        sesion.setAttribute("user", nombre);
                                        sesion.setAttribute("nivel", "1");
                                        sesion.setAttribute("idUser", usr.getId());
                                        response.sendRedirect(Routes.UserHomePage);
                                        break;
                                    default:
                                        out.write("<p id='messageLogin'>Comprueba tu usuario y clave</p>");
                                        break;
                                }
                            } else {
                                out.write("<p id='messageLogin'>Comprueba tu usuario y clave</p>");
                            }
                        } else {
                            out.write("<p id='messageLoginHide'>.</p>");
                        }
                    } catch (Exception e) {
                        out.write("<p id='messageLogin'>Comprueba tu usuario y clave</p>");
                    }

                    if (request.getParameter("cerrar") != null) {
                        session.invalidate();
                    }

                %>
                <div id="buttons-row">
                    <button type="submit" class="btn btn-primary" name="btnIngresar" value="Ingresar">Ingresar</button>
                    <button type="submit" class="btn btn-secondary" name="btnCrearCuenta" value="Crear Cuenta">Crear Cuenta</button>
                </div>
            </form>
        </div>
    </body>
</html>
