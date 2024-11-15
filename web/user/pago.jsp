<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sneackers Chile Pago</title>
</head>
<body>
    <img src="https://i.pinimg.com/originals/bd/b3/22/bdb32276ef547cef5524fea6bab2805c.gif">

    <p>Estás saliendo de nuestro sitio web. Por favor, haz clic en el botón para ser redirigido al centro de pago. ¡Gracias por tu compra!</p>
    <c:if test="${not empty response}">
        <c:set var="json" value="${response}" />
        <c:set var="urlTbk" value="${json.url}" />
        <c:set var="token" value="${json.token}" />
        <form name="brouterForm" id="brouterForm" method="POST" action="${urlTbk}" style="display:block;">
            <input type="hidden" name="token_ws" value="${token}" />
            <input type="submit" value="Continuar!">
        </form>
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
  p{
    max-width: 450px;
    text-align: center;
  }
  img{
    width: 120px;
  }
  input{
    border-radius: 10px;
    border: none;
    padding: 10px 15px ;
    background-color: #101113;
    color: white;
    font-size: 1.2;
    transition-duration: 0.5s;
  }
  input:hover{
    background-color: white;
    color: #101113;
  }
</style>
