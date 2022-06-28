<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioSesion" scope="session" type="com.example.lab10.Beans.Usuario" class="com.example.lab10.Beans.Usuario"/>
<%@ page import="com.example.lab10.Beans.Viaje" %>
<%@ page import="com.example.lab10.Daos.ViajesDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Integer" %>

<%ViajesDao viajesDao = new ViajesDao();%>
<%ArrayList<Viaje> listaViajes = viajesDao.obtenerViajeporUsuario(usuarioSesion.getCodigoPucp());%>
<%ArrayList<Viaje> listaDestino = viajesDao.listaViajesDestino(usuarioSesion.getCodigoPucp());%>
<%ArrayList<Viaje> listaOrigen =viajesDao.listaViajesOrigen(usuarioSesion.getCodigoPucp());%>
<%=listaViajes%>
<%int costo_total=viajesDao.total(usuarioSesion.getCodigoPucp());%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Logueado</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <style>
            body{
                background-image: url("Imagenes/fondo.jpg");
                background-position: center ;
                background-repeat: no-repeat;
                background-position: center center;
                background-attachment: fixed;
                font-family: Georgia;
            }
            #main-container{
                margin-top: 5000px;
                margin: 10px ;
                width: 1200px;
            }
            .table {
                padding-left: 30px;
                padding-right: 30px;
            }

            thead {
                border-top: hidden;
                font-size: 14px;
            }

            .table td {
                padding: 0.5rem;
                font-weight: 500;
            }

            .table th {
                padding: 0.5rem;
                font-weight: 100;
            }
            .navbar{
                position: fixed;
            }
            /* Color of the links BEFORE scroll */
            .navbar-scroll .nav-link,
            .navbar-scroll .navbar-toggler-icon,
            .navbar-scroll .navbar-brand {
                color: #262626;
            }

            /* Color of the links AFTER scroll */
            .navbar-scrolled .nav-link,
            .navbar-scrolled .navbar-toggler-icon,
            .navbar-scroll .navbar-brand {
                color: #262626;
            }

            /* Color of the navbar AFTER scroll */
            .navbar-scrolled {
                background-color: #fff;
            }

            /* An optional height of the navbar AFTER scroll */

        </style>
    </head>

    <body >
        <%String azul = "#177cff" ;%>
        <%String amarillo="#FFC017" ;%>
        <%String  negro ="#000000";%>
        <%String plateado ="#C0C0C0";%>
        <%String valor="";%>
        <%String status="";%>
        <%if (costo_total<100){
            valor=azul;
            status="Normal";
        }
        if (costo_total>100 && costo_total<999){
            valor=plateado;
            status="Silver";
        }
        if (costo_total>1000 && costo_total<9999){
            valor=amarillo;
            status="Gold";
        }
        if (costo_total>10000){
            valor=negro;
            status="Platinum";
        }%>


        <nav class="navbar navbar-expand-lg navbar-scroll fixed-top shadow-0 border-bottom border-dark" style="background-color:<%=valor%>">
            <div class="container">
                <a class="navbar-brand" href="#!"><i class="fab fa-mdb fa-4x"></i></a>
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" style="color: white" ><%=usuarioSesion.getNombre()%> <%=usuarioSesion.getApellido()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white" href="#!"><%=status%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white"  href="<%=request.getContextPath()%>/LoginServlet?finish=yes">Cerrar Sesion</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Navbar -->
            <br>
            <br>
            <br>
            <br>
            <br>


            <div class="container" >
                <h2 style="color:black"><center>  Lista de viajes </center>  </h2>
                <br>
                <br>
                <br>
                <div class="d-flex justify-content-start " >
                    <form>
                        <select class="form-control mx-4" style="width:250px;" name="origen"  required>
                            <option disabled>Seleccionar origen</option>
                            <%for (Viaje viaje : listaOrigen) {%>
                            <option value="<%=viaje.getCiudad_origen()%>"><%=viaje.getCiudad_origen()%></option>
                            <%}%>
                        </select>
                        <a type="submit" role="button" class="btn btn-outline-info mx-4"style="width: 80px;background-color:beige"; >origen</a>
                    </form>
                    <br>
                    <br>
                    <form>
                        <select class="form-control mx-4" style="width:250px;" name="destino"  required>
                            <option disabled>Seleccionar destino</option>
                            <%for (Viaje viaje : listaDestino) {%>
                            <option value="<%=viaje.getCiudad_destino()%>"><%=viaje.getCiudad_destino()%></option>
                            <%}%>
                        </select>
                        <a type="submit" role="button" class="btn btn-outline-info mx-4" style="width: 80px;background-color:beige";>destino</a>
                    </form>

                </div>
                <br>

                <table class="table" style="background-color:beige">
                    <thead>
                        <tr><th style="color: black">Identificador de viaje</th><th style="color: black">Fecha de reserva</th><th style="color: black">Fecha de viaje</th><th style="color: black">Cuidad de origen</th><th style="color: black">Cuidad de destino</th><th style="color: black">Empresa de seguros</th><th style="color: black">Numero de boletos</th><th style="color: black">Costo total</th></tr>
                    </thead>
                    <%for(Viaje listaViajes1: listaViajes){%>
                    <tr>
                        <td style="color: black"><%=listaViajes1.getId_viaje()%></td>
                        <td style="color: black"><%=listaViajes1.getFecha_reserva()%></td>
                        <td style="color: black"><%=listaViajes1.getFecha_viaje()%></td>
                        <td style="color: black"><%=listaViajes1.getCiudad_origen()%></td>
                        <td style="color: black"><%=listaViajes1.getCiudad_destino()%></td>
                        <td style="color: black"><%=listaViajes1.getEmpresa_seguro()%></td>
                        <td style="color: black"><%=listaViajes1.getCant_boletos()%></td>
                        <td style="color: black"><%=listaViajes1.getCosto_total()%></td>

                        <td> <a  type="submit" role="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/MenuServlet?a=Actualizar&idViaje=<%=listaViajes1.getId_viaje()%>&codigoPucp=<%=usuarioSesion.getCodigoPucp()%>">Editar</a></td>
                        <td> <a  type="submit" role="button" class="btn btn-outline-warning" href="<%=request.getContextPath()%>/MenuServlet?a=Borrar&idViaje=<%=listaViajes1.getId_viaje()%>&codigoPucp=<%=usuarioSesion.getCodigoPucp()%>">Borrar</a></td>
                    </tr>
                    <%}%>
                </table>

                <div class="d-flex justify-content-evenly">
                    <div>
                        <a  type="submit" role="button" class="btn btn-success " href="">Añadir</a>
                    </div>
                    <div>
                        <h2 style="color: white ">Costo:<%=costo_total%></h2>
                    </div>
                </div>

            </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</html>