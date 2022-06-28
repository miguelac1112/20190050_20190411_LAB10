package com.example.lab10.Servlets;

import com.example.lab10.Beans.Viaje;
import com.example.lab10.Daos.ViajesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MenuServlet", value = "/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ViajesDao viajesDao = new ViajesDao();

        switch (action){
            case "listar" ->{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }
            case "Actualizar" ->{
                String idViaje = request.getParameter("idViaje");
                String codigoPucp = request.getParameter("codigoPucp");
                System.out.println(idViaje+" "+codigoPucp);
                Viaje viaje = viajesDao.buscarPorIdViajeCodigobuscarPorIdActHorario(idViaje,codigoPucp);
                if (viaje != null) {
                    System.out.println(viaje.getCant_boletos());
                    request.setAttribute("viaje", viaje);
                    request.setAttribute("lista_destinos", viajesDao.listaDestinos());
                    RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("editar.jsp");
                    requestDispatcher1.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ViajesDao viajesDao = new ViajesDao();
        switch (action) {
            case "actualizar" -> {
                String tickets = request.getParameter("ticket");
                String origen = request.getParameter("origen");
                String id_destino = request.getParameter("destino");
                String codigo_pucp = request.getParameter("codigo_pucp");
                String idviaje = request.getParameter("idviaje");
                viajesDao.actualizarViaje(Integer.parseInt(id_destino),Integer.parseInt(tickets),origen,idviaje,codigo_pucp);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            }
        }
    }
}
