<%-- 
    Document   : usuariosActualizar
    Created on : 9/09/2024, 11:18:39 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.Persona"%>
<%
String accion=request.getParameter("accion");
String identificacionAnterior=request.getParameter("identificacionAnterior");

Persona usuario = new Persona();

usuario.setIdentificacion(request.getParameter("identificacion"));
usuario.setNombre(request.getParameter("nombres"));
usuario.setApellido(request.getParameter("apellidos"));
usuario.setGenero(request.getParameter("genero"));
usuario.setTelefono(request.getParameter("telefono"));
usuario.setEmail(request.getParameter("email"));
usuario.setTipo(request.getParameter("tipo"));
usuario.setClave(request.getParameter("clave"));

switch(accion){
    case "Adicionar":
        usuario.grabar();
        break;
    case "Modificar":
        usuario.modificar(identificacionAnterior);
        break;
    case "Eliminar":
        usuario.eliminar();
        break;
}
%>

<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=usuarios.jsp"
</script>
