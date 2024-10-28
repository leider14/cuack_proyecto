<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado del Pago</title>
</head>
<body>
    <c:if test="${not empty response}">
        <pre>${response}</pre>
        <c:choose>
            <c:when test="${response.status == 'AUTHORIZED'}">
                <p>Pago completado. Token recibido: ${response.token}</p>
            </c:when>
            <c:otherwise>
                <p>Pago no completado. Intente nuevamente.</p>
            </c:otherwise>
        </c:choose>
    </c:if>
</body>
</html>

<style>
  body{
    font-family: Arial, Helvetica, sans-serif;
    background-color: #D42017;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: White;
  }
  pre, p{
    max-width: 450px;
    text-align: center;
  }
</style>
