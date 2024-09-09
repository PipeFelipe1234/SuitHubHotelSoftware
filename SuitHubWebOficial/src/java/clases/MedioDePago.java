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

public class MedioDePago {
    private String id;
    private String nombre;
    private String descripcion;

    public MedioDePago() {
    }

    public MedioDePago(String id) {
        String cadenaSQL="select nombre, descripcion from medioDePago where id="+id;
        ResultSet resultado=ConectorBD.consultar(cadenaSQL);
        try {
            if(resultado.next()){
                this.id=id;
                nombre=resultado.getString("nombre");
                descripcion=resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(medioDePago.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar el id"+ ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return nombre;
    }
    
    public boolean grabar(){
        String cadenaSQL = "insert into medioDePago(nombre, descripcion) values ('"+nombre+"', '"+descripcion+"')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean modificar(){
        String cadenaSQL = "update  medioDePago set nombre='"+nombre+"',descripcion='"+descripcion+"' where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean eliminar(){
        String cadenaSQL = "delete from medioDePago where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public static ResultSet getLista(String filtro, String orden){
        if(filtro!=null && filtro !="") filtro= " where " + filtro;
        else filtro=" ";
        if(orden!=null && orden!="") orden=" order by  "+ orden;
        else orden=" ";
        String cadenaSQL = "select id, nombre, descripcion from medioDePago"+ filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }
    
    public static List<MedioDePago> getListaEnObjetos(String filtro, String orden){
        List<MedioDePago> lista = new ArrayList<>();
        ResultSet datos = MedioDePago.getLista(filtro, orden);
        if(datos!=null){
            try {
                while(datos.next()){
                MedioDePago medioPago = new MedioDePago();
                medioPago.setId(datos.getString("id"));
                medioPago.setNombre(datos.getString("nombre"));
                medioPago.setDescripcion(datos.getString("descripcion"));
                lista.add(medioPago);
                }
            } catch (SQLException ex) {
                Logger.getLogger(MedioDePago.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
    
        public static String getListaEnOptions(String preseleccionado){
        String lista="";
        List<MedioDePago> datos= MedioDePago.getListaEnObjetos(null, "nombre");
        for (int i = 0; i < datos.size(); i++) {
            MedioDePago medioPago = datos.get(i);
            String auxiliar="";
            if(preseleccionado.equals(medioPago.getId())) auxiliar=" selected";
            lista+="<option value='" +medioPago.getId()+"' "+auxiliar+">"+medioPago.getNombre()+"</option>";
        }
        
    return lista;
    }
}

