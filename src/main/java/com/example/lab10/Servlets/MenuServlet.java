package com.example.lab10.Servlets;

import com.example.lab10.Beans.Usuario;
import com.example.lab10.Beans.Viaje;
import com.example.lab10.Daos.ViajesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

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
            case "crearViaje" ->{
                String codigoPucp = request.getParameter("codigoPucp");
                Usuario usuario = viajesDao.buscarPorId(codigoPucp);
                request.setAttribute("usuario",usuario);
                request.setAttribute("listaDestinos",viajesDao.listaDestinos());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("añadir.jsp");
                requestDispatcher1.forward(request, response);
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
            case "crear_viaje" ->{
                String fecha_viaje = request.getParameter("fecha_viaje");
                String ciudad_origen = request.getParameter("ciudad_origen");
                String id_ciudad_destino = request.getParameter("id_ciudad_destino");
                String empresa_seguro = request.getParameter("empresa_seguro");
                String tickets = request.getParameter("tickets");
                String codigo_pucp = request.getParameter("codigo_pucp");
                ArrayList<Viaje> fechasViajes = viajesDao.obtenerFechasViajes(codigo_pucp);

                int i=0;
                for(Viaje listafechas: fechasViajes){
                    if(Objects.equals(listafechas.getFecha_viaje(), fecha_viaje)){
                        i++;
                    }
                }
                System.out.println(i);
                if(i==0){
                    viajesDao.crearViaje(fecha_viaje,ciudad_origen, id_ciudad_destino,empresa_seguro,tickets,codigo_pucp);
                    response.sendRedirect(request.getContextPath() + "/MenuServlet");
                }else{
                    request.setAttribute("invalid1","incorrecto");
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?a=crearViaje&codigoPucp="+codigo_pucp);
                }
            }
        }
    }
}
