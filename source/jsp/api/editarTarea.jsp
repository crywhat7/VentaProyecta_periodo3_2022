<%@page import="dependencies.Database" %>
<%@page import="dependencies.Tarea" %>
<%@ page import="com.healthmarketscience.jackcess.Cursor" %>
<%
    Database db = new Database(application.getRealPath("../mini_office.accdb"));
    Tarea tarea = null;
    db.conectar();
    Object idTarea = session.getAttribute("id_tarea");
    if (idTarea == null) {
        response.sendRedirect("");
    }
    else {
        tarea = db.devuelveTarea(idTarea);
        if (tarea == null) {
            <!-- Redireccionar a nada -->
        }
        else {
            <!-- Redireccionar a index -->
        }
    }

    String nombreTarea, nota, creadoEn, vencimiento, listaAsignada, completada, creadoPor;
    nombreTarea =  request.getParameter("nombreTarea");
    nota = request.getParameter("nota");
    vencimiento = request.getParamater("vencimiento");
    listaAsignada = request.gerParameter("listaAsignada");
    completada = request.getParameter("completada");
    creadoPor = request.getParameter("creadoPor");

    Tarea tareaModificada = new Tarea(0, nombreTarea, nota, creadoEn, vencimiento, listaAsignada, completada, creadaPor);
    
    db.editarTarea(tareaModificada);
%>