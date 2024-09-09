<%-- 
    Document   : inventarioActualizar
    Created on : 9/09/2024, 11:16:42 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.Inventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion = request.getParameter("accion");
String id = request.getParameter("id");
Inventario inventario = new Inventario();
inventario.setId(id);

if (accion.equals("Adicionar")) {
    inventario.setNombre(request.getParameter("nombre"));
    inventario.setDescripcion(request.getParameter("descripcion"));
    inventario.setValorUnitario(request.getParameter("valorUnitario"));
    inventario.setIdTipoProducto(request.getParameter("idTipoProducto"));
    inventario.setCantidad(request.getParameter("cantidad"));
    boolean resultado = inventario.grabar();
    if (resultado) {
        out.println("<script>alert('Inventario adicionado exitosamente.'); window.location='principal.jsp?CONTENIDO=inventario.jsp';</script>");
    } else {
        out.println("<script>alert('Error al adicionar inventario.'); window.history.back();</script>");
    }
} else if (accion.equals("Modificar")) {
    inventario.setNombre(request.getParameter("nombre"));
    inventario.setDescripcion(request.getParameter("descripcion"));
    inventario.setValorUnitario(request.getParameter("valorUnitario"));
    inventario.setIdTipoProducto(request.getParameter("idTipoProducto"));
    inventario.setCantidad(request.getParameter("cantidad"));
    boolean resultado = inventario.modificar();
    if (resultado) {
        out.println("<script>alert('Inventario modificado exitosamente.'); window.location='principal.jsp?CONTENIDO=inventario.jsp';</script>");
    } else {
        out.println("<script>alert('Error al modificar inventario.'); window.history.back();</script>");
    }
} else if (accion.equals("Eliminar")) {
    boolean resultado = inventario.eliminar();
    if (resultado) {
        out.println("<script>alert('Inventario eliminado exitosamente.'); window.location='principal.jsp?CONTENIDO=inventario.jsp';</script>");
    } else {
        out.println("<script>alert('Error al eliminar inventario.'); window.history.back();</script>");
    }
}
%>
