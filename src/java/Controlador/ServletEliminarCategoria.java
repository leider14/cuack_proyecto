
package Controlador;
import Modelo.*;
import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Routes;

/**
 *
 * @author leidercastillo
 */
@WebServlet(name = "ServletEliminarCategoria", urlPatterns = {"/ServletEliminarCategoria"})
public class ServletEliminarCategoria extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           System.out.print(request.getParameter("id"));
        int idCategoria = (Integer.parseInt(request.getParameter("id")));
        boolean rpta = CategoriaDB.eliminarCategoria(idCategoria);
        if(rpta == true){
            response.sendRedirect(Routes.MyComponentDialogAdmin+"?men=Se actualizó con Exito");
        }else{
            response.sendRedirect(Routes.MyComponentDialogAdmin+"?men=Error al Actualizar");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
