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

public class Inventario {

    private String id;
    private String nombre;
    private String descripcion;
    private String valorUnitario;
    private String idTipoProducto;
    private String cantidad;

    public Inventario() {
    }

    public Inventario(String id) {
        String cadenaSQL = "SELECT nombre, descripcion, valorUnitario, idTipoProducto, cantidad FROM Inventario WHERE id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
                valorUnitario = resultado.getString("valorUnitario");
                idTipoProducto = resultado.getString("idTipoProducto");
                cantidad = resultado.getString("cantidad");
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

    public String getValorUnitario() {
        return valorUnitario != null ? valorUnitario : "";
    }

    public void setValorUnitario(String valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public String getIdTipoProducto() {
        if (idTipoProducto == null) {
            return "";
        }
        return idTipoProducto;
    }

    public TipoProducto getTipoProducto() {
        return new TipoProducto(idTipoProducto);
    }

    public void setIdTipoProducto(String idTipoProducto) {
        this.idTipoProducto = idTipoProducto;
    }

    public String getCantidad() {
        return cantidad != null ? cantidad : "";
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO Inventario (nombre, descripcion, valorUnitario, idTipoProducto, cantidad) VALUES ('"
                + nombre + "', '" + descripcion + "', '" + valorUnitario + "', '" + idTipoProducto + "', '" + cantidad + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE Inventario SET nombre='" + nombre + "', descripcion='" + descripcion + "', "
                + "valorUnitario='" + valorUnitario + "', idTipoProducto='" + idTipoProducto + "', cantidad='" + cantidad
                + "' WHERE id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
    // Asegúrate de que el ID está siendo correctamente establecido
    if (id == null || id.isEmpty()) {
        System.out.println("ID no especificado para eliminar.");
        return false;
    }

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
        String cadenaSQL = "SELECT id, nombre, descripcion, valorUnitario, idTipoProducto, cantidad FROM Inventario" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }
    
     public static String getListaCompletaEnArregloJS(String filtro, String orden) {
    String lista = "[";
    List<Inventario> datos = Inventario.getListaEnObjetos(filtro, orden);
    for (int i = 0; i < datos.size(); i++) {
        Inventario inventario = datos.get(i);
        if (i > 0) lista += ",";
        lista += "[";
        lista += "'" + inventario.getId() + "',";      // id
        lista += "'" + inventario.getNombre() + "',";  // nombre
        lista += "'" + inventario.getDescripcion() + "',";  // descripcion
        lista += "'" + inventario.getValorUnitario() + "'";  // valor unitario
        lista += "]";
    }
    lista += "];";
    return lista;
}




    public static List<Inventario> getListaEnObjetos(String filtro, String orden) {
        List<Inventario> lista = new ArrayList<>();
        ResultSet datos = Inventario.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Inventario inventario = new Inventario();
                    inventario.setId(datos.getString("id"));
                    inventario.setNombre(datos.getString("nombre"));
                    inventario.setDescripcion(datos.getString("descripcion"));
                    inventario.setValorUnitario(datos.getString("valorUnitario"));
                    inventario.setIdTipoProducto(datos.getString("idTipoProducto"));
                    inventario.setCantidad(datos.getString("cantidad"));
                    lista.add(inventario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Inventario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

}

