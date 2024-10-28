package Controlador;

import Modelo.ProductoDB;
import Modelo.Productos;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletBuscarProducto", urlPatterns = {"/ServletBuscarProducto"})
public class ServletBuscarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener el parámetro de búsqueda desde el formulario
            String search = request.getParameter("search");

            // Validar el parámetro de búsqueda
            if (search == null || search.trim().isEmpty()) {
                throw new IllegalArgumentException("El término de búsqueda no puede estar vacío.");
            }
            
            // Buscar productos según el término de búsqueda
            ArrayList<Productos> productos = ProductoDB.buscarProductos(search);

            // Enviar los resultados de la búsqueda a la página JSP correspondiente
            request.setAttribute("productos", productos);
            request.getRequestDispatcher("buscador.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir la pila de excepciones en los logs del servidor
            request.setAttribute("error", "Ocurrió un error durante la búsqueda: " + e.getMessage());
            request.getRequestDispatcher("mensaje.jsp?men=Ocurrió un error durante la búsqueda: " + e.getMessage()).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para buscar productos";
    }
}
