<%-- 
    Document   : inventarioFormulario
    Created on : 9/09/2024, 11:15:27 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.Inventario"%>
<%@page import="clases.TipoProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion = request.getParameter("accion");
String id = request.getParameter("id");
Inventario inventario = new Inventario();
int total = 0;

if (accion.equals("Modificar")) {
    inventario = new Inventario(id);
    total = Integer.parseInt(inventario.getValorUnitario()) * Integer.parseInt(inventario.getCantidad());
}
%>

<h3><%=accion.toUpperCase() %> INVENTARIO</h3>

<form name="formulario" method="post" action="principal.jsp?CONTENIDO=inventarioActualizar.jsp">
    <table border="0">
        <tr><th>Id</th><td><%=inventario.getId()%></td></tr>
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombre" value="<%=inventario.getNombre()%>" required></td>
        </tr>
        <tr>
            <th>Descripción</th>
            <td><input type="text" name="descripcion" value="<%=inventario.getDescripcion()%>" required></td>
        </tr>
        <tr>
            <th>Valor Unitario</th>
            <td><input type="number" name="valorUnitario" value="<%=inventario.getValorUnitario()%>" required></td>
        </tr>
        <tr>
            <th>Tipo de Producto</th>
            <td><select name="idTipoProducto"><%=TipoProducto.getListaEnOptions(inventario.getIdTipoProducto())%></select></td>
        </tr>
        <tr>
            <th>Cantidad</th>
            <td><input type="number" name="cantidad" value="<%=inventario.getCantidad()%>" required></td>
        </tr>
        <tr>
            <th>Total</th>
            <td><input type="text" id="total" value="<%=total%>" readonly></td>
        </tr>
    </table>
    <p>
    <input type="hidden" name="id" value="<%=inventario.getId()%>">
    <input type="submit" name="accion" value="<%=accion%>">
</form>

<script type="text/javascript">
    document.querySelector("input[name='valorUnitario']").addEventListener('input', calcularTotal);
    document.querySelector("input[name='cantidad']").addEventListener('input', calcularTotal);

    function calcularTotal() {
        var valorUnitario = parseInt(document.querySelector("input[name='valorUnitario']").value) || 0;
        var cantidad = parseInt(document.querySelector("input[name='cantidad']").value) || 0;
        var total = valorUnitario * cantidad;
        document.getElementById('total').value = total;
    }
</script>

