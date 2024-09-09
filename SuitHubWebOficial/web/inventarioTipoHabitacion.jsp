<%-- 
    Document   : inventarioTipoHabitaciones
    Created on : 9/09/2024, 11:31:29 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="java.util.List"%>
<%@ page import="clases.InventarioTipoHabitacion, clases.Inventario, clases.TipoHabitacion" %>
<%
    String idTipoHabitacion = request.getParameter("idTipoHabitacion");
    TipoHabitacion tipoHabitacion = new TipoHabitacion(idTipoHabitacion);
%>

<h3>Inventario del Tipo de Habitación: <%= tipoHabitacion.getNombre() %></h3>

<table border="1">
    <tr>
        <th>Id</th>
        <th>Items</th>
        <th>Cantidad</th>
        <th>Valor Unitario</th>
        <th>Descripción</th>
        <th><a href="principal.jsp?CONTENIDO=inventarioTipoHabitacionFormulario.jsp&accion=Adicionar&idTipoHabitacion=<%= idTipoHabitacion %>">
                <img src="presentacion/imagenes/add.png" width='30' height='30' title="Adicionar"></a></th>
    </tr>
    <%
        List<InventarioTipoHabitacion> inventario = InventarioTipoHabitacion.getListaEnObjetos("idTipoHabitacion='" + idTipoHabitacion + "'", null);
        for (InventarioTipoHabitacion item : inventario) {
            Inventario producto = new Inventario(item.getIdInventario());
            out.println("<tr>");
            out.println("<td>" + item.getId() + "</td>");
            out.println("<td>" + producto.getNombre() + "</td>");
            out.println("<td>" + item.getCantidad() + "</td>");
            out.println("<td>" + producto.getValorUnitario() + "</td>");
            out.println("<td>" + producto.getDescripcion() + "</td>");
            out.println("<td><a href='principal.jsp?CONTENIDO=inventarioTipoHabitacionFormulario.jsp&accion=Modificar&id=" + item.getId() + "&idTipoHabitacion=" + idTipoHabitacion + "'><img src='presentacion/imagenes/edit.png' width='30' height='30' title='Modificar'></a></td>");
            out.println("<td><a href='javascript:eliminar(\"" + item.getId() + "\")'><img src='presentacion/imagenes/delete.png' width='30' height='30' title='Eliminar'></a></td>");
            out.println("</tr>");
        }
    %>
</table>
<script type="text/javascript">
    function eliminar(id){
        respuesta = confirm("Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=inventarioTipoHabitacionActualizar.jsp&accion=Eliminar&id=" + id + "&idTipoHabitacion=<%= idTipoHabitacion %>";
        }
    }
</script>
