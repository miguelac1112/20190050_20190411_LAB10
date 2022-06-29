<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.lab10.Servlets.MenuServlet" %>
<%@ page import="com.example.lab10.Beans.Viaje" %>
<jsp:useBean type="java.util.ArrayList<com.example.lab10.Beans.Viaje>" scope="request" id="listaDestinos"/>
<%@ page import="java.util.Objects" %>
<jsp:useBean id="usuario" scope="request" type="com.example.lab10.Beans.Usuario" />
<jsp:useBean id="invalid1" scope="request" type="java.lang.String" class="java.lang.String" />
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Añadir</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body{
                background-image: url("Imagenes/fondo.jpg");
                background-position: center ;
            }
            .ventana{
                background: #f1ebeb;
                width: 50%;
                font-family: Georgia;
                font-size: 18px;
                text-align: center;
                padding: 33px;
                min-height:250px;
                border-radius: 22px;
                position:absolute;
                left: 30%;
                top:5%;
                font-family: Georgia;
            }
        </style>
    </head>
    <body>
        <form class="ventana"  style="background-color: black"  method="POST" action="<%=request.getContextPath()%>/MenuServlet?a=crear_viaje" >
            <img class="mb-4 mt-4" src="Imagenes/logo.png" alt=" " width="230" height="150">
            <div class="col-sm-14 d-flex justify-content-around">
                <div>
                    <div class="mb-3">
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <label for="id_ciudad_destino"></label>
                            <select class="form-control" name="id_ciudad_destino" id="id_ciudad_destino" required>
                                <option disabled>Seleccionar ciudad destino</option>
                                <%for(Viaje listadestinos: listaDestinos){%>
                                <option value="<%=listadestinos.getId_destino()%>" ><%=listadestinos.getCiudad_destino()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <label for="ciudad_origen"></label>
                            <select class="form-control" name="ciudad_origen" id="ciudad_origen" required>
                                <option disabled>Seleccionar ciudad origen</option>
                                <option>Lima</option>
                                <option>Trujillo</option>
                                <option>Huancayo</option>
                            </select>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="date"  name="fecha_viaje" id="fecha_viaje" class="form-control" aria-describedby="emailHelp" min="2022-06-28" max="2023-06-28" required>
                            <input type="hidden" name="codigo_pucp" id="codigo_pucp" value="<%=usuario.getCodigoPucp()%>" />
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="number"  name="tickets" id="tickets" class="form-control" min="1" max="15" step="1"  placeholder="Ticket" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <label for="empresa_seguro"></label>
                            <select class="form-control" name="empresa_seguro" id="empresa_seguro" required>
                                <option disabled>Seleccionar seguro</option>
                                <option>Rimac</option>
                                <option>Pacifico</option>
                                <option>La positiva</option>
                                <option>Seguro internacional</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <%%>
                    </div>
                </div>
                <div>
                    <div class="mb-3 mt-0">
                        <div class="container" >
                            <h5 style="color:white"><center>  Lista de viajes </center>  </h5>
                            <table class="table" style="background-color:beige">
                                <thead>
                                    <tr><th style="color: black">Destino</th><th style="color: black">Costo</th>
                                </thead>
                                <%for(Viaje listadestinos: listaDestinos){%>
                                <tr>
                                    <td style="color: black"><%=listadestinos.getCiudad_destino()%></td>
                                    <td style="color: black"><%=listadestinos.getCosto_unitario()%></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
                    <%if(invalid1.equals("incorrecto")){%>
                    <h2>Elige otra fecha de viaje!</h2>
                    <%}%>
                </div>

            </div>
            <div class="mb-3 mt-4">
                <button type="submit" class="btn btn-outline-info rounded">Añadir</button>
            </div>
        </form>


    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
