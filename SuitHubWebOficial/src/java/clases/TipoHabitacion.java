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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TipoHabitacion {
    private String id;
    private String nombre;
    private String tarifa;
    private String descripcion;
    private String capacidad;

    public TipoHabitacion() {
    }

    public TipoHabitacion(String id) {
        String cadenaSQL = "select nombre, tarifa, descripcion, capacidad from TipoHabitacion where id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                this.nombre = resultado.getString("nombre");
                this.tarifa = resultado.getString("tarifa");
                this.descripcion = resultado.getString("descripcion");
                this.capacidad = resultado.getString("capacidad");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el id: " + ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre != null ? nombre : "";
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTarifa() {
        return tarifa != null ? tarifa : "";
    }

    public void setTarifa(String tarifa) {
        this.tarifa = tarifa;
    }

    public String getDescripcion() {
        return descripcion != null ? descripcion : "";
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCapacidad() {
        return capacidad != null ? capacidad : "";
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }

    @Override
    public String toString() {
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into TipoHabitacion (nombre, tarifa, descripcion, capacidad) values ('" 
                + nombre + "','" + tarifa + "','" + descripcion + "','" + capacidad + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update TipoHabitacion set nombre='" + nombre + "', tarifa='" + tarifa 
                + "', descripcion='" + descripcion + "', capacidad='" + capacidad + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from TipoHabitacion where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.trim().isEmpty()) filtro = " where " + filtro;
        else filtro = " ";
        if (orden != null && !orden.trim().isEmpty()) orden = " order by " + orden;
        else orden = " ";
        String cadenaSQL = "select id, nombre, tarifa, descripcion, capacidad from TipoHabitacion" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<TipoHabitacion> getListaEnObjetos(String filtro, String orden) {
        List<TipoHabitacion> lista = new ArrayList<>();
        ResultSet datos = TipoHabitacion.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    TipoHabitacion tipoHabitacion = new TipoHabitacion();
                    tipoHabitacion.setId(datos.getString("id"));
                    tipoHabitacion.setNombre(datos.getString("nombre"));
                    tipoHabitacion.setTarifa(datos.getString("tarifa"));
                    tipoHabitacion.setDescripcion(datos.getString("descripcion"));
                    tipoHabitacion.setCapacidad(datos.getString("capacidad"));
                    lista.add(tipoHabitacion);
                }
            } catch (SQLException ex) {
                Logger.getLogger(TipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<TipoHabitacion> datos = TipoHabitacion.getListaEnObjetos(null, "nombre");
        for (TipoHabitacion tipoHabitacion : datos) {
            String auxiliar = "";
            if (preseleccionado != null && preseleccionado.equals(String.valueOf(tipoHabitacion.getId()))) {
                auxiliar = " selected";
            }
            lista += "<option value='" + tipoHabitacion.getId() + "'" + auxiliar + ">" + tipoHabitacion.getNombre() + "</option>";
        }
        return lista;
    }
    public static TipoHabitacion getById(String id) {
    TipoHabitacion tipoHabitacion = null;
    String cadenaSQL = "select nombre, tarifa, descripcion, capacidad from TipoHabitacion where id=" + id;
    ResultSet resultado = ConectorBD.consultar(cadenaSQL);
    try {
        if (resultado.next()) {
            tipoHabitacion = new TipoHabitacion();
            tipoHabitacion.setId(id);
            tipoHabitacion.setNombre(resultado.getString("nombre"));
            tipoHabitacion.setTarifa(resultado.getString("tarifa"));
            tipoHabitacion.setDescripcion(resultado.getString("descripcion"));
            tipoHabitacion.setCapacidad(resultado.getString("capacidad"));
        }
    } catch (SQLException ex) {
        System.out.println("Error al consultar el id: " + ex.getMessage());
    }
    return tipoHabitacion;
}

}
