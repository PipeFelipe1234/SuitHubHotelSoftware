<%-- 
    Document   : tipoProductosFormulario
    Created on : 9/09/2024, 11:21:41 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.TipoProducto"%>
<%
    String accion = request.getParameter("accion");
    String id = "Sin generar";
    String nombre = "";
    String descripcion = "";
    if (accion.equals("Modificar")) {
        id = request.getParameter("id");
        TipoProducto tipoProducto = new TipoProducto(id);
        nombre = tipoProducto.getNombre();
        descripcion = tipoProducto.getDescripcion();
    }
%>
<h3><%= accion.toUpperCase() %> TIPO DE PRODUCTO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=tipoProductosActualizar.jsp">
    <table border="0">
        <tr><th>Id</th><td><%= id %></td></tr>
        <tr><th>Nombre</th><td><input type="text" name="nombre" value="<%= nombre %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Descripción</th><td><textarea name="descripcion" cols="50" rows="5"><%= descripcion %></textarea></td></tr>
    </table>
    <input type="hidden" name="id" value="<%= id %>">
    <input type="submit" name="accion" value="<%= accion %>">
</form>
