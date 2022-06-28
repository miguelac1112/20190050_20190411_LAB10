<%--
  Created by IntelliJ IDEA.
  User: 124349
  Date: 28/06/2022
  Time: 01:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>inicioSesion</title>
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
        <div class=" text-center w-75 mt-5 rounded " style="background-color: black">
            <div class="col-sm-14">
                <form>
                    <div class="mb-3">
                        <img class="mb-4 mt-4" src="imagenes/logo.png" alt=" " width="230" height="150">
                        <p class="text-center" style="color: aliceblue; font-size: 25px" ><b>Bienvenido Viajero</b></p>

                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="email" class="form-control" id="floatingInput" placeholder="Usuario">
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Contraseña">
                        </div>
                        <div class="mb-3 mt-4">
                            <button type="button" class="btn btn-outline-info rounded">Ingresar</button>
                        </div>
                        <div class="mb-1">
                            <span><a href="#" style="color: blue">Soy nuevo y quiero registrarme</a></span>
                        </div>
                        <div>
                            <br>
                        </div>
                </form>
            </div>
        </div>
        </div>
    </body>
</html>