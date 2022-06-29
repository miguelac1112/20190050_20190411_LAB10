<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.lab10.Beans.Viaje" %>
<jsp:useBean type="java.util.ArrayList<com.example.lab10.Beans.Viaje>" scope="request" id="lista_destinos"/>
<jsp:useBean id="viaje" scope="request" type="com.example.lab10.Beans.Viaje" />
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar</title>
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
            }
        </style>
    </head>
    <body>
        <div class="ventana" style="background-color: black">
            <div class="col-sm-14">
                <form method="POST" action="<%=request.getContextPath()%>/MenuServlet?a=actualizar">
                    <div class="mb-3">
                        <img class="mb-4 mt-4" src="Imagenes/logo.png" alt=" " width="230" height="150">
                        <p class="text-center" style="color: aliceblue; font-size: 25px" ><b>Edición</b></p>

                        <div class="mb-3 mt-3 ms-4 me-4 d-flex flex-column">
                            <label for="ticket" style="color: #f1ebeb; text-align: left;">Tickets</label>
                            <input class="form-control" value="<%=viaje.getCant_boletos()%>" type="number" min="1" max="15" step="1" name="ticket" id="ticket" required>
                            <input type="hidden" name="codigo_pucp" id="codigo_pucp" value="<%=viaje.getCodigo_comprador()%>" />
                            <input type="hidden" name="idviaje" id="idviaje" value="<%=viaje.getId_viaje()%>" />
                        </div>


                        <div class="mb-3 mt-3 ms-4 me-4 d-flex flex-column">
                            <label for="origen" style="color: #f1ebeb; text-align: left;">Ciudad origen</label>
                            <select class="form-control" name="origen" id="origen" required>
                                <option disabled>Seleccionar origen</option>
                                <option>Lima</option>
                                <option>Huancayo</option>
                                <option>Trujillo</option>
                            </select>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4 d-flex flex-column">
                            <label for="destino" style="color: #f1ebeb; text-align: left;">Ciudad destino</label>
                            <select class="form-control" name="destino" id="destino" required>
                                <option disabled>Seleccionar destino</option>
                                <%for(Viaje listaDestino: lista_destinos){%>
                                <option value="<%=listaDestino.getId_destino()%>"><%=listaDestino.getCiudad_destino()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="d-flex justify-content-around center">
                            <div class="mb-3 mt-4">
                                <button type="submit" class="btn btn-outline-info rounded">Editar</button>
                            </div>
                            <div class="mb-3 mt-4">
                                <a href="<%=request.getContextPath()%>/MenuServlet" type="button" class="btn btn-outline-info rounded">Regresar</a>
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
