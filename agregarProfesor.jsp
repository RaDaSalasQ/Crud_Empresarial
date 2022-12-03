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
    <h2><center>Agregar Profesor</center></h2>
    <c:if test="${param.nombre == null}">
        <form method="post" class="table-responsive p-2 m-auto w-25">
            <table class="table table-striped table-hover table align-middle border border-dark border-2 rounded-5 table-light">
                <tr>
                    <td></td>
                    <td><input type="hidden" name="id" value="${fila.id}"></td>
                </tr>
                <tr>
                    <td>Cedula</td>
                    <td><input type="text" name="cedula" value="${fila.cedula}"></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="${fila.nombre}"></td>
                </tr>
                <tr>
                    <td>Area</td>
                    <td><input type="text" name="area" value="${fila.area}"></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input type="text" name="telefono" value="${fila.telefono}"></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td>
                        <sql:query var="rsCategoria" dataSource="${universidad}">
                            SELECT * FROM CATEGORIA
                        </sql:query>
                        <select name="id_categoria">
                            <option value="0">-- Seleccione --</option>
                            <c:forEach var="item" items="${rsCategoria.rows}">
                                <option value="${item.id}">
                                    <c:out value="${item.description}"></c:out>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <center>
            
              <button type="submit" class="btn btn-success">Insertar</button>
              <a href="index.jsp">
              <button type="button" class="btn btn-success">Volver</button>
            </a>
            </center>

        </form>
    </c:if>

    <c:if test="${param.nombre != null}">
        <sql:update var="result" dataSource="${universidad}">
            INSERT INTO
            profesor (nombre,cedula,area,telefono,id_categoria)
            VALUES ('${param.nombre}',
            '${param.cedula}',
            '${param.area}',
            '${param.telefono}',
            '${param.id_categoria}'
            )
        </sql:update>
        <c:if test="${result == 1}">
            <center>
            <div class="border border-dark border-1 rounded rounded-3 w-25 bg-light align-middle">
            <p class="m-auto">Registro Insertado Satisfactoriamente</p>
            </div>
            <br>
            <a href="index.jsp">
              <button type="button" class="btn btn-success">Volver</button>
            </a>
            </center>
        </c:if>
    </c:if>



<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
</body>
</html>