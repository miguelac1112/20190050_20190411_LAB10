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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body{
                background-image: url("imagenes/fondo.jpg");
                background-position: center ;
            }
        </style>
    </head>
    <body>
        <div class="text-center w-75 mt-5 rounded " style="background-color: black">
            <div class="col-sm-14">
                <form>
                    <div class="mb-3">
                        <img class="mb-4 mt-4" src="imagenes/logo.png" alt=" " width="230" height="150">
                        <p class="text-center" style="color: aliceblue; font-size: 25px" ><b>Edición</b></p>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="number" min="8" max="8"   placeholder="tiket" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="text"    required>
                            <span id="campoOK"></span>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="password" class="form-control" id="campo2"  required>
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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
