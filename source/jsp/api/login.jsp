<%@ page import="java.util.Map" %>
<%@page import="src.dependencies.Database" %>
<%@page import="src.dependencies.Usuario" %>
<%@ page import="java.util.Objects" %>
<%
    Database db = new Database(application.getRealPath("source/mini_office.mdb"));
    String usuario, clave;
    usuario = request.getParameter("usuario");
    clave = request.getParameter("clave");

    db.conectar();
    Usuario usuarioObj = db.devuelveUsuario(usuario);    
    
    if (usuarioObj == null) {
//        <!-- Imprime no existe el usuario o algo -->
        %>
<script>
    alert("Hubo un error con sus credenciales")
</script>
<%
    }
    else {
       if (Objects.equals(clave, usuarioObj.getClave())) {
           session.setAttribute("user", usuarioObj.getId());
//           <!-- Imprime que se ingresó con exito -->
           out.println("<script>\n" +
                   "    alert(\"Se ingreso con exito!\")\n" +
                   "</script>");
           db.desconectar();
           response.sendRedirect("../index.jsp");
           return;
       }
       else {
//           <!-- Imprime que la clave o contrasenia estan incorrectas -->
           db.desconectar();
            out.println("<script>\n" +
                    "    alert(\"Hubo un error con sus credenciales\")\n" +
                    "</script>");
       }
    }

//    return;
%>

<%--<script>--%>
<%--    alert("Se ingreso con exito!")--%>
<%--</script>--%>

<%--<script>--%>
<%--    alert("Hubo un error con sus credenciales")--%>
<%--</script>--%>