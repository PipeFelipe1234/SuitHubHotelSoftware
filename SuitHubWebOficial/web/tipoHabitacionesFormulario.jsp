<%-- 
    Document   : tipoHabitacionesFormulario
    Created on : 9/09/2024, 11:24:29 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.TipoHabitacion"%>
<%
    String accion = request.getParameter("accion");
    String id = "Sin generar";
    String nombre = "";
    String tarifa = "";
    String descripcion = "";
    String capacidad = "";
    if (accion.equals("Modificar")) {
        id = request.getParameter("id");
        TipoHabitacion tipoHabitacion = new TipoHabitacion(id);
        nombre = tipoHabitacion.getNombre();
        tarifa = tipoHabitacion.getTarifa();
        descripcion = tipoHabitacion.getDescripcion();
        capacidad = tipoHabitacion.getCapacidad();
    }
%>
<h3><%= accion.toUpperCase() %> TIPO DE HABITACIÓN</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=tipoHabitacionesActualizar.jsp">
    <table border="0">
        <tr><th>Id</th><td><%= id %></td></tr>
        <tr><th>Nombre</th><td><input type="text" name="nombre" value="<%= nombre %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Tarifa</th><td><input type="text" name="tarifa" value="<%= tarifa %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Descripción</th><td><textarea name="descripcion" cols="50" rows="5"><%= descripcion %></textarea></td></tr>
        <tr><th>Capacidad</th><td><input type="number" name="capacidad" value="<%= capacidad %>" size="50" maxlength="50" required></td></tr>
    </table>
    <input type="hidden" name="id" value="<%= id %>">
    <input type="submit" name="accion" value="<%= accion %>">
</form>

