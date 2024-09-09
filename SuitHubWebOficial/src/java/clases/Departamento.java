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

public class Departamento {
    private String codigo;
    private String nombre;

    public Departamento() {}

    public Departamento(String codigo) {
        String cadenaSQL = "SELECT nombre FROM Departamento WHERE codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                this.nombre = resultado.getString("nombre");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el código " + ex.getMessage());
        }
    }

    // Getters y Setters
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Métodos CRUD
    public boolean grabar() {
        String cadenaSQL = "INSERT INTO Departamento (nombre) VALUES ('" + nombre + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE Departamento SET nombre='" + nombre + "' WHERE codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM Departamento WHERE codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    // Métodos para obtener listas de departamentos
    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " WHERE " + filtro;
        } else {
            filtro = "";
        }
        if (orden != null && !orden.isEmpty()) {
            orden = " ORDER BY " + orden;
        } else {
            orden = "";
        }
        String cadenaSQL = "SELECT codigo, nombre FROM Departamento" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<Departamento> getListaEnObjetos(String filtro, String orden) {
        List<Departamento> lista = new ArrayList<>();
        ResultSet datos = Departamento.getLista(filtro, orden);
        try {
            while (datos.next()) {
                Departamento departamento = new Departamento();
                departamento.setCodigo(datos.getString("codigo"));
                departamento.setNombre(datos.getString("nombre"));
                lista.add(departamento);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<Departamento> datos = Departamento.getListaEnObjetos(null, "nombre");
        for (Departamento departamento : datos) {
            String seleccionado = preseleccionado != null && preseleccionado.equals(departamento.getCodigo()) ? " selected" : "";
            lista += "<option value='" + departamento.getCodigo() + "'" + seleccionado + ">" + departamento.getNombre() + "</option>";
        }
        return lista;
    }
}

