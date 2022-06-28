package com.example.lab10.Daos;

import com.example.lab10.Beans.Usuario;

import java.sql.*;

public class LoginDao extends DaoBase {
    public Usuario validar(String codigoPucp,String password){
        Usuario usuario = null;

        String sql = "select* from usuarios where codigoPucp=? and contrasena=sha2(?,256);";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,codigoPucp);
            pstmt.setString(2,password);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    usuario = new Usuario();
                    usuario.setCodigoPucp(rs.getString(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setEdad(rs.getInt(4));
                    usuario.setEspecialidad(rs.getString(5));
                    usuario.setStatus(rs.getString(7));
                    usuario.setGastos(rs.getInt(8));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
}
