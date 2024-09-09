<%-- 
    Document   : mediosDePago
    Created on : 9/09/2024, 10:47:43 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="java.util.List"%>
<%@page import="clases.MedioDePago"%>
<%
 String  lista=" ";
 List<MedioDePago> datos= MedioDePago.getListaEnObjetos(null, null);
 for (int i = 0; i < datos.size(); i++) {
         MedioDePago pago = datos.get(i);
         lista+="<tr>";
         lista+="<td align='rigtht'>" + pago.getId() + "</td>";
         lista+="<td>" + pago.getNombre() + "</td>";
         lista+="<td>" + pago.getDescripcion() + "</td>";
         lista+="<td>";
         lista+="<a href='principal.jsp?CONTENIDO=medioDePagoFormulario.jsp&accion=Modificar&id=" + pago.getId() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' heigth='30'></a>  "; 
         lista+="<img src='presentacion/imagenes/eliminar.png' width='30' heigth='30' title='Eliminar' onClick='eliminar("+ pago.getId()+")'> ";
         lista+="</td>";
         lista+="</tr>";
     }
%>

<h3>LISTA MEDIOS DE PAGO</h3>
<table border="1">
    <tr>
        <th>Id</th><th>Nombre</th><th>Descripcion</th>
        <th><a href="principal.jsp?CONTENIDO=medioDePagoFormulario.jsp&accion=Adicionar">
                <img src="presentacion/imagenes/add.png" width='30' heigth='30'></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(id){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=medioDePagoActualizar.jsp&accion=Eliminar&id="+id;
        }
    }
</script> 
