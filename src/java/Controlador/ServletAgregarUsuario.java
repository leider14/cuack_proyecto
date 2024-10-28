package Controlador;

import Modelo.UsuarioDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletAgregarUsuario")
public class ServletAgregarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("action");
        System.out.println("Acción GET: " + accion);

        if ("eliminarUsuario".equals(accion)) {
            int idUsuario = Integer.parseInt(request.getParameter("id"));
            System.out.println("ID de usuario a eliminar: " + idUsuario);

            boolean resultado = UsuarioDB.eliminarUsuario(idUsuario);

            if (resultado) {
                response.sendRedirect("mensaje.jsp?men=Usuario eliminado con éxito");
            } else {
                response.sendRedirect("mensaje.jsp?men=Error al eliminar el usuario");
            }
        }

        if ("registrarUsuario".equals(accion)) {
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");
            int nivel = Integer.parseInt(request.getParameter("selectNivel"));
            System.out.println("Datos recibidos: " + usuario + ", " + clave + ", " + nivel);

            boolean resultado = UsuarioDB.insertarUsuario(usuario, clave, nivel);

            if (resultado) {
                response.sendRedirect("mensaje.jsp?men=Usuario registrado con éxito");
            } else {
                response.sendRedirect("mensaje.jsp?men=Error al registrar el usuario");
            }
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
    }

}
