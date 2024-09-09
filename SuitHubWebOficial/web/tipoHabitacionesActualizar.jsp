<%-- 
    Document   : tipoHabitacionesActualizar
    Created on : 9/09/2024, 11:25:05 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.TipoHabitacion"%>
<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String tarifa = request.getParameter("tarifa");
    String descripcion = request.getParameter("descripcion");
    String capacidad = request.getParameter("capacidad");

    TipoHabitacion tipoHabitacion = new TipoHabitacion();
    tipoHabitacion.setNombre(nombre);
    tipoHabitacion.setTarifa(tarifa);
    tipoHabitacion.setDescripcion(descripcion);
    tipoHabitacion.setCapacidad(capacidad);

    switch (accion) {
        case "Adicionar":
            tipoHabitacion.grabar();
            break;
        case "Modificar":
            tipoHabitacion.setId(request.getParameter("id"));
            tipoHabitacion.modificar();
            break;
        case "Eliminar":
            tipoHabitacion.setId(request.getParameter("id"));
            tipoHabitacion.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=tipoHabitaciones.jsp";
</script>
