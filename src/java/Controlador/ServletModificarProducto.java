package Controlador;


import Modelo.ProductoDB;
import Modelo.Productos;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletModificarProducto", urlPatterns = {"/ServletModificarProducto"})
public class ServletModificarProducto extends HttpServlet {

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
        this.RegistrarProducto(request, response);
        
        
    }
    
    //Metodo RegistrarProducto || throws es el control de errores
    private void RegistrarProducto(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        int idProduct = (Integer.parseInt(request.getParameter("txtCodigo")));
        Productos p = new Productos();
        
        p.setImagen(request.getParameter("txtImagen"));
        p.setNombre(request.getParameter("txtNombre"));
        p.setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
        p.setCategoria(Integer.parseInt(request.getParameter("selectCategoria")));
        

        boolean rpta = ProductoDB.editarProducto( idProduct, p);
        if(rpta == true){
            response.sendRedirect("mensaje.jsp?men=Se actualizó con Exito");
        }else{
            response.sendRedirect("mensaje.jsp?men=Error al Actualizar");
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
