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
    <h2><center>Actualizar Profesor</center></h2>

    <c:if test="${param.modifica == null}">
        <sql:query var="profesores" dataSource="${universidad}">
            SELECT * FROM profesor where id = ?
            <sql:param value="${param.id}">
            </sql:param>
        </sql:query>
        <form method="post" class="table-responsive p-2 m-auto w-25">
            <table class="table table-striped table-hover table align-middle border border-dark border-2 rounded-5 table-light">
                <c:forEach var="itema" items="${profesores.rows}">
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="id" value="${itema.id}"></td>
                    </tr>
                    <tr>
                        <td>Cedula</td>
                        <td><input type="text" name="cedula" value="${itema.cedula}"></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="${itema.nombre}"></td>
                    </tr>
                    <tr>
                        <td>Area</td>
                        <td><input type="text" name="area" value="${itema.area}"></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><input type="text" name="telefono" value="${itema.telefono}"></td>
                    </tr>
                    <tr>
                        <td>Categoria</td>
                        <td>
                            <sql:query var="rsCategoria" dataSource="${universidad}">
                                SELECT * FROM categoria
                            </sql:query>
                            <select name="id_categoria">
                                <option value="0">-- Seleccione --</option>
                                <c:forEach var="categoria" items="${rsCategoria.rows}">
                                    <option value="${categoria.id}"
                                        <c:if test="${categoria.id == itema.id_categoria}">
                                            selected
                                    </c:if>
                                    >
                                    <c:out value="${categoria.description}"></c:out>
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
        <center>
        <button type="submit" class="btn btn-success">Actualizar</button>
        <a href="index.jsp">
              <button type="button" class="btn btn-success">Volver</button>
            </a>
        </center>
        <tr><input type="hidden" name="modifica" value="SI"></tr>
        </form>
    </c:if>
    <c:if test="${param.modifica != null}">
        <sql:update var="result" dataSource="${universidad}">
            update profesor
            set nombre = '${param.nombre}',
            cedula = '${param.cedula}',
            area = '${param.area}',
            telefono = '${param.telefono}',
            id_categoria = '${param.id_categoria}'
            where id = ${param.id}
        </sql:update>
        <c:if test="${result == 1}">
        <center>
            <div class="border border-dark border-1 rounded rounded-3 w-25 bg-light align-middle">
            <p class="m-auto">Registro Actualizado Satisfactoriamente!</p>
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