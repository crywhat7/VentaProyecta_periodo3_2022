<%@ page import="java.util.Map" %>
<%@page import="dependencies.Database" %>
<%@page import="dependencies.Usuario" %>
<%@ page import="java.util.Objects" %>
<%
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    String usuario, clave;
    usuario = request.getParameter("usuario");
    clave = request.getParameter("clave");

    db.conectar();
    Usuario usuarioObj = db.devuelveUsuario(usuario);    
    
    if (usuarioObj == null) {
        <!-- Imprime no existe el usuario o algo -->
    }
    else {
       if (Objects.equals(clave, usuarioObj.getClave())) {
           session.setAttribute("user", usuarioObj.getID());
           <!-- Imprime que se ingresó con exito -->
       }
       else {
           <!-- Imprime que la clave o contrasenia estan incorrectas -->
       }
    }

    db.desconectar();
%>