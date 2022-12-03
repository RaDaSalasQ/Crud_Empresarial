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

<body class="p-2">

    <h1><center>Sistema Universitario</center></h1>
    <h2><center>Datos de profesores</center></h2>
    <sql:query var="result" scope="request" dataSource="${universidad}">
        select PROFESOR.ID, PROFESOR.CEDULA as cedula, PROFESOR.NOMBRE as nombre,
        PROFESOR.AREA as area, CATEGORIA.DESCRIPTION as description
        from PROFESOR 
        left join CATEGORIA
        on PROFESOR.ID_CATEGORIA=CATEGORIA.ID
    </sql:query>
    <div class="table-responsive p-2 m-auto w-75">
    <table class="table table-striped table-hover table align-middle border border-dark border-2 rounded-5 table-light">
        <thead>
            <tr>
                <th>Cedula</th>
                <th>Nombre</th>
                <th>Area</th>
                <th>Categoria</th>
                <th colspan="2">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="fila" items="${result.rows}">
                <tr class="">
                    <td><c:out value = "${fila.cedula}"/></td>
                    <td><c:out value = "${fila.nombre}"/></td>
                    <td><c:out value = "${fila.area}"/></td>
                    <td><c:out value = "${fila.description}"/></td>
                    <td><a href="eliminarProfesor.jsp?id=${fila.id}"> <img src="img/borrar.png"  width="20px">
                    </a></td>
                    <td><a href="actualizarProfesor.jsp?id=${fila.id}">
                        <img src="img/lapiz.png"  width="20px"></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <center>
    <a href="agregarProfesor.jsp?id=${fila.id}">
        <button type="submit" class="btn btn-success">Nuevo Profesor</button>
    </a>
    </center>


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
</body>
</html>