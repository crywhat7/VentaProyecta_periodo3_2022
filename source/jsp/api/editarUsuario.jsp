<%@page import="dependencies.Database" %>
<%@page import="dependencies.Usuario" %>
<%@ page import="com.healthmarketscience.jackcess.Cursor" %>
<%
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    Usuario usuario = null;
    db.conectar();
    Object idUsuario = session.getAttribute("idUsuario");
    if (idUsuario == null) {
        response.sendRedirect("");
        <!-- Redirecciona a atras -->
    }
    else {
        usuario = db.retornarUsuario(idUsuario);
        if (usuario == null) {
            <!-- Redireccionar a algo -->
        }
        else {
            <!-- Redireccionar a algo -->
        }
    }

    String usuario, clave, correo;    
    usuario =  request.getParameter("usuario");
    clave = request.getParameter("clave");    
    correo = request.getParameter("correo");    
    int ID = Integer.parseInt(request.getParameter("ID"));

    Usuario modify_user = new Usuario(ID, usuario, clave, correo);
    db.editarUsuario(modify_user);    
%>