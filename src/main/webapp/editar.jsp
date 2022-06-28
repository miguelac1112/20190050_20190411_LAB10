<%--
  Created by IntelliJ IDEA.
  User: 124349
  Date: 28/06/2022
  Time: 06:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
              crossorigin="anonymous">

        <style>
            body{
                background-image: url("imagenes/fondo.jpg");
                background-position: center ;
            }
        </style>
    </head>
    <body>
        <div class="modal-dialog text-center w-75 mt-5 rounded " style="background-color: black">
            <div class="col-sm-14">
                <form>
                    <div class="mb-3">
                        <img class="mb-4 mt-4" src="imagenes/logo.png" alt=" " width="230" height="150">
                        <p class="text-center" style="color: aliceblue; font-size: 25px" ><b>Edición</b></p>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="number" min="8" max="8" class="form-control"  placeholder="tiket" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="text" class="form-control"  id="campo" placeholder="origen" required>
                            <span id="campoOK"></span>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="password" class="form-control" id="campo2" placeholder="destino" required>
                            <span id="campoOK2"></span>
                        </div>
                        <div class="d-flex justify-content-evenly">
                            <div class="mb-3 mt-4">
                                <button type="summit" class="btn btn-outline-info rounded">Editar</button>
                            </div>
                            <div class="mb-3 mt-4">
                                <button type="button" class="btn btn-outline-info rounded">Regresar</button>
                            </div>
                        </div>

                        <div>
                            <br>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        </div>
    </body>
</html>
