<%-- 
    Document   : buscarInventario
    Created on : 9/09/2024, 11:36:54 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="java.util.List"%>
<%@ page import="clases.Inventario" %>
<%
    String nombre = request.getParameter("nombre");
    String tipoProducto = request.getParameter("tipoProducto");
    List<Inventario> inventarios = Inventario.getListaEnObjetos("nombre LIKE '%" + nombre + "%' AND idTipoProducto=(SELECT id FROM TipoProducto WHERE nombre='" + tipoProducto + "')", null);

    for (Inventario inventario : inventarios) {
%>
    <div onClick="seleccionarItem('<%= inventario.getId() %>', '<%= inventario.getNombre() %>', '<%= inventario.getDescripcion() %>', '<%= inventario.getValorUnitario() %>')">
        <%= inventario.getNombre() %> - <%= inventario.getValorUnitario() %>
    </div>
<%
    }
%>
