<%-- 
    Document   : tipoHabitaciones
    Created on : 9/09/2024, 11:23:34 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="java.util.List"%>
<%@page import="clases.TipoHabitacion"%>
<%
    String lista = "";
    List<TipoHabitacion> datos = TipoHabitacion.getListaEnObjetos(null, null);
    for (TipoHabitacion tipoHabitacion : datos) {
        lista += "<tr>";
        lista += "<td align='right'>" + tipoHabitacion.getId() + "</td>";
        lista += "<td>" + tipoHabitacion.getNombre() + "</td>";
        lista += "<td>" + tipoHabitacion.getTarifa() + "</td>";
        lista += "<td>" + tipoHabitacion.getDescripcion() + "</td>";
        lista += "<td>" + tipoHabitacion.getCapacidad() + "</td>";
        lista += "<td>";
        lista += "<a href='principal.jsp?CONTENIDO=fotosTipoHabitacion.jsp&idTipoHabitacion=" + tipoHabitacion.getId() +
            "' title='Fotos'><img src='presentacion/imagenes/fotos.png' width='30' height='30'></a> "; 
        lista += "<a href='principal.jsp?CONTENIDO=inventarioTipoHabitacion.jsp&idTipoHabitacion=" + tipoHabitacion.getId() +
            "' title='Inventario'><img src='presentacion/imagenes/inventario.png' width='30' height='30'></a>";
        lista += "<a href='principal.jsp?CONTENIDO=tipoHabitacionesFormulario.jsp&accion=Modificar&id=" + tipoHabitacion.getId() +
            "' title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' height='30'></a> ";
        lista += "<img src='presentacion/imagenes/eliminar.png' width='30' height='30' title='Eliminar' onClick='eliminar(" + tipoHabitacion.getId() + ")'> ";
        lista += "</td>";
        lista += "</tr>";
    }
%>

<h3>LISTA DE TIPOS DE HABITACIÓN</h3>
<table border="1">
    <tr>
        <th>Id</th><th>Nombre</th><th>Tarifa</th><th>Descripción</th><th>Capacidad</th>
        <th><a href="principal.jsp?CONTENIDO=tipoHabitacionesFormulario.jsp&accion=Adicionar">
                <img src="presentacion/imagenes/add.png" width='30' height='30'></a></th>
    </tr>
    <%= lista %>
</table>

<script type="text/javascript">
    function eliminar(id) {
        var respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=tipoHabitacionesActualizar.jsp&accion=Eliminar&id=" + id;
        }
    }
</script>
