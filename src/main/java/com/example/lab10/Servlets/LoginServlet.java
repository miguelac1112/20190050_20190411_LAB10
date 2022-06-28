package com.example.lab10.Servlets;

import com.example.lab10.Beans.Usuario;
import com.example.lab10.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet",""})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        String logout = request.getParameter("finish");
        if(logout == null){
            requestDispatcher = request.getRequestDispatcher("inicio.jsp");
            requestDispatcher.forward(request,response);
        }else{
            if(logout.equals("yes")){
                HttpSession session = request.getSession();

                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            }else{

                requestDispatcher = request.getRequestDispatcher("inicio.jsp");
                requestDispatcher.forward(request,response);

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDao loginDao = new LoginDao();
        String codigoPucp = request.getParameter("codigo_pucp");
        String pass = request.getParameter("pass");
        Usuario usuario = loginDao.validar(codigoPucp, pass);
        HttpSession session = request.getSession();

        if(usuario !=null){
            session.setAttribute("usuarioSesion",usuario);
            session.setMaxInactiveInterval(60*60);
            response.sendRedirect(request.getContextPath()+"/MenuServlet");
        }else{
            session.setAttribute("indicador","error");
            response.sendRedirect(request.getContextPath()+"/LoginServlet");
        }
    }
}
