<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <style>
            body{
                background-image: url("imagenes/fondo.jpg");
                background-position: center ;
                background-repeat: no-repeat;
                background-position: center center;
                background-attachment: fixed;
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

        <nav class="navbar navbar-expand-lg navbar-scroll fixed-top shadow-0 border-bottom border-dark" style="background-color:<%=plateado%>">
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
                            <a class="nav-link" style="color: white" href="#!">Arturo Noriega</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white" href="#!">Golden</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white" href="#!">Viaje</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white" href="#!">Registro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white"  href="#!">Actulización</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: white"  href="#!">Cerrar Sesion</a>
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
                <h2 style="color:white"> Lista de viajes </h2>
                <table class="table" style="background-color: <%=plateado%>">
                    <thead>
                        <tr>
                            <th>Identificador de viaje</th><th>Fecha de reserva</th><th>Fecha de viaje</th><th>Cuidad de origen</th><th>Cuidad de destino</th><th>Empresa de seguros</th><th>Numero de boletos</th><th>Costo total</th>
                        </tr>
                    </thead>


                    <tr>
                        <td >1</td>
                        <td>x</td>
                        <td>x</td>
                        <td>x</td>
                        <td>x</td>
                        <td>x</td>
                        <td>x</td>
                        <td> x  </td>
                    </tr>
                </table>
            </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</html>