<%-- 
    Document   : usuarios
    Created on : 9/09/2024, 10:39:32 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String nada=" ";
String lista="";
List<Persona> datos=Persona.getListaEnObjetos("tipo<>'C' && tipo<>'I'", null);
for (int i = 0; i < datos.size(); i++) {
        Persona usuario = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + usuario.getIdentificacion() + "</td>";
        lista+="<td>" + usuario.getNombre()+ "</td>";
        lista+="<td>" + usuario.getApellido() + "</td>";
        lista+="<td>" + usuario.getGeneroEnObjeto() + "</td>";
        lista+="<td>" + usuario.getTelefono() + "</td>";
        lista+="<td>" + usuario.getEmail()+ "</td>";
        lista+="<td>" + usuario.getTipoEnObjeto()+ "</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Modificar&identificacion=" + usuario.getIdentificacion() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' heigth='30'></a>  "; 
        lista+="<img src='presentacion/imagenes/eliminar.png' width='30' heigth='30' title='Eliminar' onClick='eliminar("+ usuario.getIdentificacion()+")'> ";
        lista+="</td>";
        lista+="</tr>";
  }
%>

<h3>LISTA DE ADMINISTRADORES</h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Apellidos</th><th>Genero</th><th>Telefono</th><th>Email</th><th>Tipo</th>
                <th><a href="principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="presentacion/imagenes/agregar.png" width='30' heigth='30'>  </a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el usuario con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=usuariosActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
</script>