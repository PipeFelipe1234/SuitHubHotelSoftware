<%-- 
    Document   : principal
    Created on : 9/09/2024, 11:54:00 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 HttpSession sesion=request.getSession();
 Persona USUARIO=null;
 if(sesion.getAttribute("usuario")==null) response.sendRedirect("index.jsp?error=2");
 else USUARIO=(Persona) sesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Software de SuitHub</title>
        <link rel="stylesheet" href="presentacion/estiloPagina.css">
        <link rel="stylesheet" href="recursos/jquery-ui-1.13.3.custom/jquery-ui.css">
        <!-- <link rel="stylesheet" href="/resources/demos/style.css">-->
        <script src="recursos/jquery-3.7.1.min.js"></script>
        <script src="recursos/jquery-ui-1.13.3.custom/jquery-ui.min.js"></script>
        <script src="recursos/amcharts5/index.js"></script>
        <script src="recursos/amcharts5/xy.js"></script>
        <script src="recursos/amcharts5/themes/Animated.js"></script>
    </head>
    <body>
<div id="banner"></div>
<div id="menu"><%=USUARIO.getTipoEnObjeto().getMenu()%></div>
<div class="container" id="contenido">
    <div class="left-content">
        <jsp:include page= '<%=request.getParameter("CONTENIDO")%>' flush="true"/>
    </div>
</div>
    </body>
</html>
