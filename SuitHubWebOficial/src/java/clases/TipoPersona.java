/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;


public class TipoPersona {
    
    private String codigo;

    public TipoPersona(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getNombre(){
        String nombre=null;
        switch(codigo){
            case "A": nombre="Administrador"; break;
            case "R": nombre="Recepcionista"; break;
            case "H": nombre="Huesped"; break;
            default: nombre="Desconocido"; break;
        }
        return nombre;
    }

    @Override
    public String toString() {
        return getNombre();
    }
    
    public String getMenu(){
        
        String menu="<nav>";


        switch(this.codigo){
            case "A":
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=tipoproductos.jsp'>Tipos de Productos</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=hotel.jsp'>Hotel</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=tipoHabitaciones.jsp'>Tipo de Habitaciones</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=mediosDePago.jsp'>MediosDePago</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=usuarios.jsp'>Usuarios</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=inventario.jsp'>Inventario</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=ventas.jsp'>Ventas</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item dropdown-container'>";
                    menu+="<a href='#'>Reportes</a>";
                    menu+="<div class='dropdown'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/productosMasVendidos.jsp' id='productomas'>Productos Mas Vendidos</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/productosMenosVendidos.jsp' id='productomenos'>Productos Menos Vendidos</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/librosMasPrestados.jsp'>Libros Mas Prestados</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/librosMenosPrestados.jsp'>Libros Menos Prestados</a></li>";
                    menu+="</div>";
                    menu+="</div>";
                    menu+="<div class='menu-item dropdown-container'>";
                    menu+="<a href='#'>Indicadores</a>";
                    menu+="<div class='dropdown'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/ventasXAnio.jsp'>Indicadores de ventas por año</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/ventasXMes.jsp'>Indicadores de ventas por mes</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/ventasXDia.jsp'>Indicadores de ventas por dia</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/librosXAnio.jsp'>Libros mas prestados por año</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/librosXMes.jsp'>Libros mas prestados por mes</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/librosXDia.jsp'>Libros mas prestados por dia</a></li>";
                    menu+="</div>";
                    menu+="</div>";
                    break;
            case "R":
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=clientes.jsp'>Clientes</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=ventas.jsp'>Ventas</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=prestamos.jsp'>Prestamo</a></li>";
                    menu+="</div>";
                    menu+="<div class='menu-item'>";
                    menu+="<li><a href='index.jsp'>Salir</a></li>";
                    menu+="</div>";
                    menu+="</div>";
                    menu+="</nav>";
                    break;
        }
         menu+="<div class='menu-item'>";
         menu+="<li><a href='index.jsp'>Salir</a></li>";
         menu+="</div>";
         return menu;
        }
    
    
    public String getListaEnOptions(){
        String lista="";
        if(codigo==null) codigo="";
        switch(codigo){
            case "A":
                lista="<option value='A' selected>Administrador </option><option value='R'></option>";
                break;
            case "R":
                lista="<option value='A'>Administrador </option><option value='R' selected>Recepcionista</option>";
                break;
            default:
                lista="<option value='A' selected>Administrador </option><option value='R'>Recepcionista</option>";
                break;
        }
        return lista;
    }
        
    public String getListaEnOptionsClientes(){
        String lista="";
        if(codigo==null) codigo="";
        switch(codigo){
            case "H":
                lista="<option value='H'selected>Huesped</option>";
                break;
            default:
                lista="<option value='H'selected>Huesped</option>";
                break;
        }
        return lista;
    }
    }
