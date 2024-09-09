<%-- 
    Document   : inventario
    Created on : 9/09/2024, 11:13:04 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Inventario"%>
<%@page import="clases.TipoProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String filtro = "";

String chkId = request.getParameter("chkId");
String idInicio = "";
String idFin = "";
if (chkId != null) {
    chkId = "checked";
    idInicio = request.getParameter("idInicio");
    idFin = request.getParameter("idFin");
    filtro = "id BETWEEN " + idInicio + " AND " + idFin;
} else {
    chkId = "";
}

String chkIdTipoProducto = request.getParameter("chkIdTipoProducto");
String idTipoProducto = "";
if (chkIdTipoProducto != null) {
    chkIdTipoProducto = "checked";
    idTipoProducto = request.getParameter("idTipoProducto");
    if (!filtro.isEmpty()) filtro += " AND ";
    filtro += "idTipoProducto=" + idTipoProducto;
} else {
    chkIdTipoProducto = "";
}

List<Inventario> inventarios = Inventario.getListaEnObjetos(filtro, null);
int totalCantidad = 0;
int totalSuma = 0;
String lista = "";

for (Inventario inventario : inventarios) {
    int total = Integer.parseInt(inventario.getValorUnitario()) * Integer.parseInt(inventario.getCantidad());
    totalCantidad += Integer.parseInt(inventario.getCantidad());
    totalSuma += total;
    
    lista += "<tr>";
    lista += "<td align='right'>" + inventario.getId() + "</td>";
    lista += "<td>" + inventario.getNombre() + "</td>";
    lista += "<td>" + inventario.getDescripcion() + "</td>";
    lista += "<td>" + inventario.getValorUnitario() + "</td>";
    lista += "<td>" + inventario.getTipoProducto() + "</td>";
    lista += "<td>" + inventario.getCantidad() + "</td>";
    lista += "<td align='right'>" + total + "</td>";
    lista += "<td>";
    lista += "<a href='principal.jsp?CONTENIDO=inventarioFormulario.jsp&accion=Modificar&id=" + inventario.getId() + "' title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' height='30'></a> ";
    lista += "<img src='presentacion/imagenes/eliminar.png' width='30' height='30' title='Eliminar' onClick='eliminar(" + inventario.getId() + ")'> ";
    lista += "</td>";
    lista += "</tr>";
}
%>

<h3>INVENTARIO HOTEL MONACO</h3>

<form name="formulario" method="post">
    <table>
        <tr>
            <td><input type="checkbox" name="chkId" <%=chkId%>>Id</td>
            <td>
                desde <input type="number" name="idInicio" value="<%=idInicio%>">
                hasta <input type="number" name="idFin" value="<%=idFin%>">
            </td>
            <td><input type="checkbox" name="chkIdTipoProducto" <%=chkIdTipoProducto%>> Tipo de Producto</td>
            <td><select name="idTipoProducto"><%=TipoProducto.getListaEnOptions(idTipoProducto)%></select></td>
        </tr>
    </table><p> 
    <input type="submit" name="buscar" value="Buscar">
</form>

<table border="1">
    <tr>
        <th>Id</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Valor Unitario</th>
        <th>Tipo de Producto</th>
        <th>Cantidad</th>
        <th>Total</th>
        <th><a href="principal.jsp?CONTENIDO=inventarioFormulario.jsp&accion=Adicionar" title="Adicionar"><img src="presentacion/imagenes/add.png" width='30' height='30'></a></th>
    </tr>
    <%=lista%>
    <tr>
        <th>TOTAL</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th align="right"><%=totalSuma%></th>
        <th></th>
    </tr>
</table>

<script type="text/javascript">
    function eliminar(id) {
        respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=inventarioActualizar.jsp&accion=Eliminar&id=" + id;
        }
    }
</script>
