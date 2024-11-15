package Controlador;

import DAO.ProductoDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.*;
import java.util.*;
import utils.Routes;

@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if (accion.equals("insertar")) {
            this.RegistrarProducto(request, response);
        } else if (accion.equals("insertar2")) {
            this.ComprarProducto(request, response);
        }
    }

    //Metodo RegistrarProducto || throws es el control de errores
    private void RegistrarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Productos p = new Productos();
        p.setNombre(request.getParameter("txtNom"));

        // Validar el precio antes de asignarlo al objeto Productos
        String precioStr = request.getParameter("txtPre");
        int precio = 0;
        try {
            precio = Integer.parseInt(precioStr);
        } catch (NumberFormatException ex) {
            response.sendRedirect("mensaje.jsp?men=Error: El precio debe ser un numero valida");
            return; // Salir del método si el precio no es válido
        }
        p.setPrecio(precio);
        
        p.setImagen(request.getParameter("txtImg"));
        int idCategoria = Integer.parseInt(request.getParameter("selectCategoria"));
        
        p.setCategoria(idCategoria);

        // Llamar al método insertarProducto
        boolean rpta = ProductoDB.insertarProducto(p);

        // Redirigir según el resultado
        if (rpta) {
            response.sendRedirect(Routes.MyComponentDialogAdmin+"?men=Se registró con exito");
        } else {
            response.sendRedirect(Routes.MyComponentDialogAdmin + "?men=Error al Registrar");
        }
    }
    
    private void ComprarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect(Routes.MyComponentDialogUser+"?men=La compra se realizo con exito");
        
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
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}