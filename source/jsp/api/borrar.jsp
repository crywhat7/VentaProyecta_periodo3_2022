<%@page import="dependencies.Database" %>
<%@page import="dependencies.Usuario" %>
<%
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    db.conectar();
    Object attUsuario = session.getAttribute("idUsuario");
    if (attUsuario == null) {
        response.sendRedirect("");
    }
    else {
        Usuario usuario = db.devuelveUsuario(attUsuario.getID());
        if (usuario == null) {
            response.sendRedirect("");
        }
    }

    String user_id = request.getParameter("id");
    Usuario usuarioAEliminar = db.devuelveUsuario(user_id);
    if (usuarioAEliminar == null) {
        response.sendRedirect("");
    }
    else {
        db.borrarUsuario(usuarioAEliminar);
    }
    response.sendRedirect("");
%>