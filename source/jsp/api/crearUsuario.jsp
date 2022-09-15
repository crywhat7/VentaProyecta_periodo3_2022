<%@page import="src.dependencies.Database" %>
<%@page import="src.dependencies.Usuario" %>
<%@ page import="java.io.EOFException" %>
<%
    Usuario usuario = null;    
    Database db = new Database(application.getRealPath("source/mini_office.mdb"));
    db.conectar();    

    usuario = new Usuario(0,
    request.getParameter("usuario").toString(),
    request.getParameter("clave").toString(),
    request.getParameter("correo").toString());
            
    db.crearUsuario(usuario);
    %>
    <script>
        alert("Proceso completado!")
    </script>
<%
    response.sendRedirect("login.jsp");
%>