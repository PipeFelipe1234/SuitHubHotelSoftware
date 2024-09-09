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

public class Hotel {
    private String nombre;
    private String direccion;
    private String ciudad;
    private String departamento;
    private String email;
    private String telefono;
    private String reglasDeReserva;
    private String politicasDepositoYComidas;
    private String foto;

    public Hotel() {
    }

    public Hotel(String nombre) {
        String cadenaSQL = "SELECT direccion, ciudad, departamento, email, telefono, reglasDeReserva, politicasDepositoYComidas, foto FROM Hotel WHERE nombre='" + nombre + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.nombre = nombre;
                this.direccion = resultado.getString("direccion");
                this.ciudad = resultado.getString("ciudad");
                this.departamento = resultado.getString("departamento");
                this.email = resultado.getString("email");
                this.telefono = resultado.getString("telefono");
                this.reglasDeReserva = resultado.getString("reglasDeReserva");
                this.politicasDepositoYComidas = resultado.getString("politicasDepositoYComidas");
                this.foto = resultado.getString("foto");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el nombre del hotel: " + ex.getMessage());
        }
    }

    // Getters and Setters para cada atributo
    public String getNombre() { return nombre != null ? nombre : ""; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDireccion() { return direccion != null ? direccion : ""; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getCiudad() { return ciudad != null ? ciudad : ""; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getDepartamento() { return departamento != null ? departamento : ""; }
    public void setDepartamento(String departamento) { this.departamento = departamento; }

    public String getEmail() { return email != null ? email : ""; }
    public void setEmail(String email) { this.email = email; }

    public String getTelefono() { return telefono != null ? telefono : ""; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getReglasDeReserva() { return reglasDeReserva != null ? reglasDeReserva : ""; }
    public void setReglasDeReserva(String reglasDeReserva) { this.reglasDeReserva = reglasDeReserva; }

    public String getPoliticasDepositoYComidas() { return politicasDepositoYComidas != null ? politicasDepositoYComidas : ""; }
    public void setPoliticasDepositoYComidas(String politicasDepositoYComidas) { this.politicasDepositoYComidas = politicasDepositoYComidas; }

    public String getFoto() { return foto != null ? foto : ""; }
    public void setFoto(String foto) { this.foto = foto; }

    @Override
    public String toString() { return nombre; }

    // Métodos de operación CRUD
    public boolean grabar() {
    // Verificar si ya existe un hotel registrado
    ResultSet resultado = ConectorBD.consultar("SELECT COUNT(*) as total FROM Hotel");
    try {
        if (resultado.next() && resultado.getInt("total") > 0) {
            System.out.println("Ya existe un hotel registrado. No se puede adicionar otro.");
            return false; // No permitir agregar más de un hotel
        }
    } catch (SQLException ex) {
        System.out.println("Error al consultar la tabla de hotel: " + ex.getMessage());
    }
    
    String cadenaSQL = "INSERT INTO Hotel (nombre, direccion, ciudad, departamento, email, telefono, reglasDeReserva, politicasDepositoYComidas, foto) "
            + "VALUES ('" + nombre + "','" + direccion + "','" + ciudad + "','" + departamento + "','" + email + "','" + telefono + "','" + reglasDeReserva + "','" + politicasDepositoYComidas + "','" + foto + "')";
    return ConectorBD.ejecutarQuery(cadenaSQL);
}

    public boolean modificar() {
        String cadenaSQL = "UPDATE Hotel SET direccion='" + direccion + "', ciudad='" + ciudad + "', departamento='" + departamento + "', email='" + email + "', telefono='" + telefono 
                + "', reglasDeReserva='" + reglasDeReserva + "', politicasDepositoYComidas='" + politicasDepositoYComidas + "', foto='" + foto + "' WHERE nombre='" + nombre + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM Hotel WHERE nombre='" + nombre + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.trim().isEmpty()) filtro = " WHERE " + filtro;
        else filtro = " ";
        if (orden != null && !orden.trim().isEmpty()) orden = " ORDER BY " + orden;
        else orden = " ";
        String cadenaSQL = "SELECT nombre, direccion, ciudad, departamento, email, telefono, reglasDeReserva, politicasDepositoYComidas, foto FROM Hotel" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<Hotel> getListaEnObjetos(String filtro, String orden) {
    List<Hotel> lista = new ArrayList<>();
    String cadenaSQL = "SELECT nombre, direccion, ciudad, departamento, email, telefono, reglasDeReserva, politicasDepositoYComidas, foto FROM Hotel LIMIT 1"; // Limitar a un resultado
    ResultSet datos = ConectorBD.consultar(cadenaSQL);
    if (datos != null) {
        try {
            while (datos.next()) {
                Hotel hotel = new Hotel();
                hotel.setNombre(datos.getString("nombre"));
                hotel.setDireccion(datos.getString("direccion"));
                hotel.setCiudad(datos.getString("ciudad"));
                hotel.setDepartamento(datos.getString("departamento"));
                hotel.setEmail(datos.getString("email"));
                hotel.setTelefono(datos.getString("telefono"));
                hotel.setReglasDeReserva(datos.getString("reglasDeReserva"));
                hotel.setPoliticasDepositoYComidas(datos.getString("politicasDepositoYComidas"));
                hotel.setFoto(datos.getString("foto"));
                lista.add(hotel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Hotel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return lista;
}

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<Hotel> datos = Hotel.getListaEnObjetos(null, "nombre");
        for (Hotel hotel : datos) {
            String auxiliar = "";
            if (preseleccionado != null && preseleccionado.equals(hotel.getNombre())) {
                auxiliar = " selected";
            }
            lista += "<option value='" + hotel.getNombre() + "'" + auxiliar + ">" + hotel.getNombre() + "</option>";
        }
        return lista;
    }
    
    public void cargar() {
    String cadenaSQL = "SELECT nombre, direccion, ciudad, departamento, email, telefono, reglasDeReserva, politicasDepositoYComidas, foto FROM Hotel LIMIT 1";
    ResultSet resultado = ConectorBD.consultar(cadenaSQL);
    try {
        if (resultado.next()) {
            this.nombre = resultado.getString("nombre");
            this.direccion = resultado.getString("direccion");
            this.ciudad = resultado.getString("ciudad");
            this.departamento = resultado.getString("departamento");
            this.email = resultado.getString("email");
            this.telefono = resultado.getString("telefono");
            this.reglasDeReserva = resultado.getString("reglasDeReserva");
            this.politicasDepositoYComidas = resultado.getString("politicasDepositoYComidas");
            this.foto = resultado.getString("foto");
        }
    } catch (SQLException ex) {
        System.out.println("Error al consultar el hotel: " + ex.getMessage());
    }
}

}
