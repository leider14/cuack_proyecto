<%@page import="Modelo.BoletaDB"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anular Boleta</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Anular Boleta</h2>
        
        <% 
            // Obtener el idBoleta enviado desde consultarMisCompras.jsp
            int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
            
            // Verificar si se ha enviado el formulario para anular la boleta
            if (request.getMethod().equalsIgnoreCase("post")) {
                String motivoAnulacion = request.getParameter("motivoAnulacion");
                
                // Validar y anular la boleta
                boolean anulado = false;
                if (motivoAnulacion != null && !motivoAnulacion.isEmpty()) {
                    anulado = BoletaDB.anularBoleta(idBoleta);
                }
                
                if (anulado) {
        %>
        <div class="alert alert-success text-center" role="alert">
            La boleta ha sido anulada correctamente.
        </div>
        <% } else { %>
        <div class="alert alert-danger text-center" role="alert">
            Error al anular la boleta. Por favor, inténtelo nuevamente.
        </div>
        <% } %>
        <% } %>
        
        <form action="anularBoleta.jsp" method="post">
            <input type="hidden" name="idBoleta" value="<%= idBoleta %>">
            <div class="form-group">
                <label for="motivoAnulacion">Motivo de Anulación:</label>
                <textarea class="form-control" id="motivoAnulacion" name="motivoAnulacion" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-danger">Anular Boleta</button>
        </form>
        
        <div class="mt-3">
            <a href="consultarMisCompras.jsp" class="btn btn-secondary">Volver a Consultar Compras</a>
        </div>
    </div>

    <!-- Script de Bootstrap (opcional, si no está ya cargado en tu página principal) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
