/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FotosTipoHabitacion {
    private String id;
    private String foto;
    private String idTipoHabitacion;

    // Constructores
    public FotosTipoHabitacion() {}

    public FotosTipoHabitacion(String id) {
        this.id = id;
        cargar();
    }

    // Métodos getters y setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getIdTipoHabitacion() {
        return idTipoHabitacion;
    }

    public void setIdTipoHabitacion(String idTipoHabitacion) {
        this.idTipoHabitacion = idTipoHabitacion;
    }

    // Método para cargar la información de una foto por su ID
    public void cargar() {
        String sql = "SELECT * FROM FotosTipoHabitacion WHERE id = '" + id + "'";
        ResultSet rs = ConectorBD.consultar(sql);
        try {
            if (rs.next()) {
                foto = rs.getString("foto");
                idTipoHabitacion = rs.getString("idTipoHabitacion");
            }
        } catch (SQLException ex) {
            System.out.println("Error al cargar la foto: " + ex.getMessage());
        }
    }

    // Método para grabar una nueva foto
    public void grabar() {
        String sql = "INSERT INTO FotosTipoHabitacion (foto, idTipoHabitacion) VALUES ('" + foto + "', '" + idTipoHabitacion + "')";
        ConectorBD.ejecutarQuery(sql);
    }

    // Método para modificar una foto existente
    public void modificar() {
        String sql = "UPDATE FotosTipoHabitacion SET foto = '" + foto + "' WHERE id = '" + id + "'";
        ConectorBD.ejecutarQuery(sql);
    }

    // Método para eliminar una foto
    public void eliminar() {
        String sql = "DELETE FROM FotosTipoHabitacion WHERE id = '" + id + "'";
        ConectorBD.ejecutarQuery(sql);
    }

    // Método para listar todas las fotos de un tipo de habitación
    public static ArrayList<FotosTipoHabitacion> getLista(String idTipoHabitacion) {
        ArrayList<FotosTipoHabitacion> lista = new ArrayList<>();
        String sql = "SELECT * FROM FotosTipoHabitacion WHERE idTipoHabitacion = '" + idTipoHabitacion + "'";
        ResultSet rs = ConectorBD.consultar(sql);
        try {
            while (rs.next()) {
                FotosTipoHabitacion foto = new FotosTipoHabitacion();
                foto.setId(rs.getString("id"));
                foto.setFoto(rs.getString("foto"));
                foto.setIdTipoHabitacion(rs.getString("idTipoHabitacion"));
                lista.add(foto);
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener la lista de fotos: " + ex.getMessage());
        }
        return lista;
    }
}
