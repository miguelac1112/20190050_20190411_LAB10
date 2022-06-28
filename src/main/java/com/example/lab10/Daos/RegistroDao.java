package com.example.lab10.Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistroDao extends DaoBase{

    public void crearUsuario(String codigo, String nombre, String apellido, int edad, String especialidad, String contrasena){


        String sql = "insert into usuarios(codigoPucp,nombre,apellido,edad,especialidad,contrasena,gastos)\n" +
                "values (?,?,?,?,?,sha2(?,256));";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.setString(2, nombre);
            pstmt.setString(3, apellido);
            pstmt.setInt(4, edad);
            pstmt.setString(5, especialidad);
            pstmt.setString(6, contrasena);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
