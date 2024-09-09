/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;


import clases.Departamento;
import clases.GeneroPersona;
import clases.Municipio;
import clases.TipoPersona;
import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Persona {
    private String identificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String nacionalidad;
    private String telefono;
    private String codigoDepartamento;
    private String codigoCiudad;
    private String email;
    private String tipo;
    private String clave;

    public Persona() {
    }

    public Persona(String identificacion) {
    String cadenaSQL = "SELECT nombre, apellido, genero, nacionalidad, telefono, codigoDepartamento, codigoCiudad, email, tipo, clave " +
                       "FROM Persona WHERE identificacion='" + identificacion + "'";
    ResultSet resultado = ConectorBD.consultar(cadenaSQL);
    try {
        if (resultado.next()) {
            this.identificacion = identificacion;
            nombre = resultado.getString("nombre");
            apellido = resultado.getString("apellido");
            genero = resultado.getString("genero");
            nacionalidad = resultado.getString("nacionalidad");
            telefono = resultado.getString("telefono");
            codigoDepartamento = resultado.getString("codigoDepartamento");
            codigoCiudad = resultado.getString("codigoCiudad");
            email = resultado.getString("email");
            tipo = resultado.getString("tipo");
            clave = resultado.getString("clave");
        }
    } catch (SQLException ex) {
        System.out.println("Error al consultar la identificación: " + ex.getMessage());
    }
}


    public String getIdentificacion() {
        String resultado=identificacion;
        if(identificacion==null) resultado="";
        return resultado;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        String resultado=nombre;
        if(nombre==null) resultado="";
        return resultado;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        String resultado=apellido;
        if(apellido==null) resultado="";
        return resultado;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /*public String getGenero() {
        return genero;
    }*/
    public GeneroPersona getGeneroEnObjeto(){
        return new GeneroPersona(genero);
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getNacionalidad() {
    String resultado = nacionalidad;
    if (nacionalidad == null) resultado = "";
    return resultado;
}


    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
    

    public String getTelefono() {
        String resultado=telefono;
        if(telefono==null) resultado="";
        return resultado;   
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCodigoDepartamento() {
        return codigoDepartamento;
    }

    public void setCodigoDepartamento(String codigoDepartamento) {
        this.codigoDepartamento = codigoDepartamento;
    }
    
    public Departamento getcodigoDepartamento() {
        return new Departamento(codigoDepartamento);
    }

    public String getCodigoCiudad() {
        return codigoCiudad;
    }

    public void setCodigoCiudad(String codigoCiudad) {
        this.codigoCiudad = codigoCiudad;
    }
    
    public Municipio getcodigoCiudad() {
        return new Municipio(codigoCiudad);
    }

    public String getEmail() {
        String resultado=email;
        if(email==null) resultado="";
        return resultado;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipo() {
        return tipo;
    }
    
    public TipoPersona getTipoEnObjeto(){
        return new TipoPersona(tipo);
    } 
   

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    

    public String getClave() {
        String resultado=clave;
        if(clave==null) resultado="";
        return resultado;
    }

   /* public void setClave(String clave) {
        this.clave = clave;
    }*/

    public void setClave(String clave) {
        if (clave==null || clave.trim().length()==0) clave=identificacion;
        if (clave.length()<32) {
            this.clave="md5 ('"+clave+"')";
        } else {
            this.clave=" '"+clave+"' ";
        }
    }
    

    @Override
    public String toString() {
        String datos="";
        if (identificacion!=null) {
            datos= identificacion+" - "+nombre+" "+apellido;    
        }
        return datos;
    }
    
    public boolean grabar() {
    // Si los valores de codigoDepartamento o codigoCiudad son nulos, no los incluyas en la cadena SQL
    String cadenaSQL = "INSERT INTO Persona(identificacion, nombre, apellido, genero, nacionalidad, telefono, codigoDepartamento, codigoCiudad, email, tipo, clave) " +
                       "VALUES ('" + identificacion + "', '" + nombre + "', '" + apellido + "', '" + genero + "', '" + nacionalidad + "', '" + telefono + "', " +
                       (codigoDepartamento != null ? "'" + codigoDepartamento + "'" : "NULL") + ", " +
                       (codigoCiudad != null ? "'" + codigoCiudad + "'" : "NULL") + ", " +
                       "'" + email + "', '" + tipo + "', " + clave + ")";
    return ConectorBD.ejecutarQuery(cadenaSQL);
}

    
    public boolean modificar(String identificacionAnterior){
    String cadenaSQL = "UPDATE Persona SET identificacion='" + identificacion + "', nombre='" + nombre + "', apellido='" + apellido + "', genero='" + genero + "', " +
                       "nacionalidad='" + nacionalidad + "', telefono='" + telefono + "', " +
                       "codigoDepartamento=" + (codigoDepartamento != null ? "'" + codigoDepartamento + "'" : "NULL") + ", " +
                       "codigoCiudad=" + (codigoCiudad != null ? "'" + codigoCiudad + "'" : "NULL") + ", " +
                       "email='" + email + "', tipo='" + tipo + "', clave=" + clave + " " +
                       "WHERE identificacion='" + identificacionAnterior + "'";
    return ConectorBD.ejecutarQuery(cadenaSQL);
}

    
    public boolean eliminar(){
        String cadenaSQL ="delete from Persona where identificacion="+identificacion;
        System.out.println("cadenaSQL "+cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public static ResultSet getLista(String filtro, String orden){
        if(filtro!=null && filtro !="") filtro= " where " + filtro;
        else filtro=" ";
        if(orden!=null && orden!="") orden=" order by  "+ orden;
        else orden=" ";
        String cadenaSQL="select identificacion, nombre, apellido, genero, nacionalidad, "
                + "telefono, codigoDepartamento, codigoCiudad, email, tipo, clave from persona "+ filtro + orden;
          //System.out.println(cadenaSQL); prueba para revisar como esta iniciando en sesion 
        return ConectorBD.consultar(cadenaSQL);
    }
    
    
    public static List<Persona> getListaEnObjetos(String filtro, String orden){
        List<Persona> lista= new ArrayList<>();
        ResultSet datos = Persona.getLista(filtro, orden);
        if(datos!=null){
            try {
                while(datos.next()){
                Persona persona = new Persona();
                persona.setIdentificacion(datos.getString("identificacion"));
                persona.setNombre(datos.getString("nombre"));
                persona.setApellido(datos.getString("apellido"));
                persona.setGenero(datos.getString("genero"));
                persona.setNacionalidad(datos.getString("nacionalidad"));
                persona.setTelefono(datos.getString("telefono"));
                persona.setCodigoDepartamento(datos.getString("codigoDepartamento"));
                persona.setCodigoCiudad(datos.getString("codigoCiudad"));
                persona.setEmail(datos.getString("email"));
                persona.setTipo(datos.getString("tipo"));
                persona.setClave(datos.getString("clave"));
                lista.add(persona);
                }
             } catch (SQLException ex) {
                Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
    
    public GeneroPersona getGeneroPersona(){
        return new GeneroPersona(tipo);
    } 
    
   public static String getListaEnArregloJS(String filtro, String orden){
       String lista="[";
       List<Persona> datos=Persona.getListaEnObjetos(filtro, orden);
       for (int i = 0; i < datos.size(); i++) {
           Persona persona = datos.get(i);
           if (i>0) lista+=", ";
           lista+="'"+ persona+"'";
       }
       lista+="];";
   return lista;
   }
    
   public static Persona validar(String identificacion, String clave){
        Persona persona= null;
        List<Persona>  lista= Persona.getListaEnObjetos("identificacion='"+identificacion+
                "' and clave=md5('"+clave+"')", null);
        if(lista.size()>0){
            persona=lista.get(0); // get devuelve el primer elemento de la lista
        }
       return persona;
    }
   
}
