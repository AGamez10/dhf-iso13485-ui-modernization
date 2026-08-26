<%@page contentType="text/html" pageEncoding="UTF-8" %><%
    // Vista MINIMA para embeber el Gestor de Archivos (widget office-platform) en un iframe,
    // SIN el shell de la app (navbar/sidebar/Contenedor_head). Replica solo el montaje del widget
    // que hace OfficePlatform.jsp: script del widget con data-container="office-platform" + el div.
    // Token/identidad se resuelven de la sesion (mismo mecanismo que Contenedor_head.jsp).
    Object documentObj = session.getAttribute("Documento");
    Object usuarioObj = session.getAttribute("Usuario");
    Object idUsuarioObj = session.getAttribute("Id_usuario");
    String cedulaStr = "12345678";
    if (documentObj != null && !documentObj.toString().trim().isEmpty()) { cedulaStr = documentObj.toString().trim(); }
    else if (idUsuarioObj != null && !idUsuarioObj.toString().trim().isEmpty()) { cedulaStr = idUsuarioObj.toString().trim(); }
    String nombreStr = (usuarioObj != null && !usuarioObj.toString().trim().isEmpty()) ? usuarioObj.toString().trim() : "FABIAN GAONA";
    String token = "";
    try { token = Methods.OfficePlatformResolver.resolveToken(cedulaStr, nombreStr); } catch (Exception e) { token = ""; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestor de Archivos</title>
    <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/fontawesome/css/all.min.css">
    <style>
        html, body { margin: 0; padding: 0; background: #ffffff; height: 100%; }
        #office-platform { padding: 14px; min-height: 100vh; box-sizing: border-box; }
    </style>
</head>
<body>
    <div id="office-platform"></div>
    <script src="Interfaz/Contenido/assets/modules/jquery.min.js"></script>
    <script
        src="http://localhost:8080/office-platform-widget.js?v=<%= System.currentTimeMillis() %>"
        data-api-key="opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0"
        data-container="office-platform" data-server="http://localhost:8080"
        data-token="<%= token %>" data-user-id="<%= cedulaStr %>" data-user-name="<%= nombreStr %>">
    </script>
</body>
</html>
