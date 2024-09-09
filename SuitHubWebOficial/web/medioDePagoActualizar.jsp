<%-- 
    Document   : medioDePagoActualizar
    Created on : 9/09/2024, 11:12:20 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.MedioDePago"%>
<%
    String accion=request.getParameter("accion");
    String nombre=request.getParameter("nombre");
    String descripcion=request.getParameter("descripcion");
    MedioDePago pago = new MedioDePago();
    pago.setNombre(nombre);
    pago.setDescripcion(descripcion);
    switch(accion){
        case "Adicionar":
            pago.grabar();
            break;
        case "Modificar":
            pago.setId(request.getParameter("id"));
            pago.modificar();
            break;
        case "Eliminar":
            pago.setId(request.getParameter("id"));
            pago.eliminar();
            break;
    }
 //response.sendRedirect("principal.jsp?CONTENIDO=mediosDePago.jsp");
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=mediosDePago.jsp";
</script>
