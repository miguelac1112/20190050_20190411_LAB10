package com.example.lab10.Servlets;

import com.example.lab10.Beans.Usuario;
import com.example.lab10.Daos.RegistroDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "RegistroServlet", value = "/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher view =request.getRequestDispatcher("registro.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RegistroDao registroDao = new RegistroDao();
        ArrayList<Usuario> listaUsuarios = registroDao.obtenerUsuarios();

        String codigo;
        String nombre;
        String apellido;
        String edad;
        String correo_pucp;
        String especialidad;
        String contrasenha;
        String contrasenha_confirmada;

        int i=0;
        switch (action){
            case  "validacion" -> {

                codigo = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                edad = request.getParameter("edad");
                correo_pucp = request.getParameter("correo_pucp");
                especialidad = request.getParameter("especialidad");
                contrasenha = request.getParameter("contrasenha");
                contrasenha_confirmada = request.getParameter("contrasenha_confirmada");

                System.out.println(codigo+" "+nombre+" "+apellido+" "+edad+" "+correo_pucp+" "+especialidad+" "+contrasenha+" "+contrasenha_confirmada);

                for(Usuario listausuarios: listaUsuarios){
                    if(Objects.equals(listausuarios.getCorreo(), correo_pucp) || Objects.equals(listausuarios.getCodigoPucp(), codigo) ||
                            !Objects.equals(contrasenha, contrasenha_confirmada) || !Objects.equals(especialidad, "Telecomunicaciones")){
                        i++;
                    }
                }
                System.out.println(i);
                if(i==0){
                    registroDao.crearUsuario(codigo,nombre,apellido, Integer.parseInt(edad),especialidad,contrasenha,correo_pucp);
                    response.sendRedirect(request.getContextPath() + "/LoginServlet");
                }else{
                    request.setAttribute("invalid1","incorrecto");
                    response.sendRedirect(request.getContextPath() + "/RegistroServlet");
                }
            }
        }
    }
}
