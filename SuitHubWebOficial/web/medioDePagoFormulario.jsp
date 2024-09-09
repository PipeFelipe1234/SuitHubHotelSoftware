<%-- 
    Document   : mediosDePagoFormulario
    Created on : 9/09/2024, 11:11:13 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.MedioDePago"%>
<%
    String accion=request.getParameter("accion");
    String id="Sin generar";
    String nombre="";
    String descripcion="";
    if (accion.equals("Modificar")) {
           id=request.getParameter("id");
           MedioDePago pago = new MedioDePago(id);
           nombre=pago.getNombre();
           descripcion=pago.getDescripcion();
       }
%>
<h3><%=accion.toUpperCase() %> MEDIO DE PAGO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=medioDePagoActualizar.jsp">
    <table border="0">
        <tr><th>Id</th><td><%=id%></td></tr>
        <tr><th>Nombre</th><td><input type="text" name="nombre" value="<%=nombre%>" size="50" maxlength="50" required></td></tr>
        <tr><th>Descripcion</th><td><textarea name="descripcion" cols="50" rows="5"><%=descripcion%></textarea></td></tr>
</table>
<input type="hidden" name="id" value="<%=id%>">
<input type="submit" name="accion" value="<%=accion%>">
</form>
