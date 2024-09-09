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

public class InventarioTipoHabitacion {

    private String id;
    private String idTipoHabitacion;
    private String idInventario;
    private String cantidad;

    public InventarioTipoHabitacion() {
    }

    public InventarioTipoHabitacion(String id) {
        String cadenaSQL = "SELECT idTipoHabitacion, idInventario, cantidad FROM InventarioTipoHabitacion WHERE id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                this.idTipoHabitacion = resultado.getString("idTipoHabitacion");
                this.idInventario = resultado.getString("idInventario");
                this.cantidad = resultado.getString("cantidad");
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

    public String getIdTipoHabitacion() {
        return idTipoHabitacion != null ? idTipoHabitacion : "";
    }

    public void setIdTipoHabitacion(String idTipoHabitacion) {
        this.idTipoHabitacion = idTipoHabitacion;
    }

    public String getIdInventario() {
        return idInventario != null ? idInventario : "";
    }

    public void setIdInventario(String idInventario) {
        this.idInventario = idInventario;
    }

    public String getCantidad() {
        return cantidad != null ? cantidad : "";
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO InventarioTipoHabitacion (idTipoHabitacion, idInventario, cantidad) VALUES ('"
                + idTipoHabitacion + "', '" + idInventario + "', '" + cantidad + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE InventarioTipoHabitacion SET idTipoHabitacion='" + idTipoHabitacion + "', "
                + "idInventario='" + idInventario + "', cantidad='" + cantidad + "' WHERE id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM InventarioTipoHabitacion WHERE id='" + id + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }


    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " WHERE " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && !orden.isEmpty()) {
            orden = " ORDER BY " + orden;
        } else {
            orden = " ";
        }
        String cadenaSQL = "SELECT id, idTipoHabitacion, idInventario, cantidad FROM InventarioTipoHabitacion" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<InventarioTipoHabitacion> getListaEnObjetos(String filtro, String orden) {
        List<InventarioTipoHabitacion> lista = new ArrayList<>();
        ResultSet datos = InventarioTipoHabitacion.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    InventarioTipoHabitacion inventario = new InventarioTipoHabitacion();
                    inventario.setId(datos.getString("id"));
                    inventario.setIdTipoHabitacion(datos.getString("idTipoHabitacion"));
                    inventario.setIdInventario(datos.getString("idInventario"));
                    inventario.setCantidad(datos.getString("cantidad"));
                    lista.add(inventario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(InventarioTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaCompletaEnArregloJS(String filtro, String orden) {
        String lista = "[";
        List<InventarioTipoHabitacion> datos = InventarioTipoHabitacion.getListaEnObjetos(filtro, orden);
        for (int i = 0; i < datos.size(); i++) {
            InventarioTipoHabitacion inventario = datos.get(i);
            if (i > 0) lista += ",";
            lista += "[";
            lista += "'" + inventario.getId() + "',";
            lista += "'" + inventario.getIdTipoHabitacion() + "',";
            lista += "'" + inventario.getIdInventario() + "',";
            lista += "'" + inventario.getCantidad() + "'";
            lista += "]";
        }
        lista += "];";
        return lista;
    }
}
