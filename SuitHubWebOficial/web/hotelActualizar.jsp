<%-- 
    Document   : hotelActualizar
    Created on : 9/09/2024, 11:48:36 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="clasesGenericas.ConectorBD"%>
<%@page import="clases.Hotel"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<>(); // Aquí se almacenan los datos enviados por el formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        // Configuraciones para subir el archivo
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "/presentacion/imagenes/");
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);

        ServletRequestContext origen = new ServletRequestContext(request);

        // Para recorrer los elementos enviados por el formulario
        List<FileItem> elementosFormulario = upload.parseRequest(origen);
        Iterator<FileItem> iterador = elementosFormulario.iterator();
        while (iterador.hasNext()) {
            FileItem elemento = iterador.next();
            if (elemento.isFormField()) {
                // Si el elemento es un campo del formulario (input, textarea, etc.)
                variables.put(elemento.getFieldName(), elemento.getString("UTF-8"));  // Aseguramos codificación UTF-8
            } else {
                // Si el elemento es un archivo (foto)
                if (!elemento.getName().isEmpty()) {
                    subioArchivo = true;
                    File archivo = new File(destino, elemento.getName());
                    elemento.write(archivo);
                    variables.put("foto", elemento.getName());  // Guardamos el nombre del archivo
                }
            }
        }
    } else {
        // No es multipart (caso de eliminación o sin archivo adjunto)
        variables.put("accion", request.getParameter("accion"));
        variables.put("nombre", request.getParameter("nombre"));
    }

    Hotel hotel = new Hotel();
    hotel.setNombre(variables.get("nombre"));
    hotel.setDireccion(variables.get("direccion"));
    hotel.setCiudad(variables.get("ciudad"));
    hotel.setDepartamento(variables.get("departamento"));
    hotel.setEmail(variables.get("email"));
    hotel.setTelefono(variables.get("telefono"));
    hotel.setReglasDeReserva(variables.get("reglasDeReserva"));
    hotel.setPoliticasDepositoYComidas(variables.get("politicasDepositoYComidas"));

    switch (variables.get("accion")) {
        case "Adicionar":
            if (subioArchivo) {
                hotel.setFoto(variables.get("foto"));
            } else {
                hotel.setFoto(""); // O dejar vacío si no hay foto
            }
            hotel.grabar();
            break;
        case "Modificar":
            String nombreOriginal = variables.get("nombreOriginal");

            if (!subioArchivo) {
                Hotel auxiliar = new Hotel(nombreOriginal);
                hotel.setFoto(auxiliar.getFoto());
            } else {
                hotel.setFoto(variables.get("foto"));
            }

            if (!nombreOriginal.equals(hotel.getNombre())) {
                // Actualizar todos los campos, incluyendo el nombre
                String cadenaSQL = "UPDATE Hotel SET nombre='" + hotel.getNombre() + "', direccion='" + hotel.getDireccion() + 
                    "', ciudad='" + hotel.getCiudad() + "', departamento='" + hotel.getDepartamento() + 
                    "', email='" + hotel.getEmail() + "', telefono='" + hotel.getTelefono() + 
                    "', reglasDeReserva='" + hotel.getReglasDeReserva() + 
                    "', politicasDepositoYComidas='" + hotel.getPoliticasDepositoYComidas() + 
                    "', foto='" + hotel.getFoto() + "' WHERE nombre='" + nombreOriginal + "'";
                ConectorBD.ejecutarQuery(cadenaSQL);
            } else {
                // Modificar el hotel sin cambiar el nombre
                hotel.modificar();
            }
            break;
        case "Eliminar":
            hotel.setNombre(variables.get("nombre"));
            hotel.eliminar();
            break;
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=hotel.jsp";
</script>
