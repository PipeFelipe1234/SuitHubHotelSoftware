<%-- 
    Document   : inventarioTipoHabitacionActualizar
    Created on : 9/09/2024, 11:35:14 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.InventarioTipoHabitacion, clases.Inventario"%>
<%
    String accion = request.getParameter("accion");
    String id = request.getParameter("id");
    String idTipoHabitacion = request.getParameter("idTipoHabitacion");
    String cantidad = request.getParameter("cantidad");
    String idInventario = request.getParameter("idInventario");

    InventarioTipoHabitacion inventarioTipoHabitacion = new InventarioTipoHabitacion();

    switch (accion) {
        case "Adicionar":
            // Configurar los datos para la adición
            inventarioTipoHabitacion.setIdTipoHabitacion(idTipoHabitacion);
            inventarioTipoHabitacion.setIdInventario(idInventario);
            inventarioTipoHabitacion.setCantidad(cantidad);
            inventarioTipoHabitacion.grabar(); // Método para guardar el nuevo registro
            break;
        case "Modificar":
            // Configurar los datos para la modificación
            inventarioTipoHabitacion.setId(id);
            inventarioTipoHabitacion.setIdTipoHabitacion(idTipoHabitacion);
            inventarioTipoHabitacion.setIdInventario(idInventario);
            inventarioTipoHabitacion.setCantidad(cantidad);
            inventarioTipoHabitacion.modificar(); // Método para modificar el registro existente
            break;
        case "Eliminar":
            // Configurar los datos para la eliminación
            inventarioTipoHabitacion.setId(id);
            inventarioTipoHabitacion.eliminar(); // Método para eliminar el registro
            break;
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=inventarioTipoHabitacion.jsp&idTipoHabitacion=<%= idTipoHabitacion %>";
</script>

