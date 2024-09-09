<%-- 
    Document   : fotosActualizar
    Created on : 9/09/2024, 02:24:15 PM
    Author     : ANDRES FELIPE
--%>
<%@page import="java.util.HashMap"%>
<%@page import="clases.FotosTipoHabitacion"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<>();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (!isMultipart) {
        variables.put("accion", request.getParameter("accion"));
        variables.put("id", request.getParameter("id"));
        variables.put("idTipoHabitacion", request.getParameter("idTipoHabitacion"));
    } else {
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "/presentacion/imagenes/");
        DiskFileItemFactory factory = new DiskFileItemFactory(10 * 1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> elementosFormulario = upload.parseRequest(new ServletRequestContext(request));

        for (FileItem elemento : elementosFormulario) {
            if (elemento.isFormField()) {
                variables.put(elemento.getFieldName(), elemento.getString());
            } else if (!elemento.getName().isEmpty()) {
                subioArchivo = true;
                elemento.write(new File(destino, elemento.getName()));
                variables.put("foto", elemento.getName());
            }
        }
    }

    FotosTipoHabitacion fotoTipoHabitacion = new FotosTipoHabitacion();
    fotoTipoHabitacion.setId(variables.get("id"));
    fotoTipoHabitacion.setIdTipoHabitacion(variables.get("idTipoHabitacion"));

    if (subioArchivo) {
        fotoTipoHabitacion.setFoto(variables.get("foto"));
    } else if (!variables.get("id").isEmpty()) {
        FotosTipoHabitacion auxiliar = new FotosTipoHabitacion(variables.get("id"));
        fotoTipoHabitacion.setFoto(auxiliar.getFoto());
    }

    switch (variables.get("accion")) {
        case "Adicionar":
            if (subioArchivo) {
                fotoTipoHabitacion.grabar();
            } else {
                out.println("No se ha seleccionado ninguna foto para agregar.");
            }
            break;
        case "Modificar":
            fotoTipoHabitacion.modificar();
            break;
        case "Eliminar":
            fotoTipoHabitacion.eliminar();
            break;
        default:
            out.println("Acción no especificada.");
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=fotosTipoHabitacion.jsp&idTipoHabitacion=<%= variables.get("idTipoHabitacion") %>";
</script>
