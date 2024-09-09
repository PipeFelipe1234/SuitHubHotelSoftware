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

public class TipoProducto {
    private String id;
    private String nombre;
    private String descripcion;

    public TipoProducto() {
    }

    public TipoProducto(String id) {
        String cadenaSQL = "select nombre, descripcion from TipoProducto where id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id=id;
                this.nombre = resultado.getString("nombre");
                this.descripcion = resultado.getString("descripcion");
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

    public String getDescripcion() {
        return descripcion != null ? descripcion : "";
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return nombre;
    }
    
    public boolean grabar() {
        String cadenaSQL = "insert into TipoProducto (nombre, descripcion) values ('" + nombre + "','" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean modificar() {
        String cadenaSQL = "update TipoProducto set nombre='" + nombre + "', descripcion='" + descripcion + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean eliminar() {
        String cadenaSQL = "delete from TipoProducto where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.trim().isEmpty()) filtro = " where " + filtro;
        else filtro = " ";
        if (orden != null && !orden.trim().isEmpty()) orden = " order by " + orden;
        else orden = " ";
        String cadenaSQL = "select id, nombre, descripcion from TipoProducto" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }
    
    public static List<TipoProducto> getListaEnObjetos(String filtro, String orden) {
        List<TipoProducto> lista = new ArrayList<>();
        ResultSet datos = TipoProducto.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    TipoProducto tipoProducto = new TipoProducto();
                    tipoProducto.setId(datos.getString("id"));
                    tipoProducto.setNombre(datos.getString("nombre"));
                    tipoProducto.setDescripcion(datos.getString("descripcion"));
                    lista.add(tipoProducto);
                }
            } catch (SQLException ex) {
                Logger.getLogger(TipoProducto.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<TipoProducto> datos = TipoProducto.getListaEnObjetos(null, "nombre");
        for (TipoProducto tipoProducto : datos) {
            String auxiliar = "";
            if (preseleccionado != null && preseleccionado.equals(String.valueOf(tipoProducto.getId()))) {
                auxiliar = " selected";
            }
            lista += "<option value='" + tipoProducto.getId() + "'" + auxiliar + ">" + tipoProducto.getNombre() + "</option>";
        }
        return lista;
    }
}
