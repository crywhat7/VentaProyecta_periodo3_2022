<%@page import="src.dependencies.Database" %>
<%@page import="src.dependencies.Tarea" %>
<%@page import="java.io.EOFException" %>
<%@ page import="src.dependencies.Usuario" %>
<%
    Usuario usuario = null;
    Database db = new Database(application.getRealPath("source/mini_office.mdb"));
    db.conectar();
    Object attUsuario = session.getAttribute("user");
    if (attUsuario == null) {
        response.sendRedirect("");
        return;
    }
    else {
        usuario = db.devuelveUsuario(Integer.parseInt(attUsuario.toString()));
        if (usuario == null) {
            response.sendRedirect("");
            return;
        }
    }

    Tarea tarea = new Tarea(0, 
    request.getParameter("NombreTarea").toString(),
    request.getParameter("Nota").toString(),
//    request.getParameter("CreadoEn").toString(),
            "nill", "nill", 1,
//    request.getParameter("Vencimiento").toString(),
//    request.getParameter("listaAsignada").toString(),
    false, usuario.getId());
            
    db.crearTarea(tarea);
    response.sendRedirect("../index.jsp");
%>