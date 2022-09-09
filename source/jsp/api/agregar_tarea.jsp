<%@page import="dependencies.Database" %>
<%@page import="dependencies.Tarea" %>
<%@page import="java.io.EOFException" %>
<%
    Usuario usuario = null;
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    db.conectar();
    Object attUsuario = session.getAttribute("user");
    if (attUsuario == null) {
        response.sendRedirect("");
    }
    else {
        usuario = db.devuelveUsuario(Integer.parseInt(attUsuario.toString()));
        if (usuario == null) {
            response.sendRedirect("");
        }
    }

    Tarea tarea = new Tarea(0, 
    request.getParameter("NombreTarea").toString(),
    request.getParameter("Nota").toString(),
    request.getParameter("CreadoEn").toString(),
    request.getParameter("Vencimiento").toString(),
    request.getParameter("listaAsignada").toString(),
    false, usuario.getID());
            
    db.crearTarea(tarea);
    response.sendRedirect("");
%>