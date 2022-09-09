<%@page import="dependencies.Database" %>
<%@page import="dependencies.Tarea" %>
<%
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    db.conectar();
    Object idTarea = session.getAttribute("idTarea");
    if (idTarea == null) {
        response.sendRedirect("");
    }
    else {
        db.borrarTarea(idTarea);
        response.sendRedirect("");
    }
%>