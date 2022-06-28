<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="invalid1" scope="request" type="java.lang.String" class="java.lang.String" />
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>inicioSesion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
              crossorigin="anonymous">

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

        <div class=" ventana " style="background-color: black">
            <div class="col-sm-14">
                <form class="form-login" method="POST" action="<%=request.getContextPath()%>/RegistroServlet?a=validacion">
                    <div class="mb-3">
                        <img class="mb-4 mt-4" src="Imagenes/logo.png" alt=" " width="230" height="150">
                        <p class="text-center" style="color: aliceblue; font-size: 25px" ><b>Listo para unirte</b></p>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="text" class="form-control" name="nombre" id="nombre"  placeholder="Nombre" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="text" class="form-control" name="apellido" id="apellido"  placeholder="Apellido" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input class="form-control" placeholder="Edad" type="number" min="18" max="29" step="1" name="edad" id="edad" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="tel" class="form-control" name="codigo" id="codigo" maxlength="8" minlength="8" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" placeholder="Codigo Pucp" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="email" class="form-control" id="correo_pucp" name="correo_pucp" aria-describedby="emailHelp" placeholder="Correo Pucp" required>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <label for="especialidad"></label>
                            <select class="form-select" name="especialidad" id="especialidad" required>
                                <option disabled>Seleccionar especialidad</option>
                                <option>Telecomunicaciones</option>
                                <option>Electrónica</option>
                                <option>Informática</option>
                            </select>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="password" class="form-control"  id="campo" name="contrasenha" placeholder="Contraseña" required>
                            <span id="campoOK" style="color: white"></span>
                        </div>
                        <div class="mb-3 mt-3 ms-4 me-4">
                            <input type="password" class="form-control" id="campo2" name="contrasenha_confirmada" placeholder="Confirmar contraseña" required>
                            <span id="campoOK2" style="color: white"></span>
                        </div>
                        <div class="mb-3 mt-4">
                            <button type="submit" class="btn btn-outline-info rounded">Registrarse</button>
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
    <script>
        document
            .getElementById('campo')
            .addEventListener('input', function(evt) {
                const campo = evt.target,
                    valido = document.getElementById('campoOK'),

                    regex = /^(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ]/;

                //Se muestra un texto válido/inválido a modo de ejemplo
                if (regex.test(campo.value)) {
                    valido.innerText = "válido";
                } else {
                    valido.innerText = "incorrecto";
                }
            });
    </script>
    <script>
        document
            .getElementById('campo2')
            .addEventListener('input', function(evt) {
                const campo = evt.target,
                    valido = document.getElementById('campoOK2'),

                    regex = /^(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ]/;

                //Se muestra un texto válido/inválido a modo de ejemplo
                if (regex.test(campo.value)) {
                    valido.innerText = "válido";
                } else {
                    valido.innerText = "incorrecto";
                }
            });
    </script>

</html>
