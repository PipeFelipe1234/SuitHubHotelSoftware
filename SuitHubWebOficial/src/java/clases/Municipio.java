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

public class Municipio {

    private String codigo;
    private String nombre;
    private String codigoDepartamento;

    public Municipio() {
    }

    public Municipio(String codigo) {
        String cadenaSQL = "SELECT nombre, codigoDepartamento FROM Municipio WHERE codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                nombre = resultado.getString("nombre");
                codigoDepartamento = resultado.getString("codigoDepartamento");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el codigo " + ex.getMessage());
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

    public String getCodigoDepartamento() {
        return codigoDepartamento;
    }

    public void setCodigoDepartamento(String codigoDepartamento) {
        this.codigoDepartamento = codigoDepartamento;
    }

    public Departamento getDepartamento() {
        return new Departamento(codigoDepartamento);
    }

    // Métodos CRUD

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO Municipio (nombre, codigoDepartamento) "
                + "VALUES ('" + nombre + "', '" + codigoDepartamento + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE Municipio SET nombre='" + nombre + "', codigoDepartamento='" 
                + codigoDepartamento + "' WHERE codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM Municipio WHERE codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    // Métodos para obtener listas de municipios

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
        String cadenaSQL = "SELECT Municipio.codigo, nombre, codigoDepartamento FROM Municipio" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<Municipio> getListaEnObjetos(String filtro, String orden) {
        List<Municipio> lista = new ArrayList<>();
        ResultSet datos = Municipio.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Municipio municipio = new Municipio();
                    municipio.setCodigo(datos.getString("codigo"));
                    municipio.setNombre(datos.getString("nombre"));
                    municipio.setCodigoDepartamento(datos.getString("codigoDepartamento"));
                    lista.add(municipio);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Municipio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<Municipio> datos = Municipio.getListaEnObjetos(null, "nombre");
        for (Municipio municipio : datos) {
            String auxiliar = "";
            if (preseleccionado != null && preseleccionado.equals(municipio.getCodigo())) {
                auxiliar = " selected";
            }
            lista += "<option value='" + municipio.getCodigo() + "'" + auxiliar + ">" + municipio.getNombre() + "</option>";
        }
        return lista;
    }
}
