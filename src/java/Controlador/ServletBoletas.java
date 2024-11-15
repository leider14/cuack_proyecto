package Controlador;
import Modelo.*;
import DAO.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet(name = "ServletBoletas", urlPatterns = {"/ServletBoletas"})
public class ServletBoletas extends HttpServlet {
       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession sesion = request.getSession();
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "generarBoleta":
                    generarBoleta(request, response);
                    break;
                case "anularBoleta":
                    anularBoleta(request, response);
                    break;
                case "consultarBoleta":
                    consultarBoleta(request, response);
                    break;
                case "consultarMisCompras":
                    consultarMisCompras(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
       }
    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    //La programación se hace en el doPost puesto que el formulario de registarProducto es tipo post
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }
    

    private void generarBoleta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<Articulo> articulos = (ArrayList<Articulo>) sesion.getAttribute("carrito");

        if (articulos == null || articulos.isEmpty()) {
            response.sendRedirect("carrito.jsp?error=carritoVacio");
            return;
        }

        int idUsuario = Integer.parseInt(request.getParameter("rutCliente")); // Cambia esto si el atributo de sesión es diferente
        double total = Double.parseDouble(request.getParameter("total"));

        int idBoleta = BoletaDB.generarBoleta(idUsuario, idUsuario+"", total, articulos);
        if (idBoleta > 0) {
            sesion.setAttribute("carrito", null);
            response.sendRedirect("carrito.jsp?success=true");
        } else {
            response.sendRedirect("carrito.jsp?error=errorGenerarBoleta");
        }
    }

    private void anularBoleta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
        boolean resultado = BoletaDB.anularBoleta(idBoleta);
        if (resultado) {
            response.sendRedirect("consultarMisCompras.jsp?success=true");
        } else {
            response.sendRedirect("consultarBoleta.jsp?error=errorAnularBoleta");
        }
    }

    private void consultarBoleta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
        ArrayList<Boleta> boletas = BoletaDB.consultarBoleta(idBoleta);
        request.setAttribute("boletas", boletas);
        request.getRequestDispatcher("consultarBoleta.jsp").forward(request, response);
    }

    private void consultarMisCompras(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rutCliente = request.getParameter("rutCliente");
        ArrayList<Boleta> boletas = BoletaDB.consultarMisCompras(rutCliente);
        request.setAttribute("boletas", boletas);
        request.getRequestDispatcher("consultarMisCompras.jsp").forward(request, response);
    }
}
