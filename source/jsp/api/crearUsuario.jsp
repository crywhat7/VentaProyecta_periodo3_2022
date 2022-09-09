<%@page import="dependencies.Database" %>
<%@page import="dependencies.Usuario" %>
<%@ page import="java.io.EOFException" %>
<%
    Usuario usuario = null;    
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    db.conectar();    

    Usuario usuario = new Usuario(0, 
    request.getParameter("usuario").toString(),
    request.getParameter("clave").toString(),
    request.getParameter("correo").toString());
            
    db.crearUsuario(usuario);
    response.sendRedirect("");
%>