package com.example.lab10.Daos;

import com.example.lab10.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class RegistroDao extends DaoBase{

    public void crearUsuario(String codigo, String nombre, String apellido, int edad, String especialidad, String contrasena, String correo){


        String sql = "insert into usuarios(codigoPucp,nombre,apellido,edad,especialidad,contrasena,correo)\n" +
                "values (?,?,?,?,?,sha2(?,256),?);";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.setString(2, nombre);
            pstmt.setString(3, apellido);
            pstmt.setInt(4, edad);
            pstmt.setString(5, especialidad);
            pstmt.setString(6, contrasena);
            pstmt.setString(7, correo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Usuario> obtenerUsuarios(){

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT codigoPucp, correo FROM usuarios");){
            while (rs.next()){
                Usuario usuario= new Usuario();
                usuario.setCodigoPucp(rs.getString(1));
                usuario.setCorreo(rs.getString(2));
                listaUsuarios.add(usuario);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaUsuarios;
    }
}
