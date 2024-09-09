<%-- 
    Document   : fotosTipoHabitacion
    Created on : 9/09/2024, 02:22:17 PM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.TipoHabitacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.FotosTipoHabitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTipoHabitacion = request.getParameter("idTipoHabitacion");
    TipoHabitacion tipoHabitacion = TipoHabitacion.getById(idTipoHabitacion); // Obtener datos de tipo de habitación
    String nombreTipoHabitacion = tipoHabitacion != null ? tipoHabitacion.getNombre() : "Tipo Desconocido";
    ArrayList<FotosTipoHabitacion> fotos = FotosTipoHabitacion.getLista(idTipoHabitacion); // Obtener lista de fotos
%>

<h3>Fotos de Habitacion <%= nombreTipoHabitacion %></h3>
<a href="principal.jsp?CONTENIDO=fotosFormulario.jsp&idTipoHabitacion=<%= idTipoHabitacion %>&accion=Adicionar">Adicionar Foto</a>

<div class="fotos-grid">
    <%
        int contador = 0;
        for (FotosTipoHabitacion foto : fotos) {
            if (contador % 3 == 0) {
                out.println("<div class='row'>");  // Crear fila cada 3 fotos
            }
    %>
            <div class="foto-item">
                <img src="presentacion/imagenes/<%= foto.getFoto() %>" width="250" height="350" alt="Foto">
                <div>
                    <a href="principal.jsp?CONTENIDO=fotosFormulario.jsp&id=<%= foto.getId() %>&accion=Modificar&idTipoHabitacion=<%= idTipoHabitacion %>">
                        <img src="presentacion/iconos/modificar.png" alt="Modificar" title="Modificar">
                    </a>
                    <a href="principal.jsp?CONTENIDO=fotosActualizar.jsp&accion=Eliminar&id=<%= foto.getId() %>&idTipoHabitacion=<%= idTipoHabitacion %>">
                        <img src="presentacion/iconos/eliminar.png" alt="Eliminar" title="Eliminar">
                    </a>
                </div>
            </div>
    <%
            if ((contador + 1) % 3 == 0) {
                out.println("</div>");  // Cerrar fila cada 3 fotos
            }
            contador++;
        }
        if (contador % 3 != 0) {
            out.println("</div>");  // Cerrar la última fila si no es múltiplo de 3
        }
    %>
</div>
