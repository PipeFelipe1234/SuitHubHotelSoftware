<%-- 
    Document   : tipoProductosActualizar
    Created on : 9/09/2024, 11:22:39 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.TipoProducto"%>
<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    TipoProducto tipoProducto = new TipoProducto();
    tipoProducto.setNombre(nombre);
    tipoProducto.setDescripcion(descripcion);
    switch(accion){
        case "Adicionar":
            tipoProducto.grabar();
            break;
        case "Modificar":
            tipoProducto.setId(request.getParameter("id"));
            tipoProducto.modificar();
            break;
        case "Eliminar":
            tipoProducto.setId(request.getParameter("id"));
            tipoProducto.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=tipoproductos.jsp";
</script>
