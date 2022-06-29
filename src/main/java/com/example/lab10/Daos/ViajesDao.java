package com.example.lab10.Daos;

import com.example.lab10.Beans.Usuario;
import com.example.lab10.Beans.Viaje;

import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends DaoBase{

    public Usuario buscarPorId(String codigo_pucp) {
        Usuario usuario = null;

        String sql = "select * from usuarios where codigoPucp = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo_pucp);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setCodigoPucp(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }


    public Viaje buscarPorIdViajeCodigobuscarPorIdActHorario(String id, String codigo_pucp) {
        Viaje viaje = null;

        String sql = "select idviajes, codigoPucp, tikets from viajes where idviajes=? and codigoPucp=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);
            pstmt.setString(2, codigo_pucp);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    viaje = new Viaje();
                    viaje.setId_viaje(rs.getString(1));
                    viaje.setCodigo_comprador(rs.getString(2));
                    viaje.setCant_boletos(rs.getInt(3));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return viaje;
    }


    public ArrayList<Viaje> obtenerFechasViajes(String codigoPucp) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select fechaviaje from viajes where codigoPucp = ?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setFecha_viaje(rs.getString(1));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaViaje;
    }

    public ArrayList<Viaje> obtenerViajeporUsuario(String codigoPucp) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select idviajes,fechareserva,fechaviaje,origen,d.nombre as \"destino\",empresa,tikets,(d.costo*tikets) as \"Costo total\" \n" +
                "from viajes v, destino d where v.id_destino=d.id and codigoPucp=? \n" +
                "group by v.idviajes;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setId_viaje(rs.getString(1));
                    viaje.setFecha_reserva(rs.getString(2));
                    viaje.setFecha_viaje(rs.getString(3));
                    viaje.setCiudad_origen(rs.getString(4));
                    viaje.setCiudad_destino(rs.getString(5));
                    viaje.setEmpresa_seguro(rs.getString(6));
                    viaje.setCant_boletos(rs.getInt(7));
                    viaje.setCosto_total(rs.getInt(8));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public ArrayList<Viaje> listaViajesOrigen(String codigoPucp) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select distinct(origen) from viajes where codigoPucp=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setCiudad_origen(rs.getString(1));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public ArrayList<Viaje> listaViajesDestino(String codigoPucp) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select distinct(d.nombre) as \"destino\"  from viajes v, destino d\n" +
                "where v.id_destino=d.id and codigoPucp=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setCiudad_destino(rs.getString(1));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public ArrayList<Viaje> listaTotalOrigen(String codigoPucp, String ciudad_origen) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select idviajes,fechareserva,fechaviaje,origen,d.nombre as \"destino\",empresa,tikets,(d.costo*tikets) as \"Costo total\" \n" +
                "from viajes v, destino d where v.id_destino=d.id and codigoPucp=? and origen=? \n" +
                "group by v.idviajes;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);
            pstmt.setString(2, ciudad_origen);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setId_viaje(rs.getString(1));
                    viaje.setFecha_reserva(rs.getString(2));
                    viaje.setFecha_viaje(rs.getString(3));
                    viaje.setCiudad_origen(rs.getString(4));
                    viaje.setCiudad_destino(rs.getString(5));
                    viaje.setEmpresa_seguro(rs.getString(6));
                    viaje.setCant_boletos(rs.getInt(7));
                    viaje.setCosto_total(rs.getInt(8));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public ArrayList<Viaje> listaTotalDestino(String codigoPucp, String ciudad_destino) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select idviajes,fechareserva,fechaviaje,origen,d.nombre as \"destino\",empresa,tikets,(d.costo*tikets) as \"Costo total\" \n" +
                "from viajes v, destino d where v.id_destino=d.id and codigoPucp=? and d.nombre=? \n" +
                "group by v.idviajes;\n";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigoPucp);
            pstmt.setString(2, ciudad_destino);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setId_viaje(rs.getString(1));
                    viaje.setFecha_reserva(rs.getString(2));
                    viaje.setFecha_viaje(rs.getString(3));
                    viaje.setCiudad_origen(rs.getString(4));
                    viaje.setCiudad_destino(rs.getString(5));
                    viaje.setEmpresa_seguro(rs.getString(6));
                    viaje.setCant_boletos(rs.getInt(7));
                    viaje.setCosto_total(rs.getInt(8));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public void crearViaje(String fecha_viaje, String ciudad_origen, String id_ciudad_destino,
                           String empresa_seguro, String tickets, String codigo_pucp) {


        String sql = "insert into viajes(idviajes,fechareserva,fechaviaje,origen,id_destino,empresa,tikets,codigoPucp)\n" +
                "values(?,date(now()),?,?,?,?,?,?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            String id="";
            String[] nums = {"0","1","2","3","4","5","6","7","8","9"};
            for (int i = 0; i < 8; i++ ) {
                id += nums[(int) Math.round(Math.random() * 9)];
            }

            pstmt.setString(1, id);
            pstmt.setString(2, fecha_viaje);
            pstmt.setString(3, ciudad_origen);
            pstmt.setInt(4, Integer.parseInt(id_ciudad_destino));
            pstmt.setString(5,empresa_seguro);
            pstmt.setInt(6, Integer.parseInt(tickets));
            pstmt.setString(7,codigo_pucp);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Viaje> listaDestinos() {
        ArrayList<Viaje> listaDestinos = new ArrayList<>();

        String sql = "SELECT * FROM destino;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setId_destino(rs.getInt(1));
                    viaje.setCosto_unitario(rs.getInt(2));
                    viaje.setCiudad_destino(rs.getString(3));
                    listaDestinos.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaDestinos;
    }

    public ArrayList<Viaje> listaActualizar(String id_viaje, String codigoPucp) {
        ArrayList<Viaje> listaViaje = new ArrayList<>();

        String sql = "select d.nombre, v.tikets, v.origen \n" +
                "from viajes v, destino d \n" +
                "where v.id_destino=d.id and v.idviajes=? and v.codigoPucp=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id_viaje);
            pstmt.setString(2, codigoPucp);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Viaje viaje= new Viaje();
                    viaje.setCiudad_destino(rs.getString(1));
                    viaje.setCant_boletos(rs.getInt(2));
                    viaje.setCiudad_origen(rs.getString(3));
                    listaViaje.add(viaje);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViaje;
    }

    public void actualizarViaje(int id_destino, int tickets, String ciudad_origen, String id_viaje, String codigo_pucp) {

        String sql = "update viajes set id_destino =?, tikets=?, origen=? where idviajes=? and codigoPucp=?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, id_destino);
            pstmt.setInt(2, tickets);
            pstmt.setString(3, ciudad_origen);
            pstmt.setString(4,id_viaje);
            pstmt.setString(5,codigo_pucp);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarViaje(String id, String codigo_pucp) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "delete from viajes where idviajes=? and codigoPucp=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);
            pstmt.setString(2, codigo_pucp);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int total(String codigoPucp) {
        String sql = "select sum(d.costo*v.tikets) from viajes v , destino d where codigoPucp=? and v.id_destino=d.id ;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(codigoPucp));
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void anhadirGastos(String codigo_pucp, int Costo_total) {


        String sql = "update usuarios set gastos=? where codigoPucp=?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, Costo_total);
            pstmt.setString(2, codigo_pucp);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
