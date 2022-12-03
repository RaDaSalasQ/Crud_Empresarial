<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<title>Sistema Universitario</title>
</head>

<style>

        body{
            font-family: 'Sawarabi Mincho', serif;
            background-image: url(img/fondo.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

    </style>


<body>
    <h1><center>Sistema Universitario</center></h1>
    <h2><center>Eliminar Profesor</center></h2>

    <c:if test="${param.id != null}">
        <sql:update var="result" dataSource="${universidad}">
            DELETE FROM PROFESOR
            WHERE id = ${param.id}
        </sql:update>
        <c:if test="${result == 1}">
        <center>
        <div class="border border-dark border-1 rounded rounded-3 w-25 bg-light align-middle">
            <p class="m-auto">Registro Eliminado Satisfactoriamente...</p>
            </div>
            <br>
             <a href="index.jsp">
              <button type="button" class="btn btn-success">Volver</button>
            </a>
        </c:if>
    </c:if>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
</body>
</html>