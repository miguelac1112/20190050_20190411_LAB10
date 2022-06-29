package com.example.lab10.Servlets;

import com.example.lab10.Beans.Usuario;
import com.example.lab10.Beans.Viaje;
import com.example.lab10.Daos.LoginDao;
import com.example.lab10.Daos.ViajesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "ConfirmarContrasenaServlet", value = "/ConfirmarContrasena")
public class ConfirmarContrasenaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        LoginDao loginDao = new LoginDao();
        switch (action) {
            case "continuar" -> {
                String idViaje = request.getParameter("idViaje");
                Usuario user = (Usuario) request.getSession().getAttribute("usuarioSesion");
                String pass = user.getContrasenha();
                String codigo = user.getCodigoPucp();
                System.out.println(idViaje+" "+pass);
                request.setAttribute("idViaje",idViaje);
                request.setAttribute("pass",pass);
                request.setAttribute("codigo",codigo);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ConfirmarContrasena.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idViaje = request.getParameter("idViaje");
        String codigo = request.getParameter("codigo");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String pass = request.getParameter("pass");
        LoginDao loginDao = new LoginDao();
        ViajesDao viajesDao = new ViajesDao();
        System.out.println(idViaje+" "+codigo+" "+pass1+" "+pass2+" "+pass);
        int i=1;
        if(Objects.equals(pass1, pass2)){
            i=i+1;
        }
        System.out.println(i);
        if(i==2){
            Usuario usuario_pass = loginDao.validarPass(pass2,codigo);
            System.out.println(usuario_pass.getContrasenha());
            if(Objects.equals(usuario_pass.getContrasenha(), pass)){
                viajesDao.eliminarViaje(idViaje,codigo);
                response.sendRedirect(request.getContextPath()+"/MenuServlet");
            }else{
                request.setAttribute("invalid1","incorrecto");
                response.sendRedirect(request.getContextPath()+"/ConfirmarContrasena?a=continuar&idViaje="+idViaje);
            }
        }else{
            request.setAttribute("invalid2","incorrecto");
            response.sendRedirect(request.getContextPath()+"/ConfirmarContrasena?a=continuar&idViaje="+idViaje);
        }
    }
}
