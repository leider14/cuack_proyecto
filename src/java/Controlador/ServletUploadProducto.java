package Controlador;

import Modelo.*;
import DAO.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import utils.Routes;

@WebServlet(name = "ServletUploadProducto", urlPatterns = {"/ServletUploadProducto"})
public class ServletUploadProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
    if (accion == null) {
            System.out.println("Acción no especificada, redirigiendo a error.jsp");
            response.sendRedirect(Routes.MyComponentDialogAdmin+"?message=Acción no especificada");
            return;
        }

    System.out.println("Acción recibida: " + accion);  // Verificar qué acción se recibe

        System.out.println("Entrada a processRequest. Acción: " + accion);
        if (accion.equals("insertar")) {
            this.RegistrarProducto(request, response);
        } else if (accion.equals("insertar2")) {
            this.ComprarProducto(request, response);
        }
    }

    private void RegistrarProducto(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // 1. Obtener los parámetros del formulario
    System.out.println("Entro a RegistrarProducto");
    String nombre = request.getParameter("txtNom");
    String precioStr = request.getParameter("txtPre");
    System.out.println("Nombre: " + nombre);
    System.out.println("Precio recibido: " + precioStr);
    
    String nombreArchivoImagen = ""; // Este será el nombre del archivo subido

    // Comprobar que el nombre y el precio no son nulos
    if (nombre == null || precioStr == null || nombre.trim().isEmpty()) {
        System.out.println("Verificación: Los parámetros nombre o precio son nulos o vacíos.");
        response.sendRedirect("error.jsp?message=El nombre del producto y precio son obligatorios");
        return;
    }

    // 2. Validar el precio
    int precio = 0;
    try {
        precio = Integer.parseInt(precioStr);
        System.out.println("Precio convertido a entero: " + precio);
    } catch (NumberFormatException ex) {
        System.out.println("Error en la conversión del precio: " + ex.getMessage());
        response.sendRedirect(Routes.MyComponentDialogAdmin + "?men=Error: El precio debe ser un número válido");
        return;
    }

    // 3. Procesar el archivo subido
    Part filePart = request.getPart("file"); // Obtener el archivo
    if (filePart == null) {
        System.out.println("No se ha seleccionado ningún archivo.");
        response.sendRedirect("error.jsp?message=No se ha seleccionado ninguna imagen");
        return;
    }

    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    String uploadDir = getServletContext().getRealPath("/imagenes/productos/");

    System.out.println("Ruta de destino para la imagen: " + uploadDir);

    // Crear el directorio si no existe
    File uploadDirFile = new File(uploadDir);
    if (!uploadDirFile.exists()) {
        System.out.println("El directorio no existe, creándolo...");
        uploadDirFile.mkdirs();
    }

    // Guardar el archivo en el directorio
    File file = new File(uploadDir, fileName);
    System.out.println("Ruta y nombre completo del archivo: " + file.getAbsolutePath());
    try {
        filePart.write(file.getAbsolutePath());
        System.out.println("Archivo guardado exitosamente.");
    } catch (Exception e) {
        System.out.println("Error al escribir el archivo: " + e.getMessage());
        response.sendRedirect("error.jsp?message=Error al guardar la imagen");
        return;
    }

    // Asignar el nombre del archivo a la base de datos
    nombreArchivoImagen = "imagenes/productos/" + fileName;
    System.out.println("Nombre del archivo asignado para la base de datos: " + nombreArchivoImagen);

    // 4. Crear el objeto Producto
    Productos p = new Productos();
    p.setNombre(nombre);
    p.setPrecio(precio);
    p.setImagen(nombreArchivoImagen); // Usar el nombre de la imagen
    int idCategoria = Integer.parseInt(request.getParameter("selectCategoria"));
    p.setCategoria(idCategoria);
    System.out.println("Producto creado: " + p.toString()); // Verificación

    // 5. Insertar el producto en la base de datos
    boolean rpta = ProductoDB.insertarProducto(p);
    System.out.println("Resultado de la operación de insertarProducto: " + rpta);

    // 6. Redirigir dependiendo del resultado
    if (rpta) {
        System.out.println("Redirigiendo a la página de éxito");
        response.sendRedirect(Routes.MyComponentDialogAdmin + "?men=Se registró con éxito");
    } else {
        System.out.println("Redirigiendo a la página de error");
        response.sendRedirect(Routes.MyComponentDialogAdmin + "?men=Error al registrar");
    }
}

    private void ComprarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entro a ComprarProducto");
        response.sendRedirect(Routes.MyComponentDialogUser + "?men=La compra se realizó con éxito");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Llamada a doGet");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Llamada a doPost");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar productos y cargar imágenes";
    }
}
