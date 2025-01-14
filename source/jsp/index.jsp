<%@ page import="src.dependencies.Usuario" %>
<%@ page import="src.dependencies.Database" %>
<%@ page import="src.dependencies.Tarea" %>
<%
    String usuario = session.getAttribute("user").toString();
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int usuario_id = Integer.parseInt(usuario);
    Database db = new Database(application.getRealPath("source/mini_office.mdb"));
    db.conectar();
    Usuario usuario_obj = db.devuelveUsuario(usuario_id);
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>MiniOffice</title>
    <meta name="generator" content="WYSIWYG Web Builder 17 Trial Version - https://www.wysiwygwebbuilder.com">
    <link href="font-awesome.min.css" rel="stylesheet">
    <link href="Design.css" rel="stylesheet">
    <link href="index.css" rel="stylesheet">
    <script src="jquery-1.12.4.min.js"></script>
    <script src="wwb17.min.js"></script>
</head>
<body>
<a href="https://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb17.png"
                                                                 alt="WYSIWYG Web Builder"
                                                                 style="position:absolute;left:441px;top:967px;margin: 0;border-width:0;z-index:250"
                                                                 width="16" height="16"></a>
<div id="wb_task_zone" style="position:absolute;left:349px;top:47px;width:750px;height:768px;z-index:1;">
    <img src="images/img0001.png" id="task_zone" alt="" width="750" height="768"
         style="width:750px;height:768px;border-radius: 1rem;"></div>
<div id="wb_user_zone" style="position:absolute;left:27px;top:47px;width:279px;height:768px;z-index:2;">
    <img src="images/img0002.png" id="user_zone" alt="" width="279" height="768"
         style="width:279px;height:768px;border-radius: 1rem;"></div>
<div id="wb_Text1" style="position:absolute;left:370px;top:84px;width:512px;height:43px;z-index:3;">
<%--    <span style="color:#FFFFFF;font-family:'Segoe UI Emoji';font-size:32px;"><strong>📥</strong></span>--%>
    <span style="color:#FFFFFF;font-family:Calibri;font-size:32px;"><strong> </strong></span><span
        style="color:#FFFFFF;font-family:Arial;font-size:32px;"><strong>ClaroPay :: Minuta Trabajo</strong></span></div>

<%
    Tarea[] tareas = db.devuelveTareas(usuario_obj);
//    Tarea[] tareas = new Tarea[0];
%>

<table style="position:absolute;left:370px;top:159px;width:709px;z-index:4;">
    <tbody>
    <%for (Tarea tarea: tareas) {%>
    <tr>
        <td>
            <div id="wb_tarea" style="position:relative;width:709px;z-index:4;">
                <div id="tarea" class="tarea_class"></div>
            </div>
            <div id="wb_Checkbox1" class="wb_Checkbox1_class wb_Checkbox1_class_input" style="position:relative;left:30px;top:-45px;width:20px;height:20px;z-index:99;">
                <input type="checkbox" id="Checkbox1" name="chk_task" value="on" style="position:absolute;left:0;top:0;"><label
                    for="Checkbox1"></label></div>
            <div id="wb_Text3" class="wb_Text3_class" style="position:relative;left:75px;top:-80px;width:620px;z-index:10;">
                <span style="color:#000000;font-family:Arial;font-size:21px;"><%=tarea.getNombreTarea()%></span></div>
            <div id="wb_task_type_icon" class="wb_task_type_icon_class"
                 style="position:relative;left:71px;top:-75px;width:15px;text-align:center;z-index:11;">
                <div id="task_type_icon"><i class="task_type_icon_class fa fa-sticky-note-o"></i></div>
            </div>
            <div id="wb_Text4" style="position:relative;left:90px;top:-88px;width:250px;z-index:12;">
                <span style="color:#4F4F4F;font-family:Arial;font-size:12px;"><%=tarea.getNota()%></span></div>
            <div id="wb_IconFont12"
                 style="position:relative;left:650px;top:-125px;width:30px;text-align:center;z-index:40;">
                <a href="#" onclick="ShowObject('wb_IconFont12', 1);return false;">
                    <div id="IconFont12"><i class="fa fa-star-o"></i></div>
                </a></div>

        </td>
    </tr>
    <%
        }
    %>

    <tr>
        <td>
            <div id="wb_add_task" style="position:relative;width:709px;opacity:0.60;z-index:6;">
                <div id="add_task"></div>
            </div>
            <a href="crear_tarea.jsp">
            <div id="wb_Text2" style="position:relative;left:71px;top:-45px;width:188px;z-index:7;">
                <span style="color:#000000;font-family:Arial;font-size:21px;">Nueva tarea</span></div>
            </a>
            <div id="wb_IconFont1"
                 style="position:relative;left:10px;top:-80px;width:49px;text-align:center;z-index:8;">
                <div id="IconFont1"><i class="fa fa-plus"></i></div>
            </div>
        </td>
    </tr>







    </tbody>
</table>


<!--<div id="wb_tarea" style="position:absolute;left:370px;top:159px;width:709px;height:70px;z-index:4;">-->
<!--<div id="tarea"></div></div>-->
<!--<div id="wb_Checkbox1" style="position:absolute;left:397px;top:184px;width:20px;height:20px;z-index:9;">-->
<!--    <input type="checkbox" id="Checkbox1" name="chk_task" value="on" style="position:absolute;left:0;top:0;"><label-->
<!--        for="Checkbox1"></label></div>-->
<!--<div id="wb_Text3" style="position:absolute;left:441px;top:169px;width:620px;height:24px;z-index:10;">-->
<!--    <span style="color:#000000;font-family:Arial;font-size:21px;">Actualización de puestos en sistemas</span></div>-->
<!--<div id="wb_task_type_icon"-->
<!--     style="position:absolute;left:445px;top:198px;width:15px;height:15px;text-align:center;z-index:11;">-->
<!--    <div id="task_type_icon"><i class="fa fa-sticky-note-o"></i></div>-->
<!--</div>-->
<!--<div id="wb_Text4" style="position:absolute;left:460px;top:199px;width:250px;height:13px;z-index:12;">-->
<!--    <span style="color:#4F4F4F;font-family:Arial;font-size:12px;">Nota</span></div>-->
<!--<div id="wb_IconFont12"-->
<!--     style="position:absolute;left:1031px;top:177px;width:30px;height:34px;text-align:center;z-index:40;">-->
<!--    <a href="#" onclick="ShowObject('wb_IconFont12', 1);return false;">-->
<!--        <div id="IconFont12"><i class="fa fa-star-o"></i></div>-->
<!--    </a></div>-->



<!--<div id="wb_add_task" style="position:absolute;left:370px;top:240px;width:709px;height:70px;opacity:0.60;z-index:6;">-->
<!--    <div id="add_task"></div>-->
<!--</div>-->
<!--<div id="wb_Text2" style="position:absolute;left:449px;top:263px;width:188px;height:24px;z-index:7;">-->
<!--    <span style="color:#000000;font-family:Arial;font-size:21px;">Nueva tarea</span></div>-->
<!--<div id="wb_IconFont1"-->
<!--     style="position:absolute;left:383px;top:253px;width:49px;height:44px;text-align:center;z-index:8;">-->
<!--    <div id="IconFont1"><i class="fa fa-plus"></i></div>-->
<!--</div>-->



<div id="wb_Shape1" style="position:absolute;left:1137px;top:47px;width:279px;height:768px;z-index:5;">
    <img src="images/img0003.png" id="Shape1" alt="" width="279" height="768"
         style="width:279px;height:768px;border-radius: 1rem;"></div>



<div id="wb_Shape2" style="position:absolute;left:1014px;top:86px;width:65px;height:39px;opacity:0.70;z-index:13;">
    <div id="Shape2" style="border-radius: 1rem;"></div>
</div>
<div id="wb_IconFont2"
     style="position:absolute;left:1020px;top:95px;width:29px;height:22px;text-align:center;z-index:14;">
    <div id="IconFont2"><i class="fa fa-users"></i></div>
</div>
<div id="wb_Text5" style="position:absolute;left:1056px;top:99px;width:20px;height:15px;z-index:15;">
    <span style="color:#000000;font-family:Arial;font-size:13px;">0</span></div>
<div id="wb_Shape3" style="position:absolute;left:44px;top:79px;width:53px;height:52px;z-index:16;">
    <img src="images/img0007.png" id="Shape3" alt="" width="53" height="52" style="width:53px;height:52px;"></div>
<div id="wb_Image1" style="position:absolute;left:46px;top:79px;width:48px;height:41px;z-index:17;">
    <img src="images/goku-png-32676.png" id="Image1" alt="" width="48" height="42"></div>

<div id="wb_Text6" style="position:absolute;left:102px;top:87px;width:196px;height:15px;z-index:18;">
    <span style="color:#000000;font-family:Arial;font-size:13px;"><strong><%=usuario_obj.getUsuario()%></strong></span>
</div>
<div id="wb_Text7" style="position:absolute;left:102px;top:101px;width:196px;height:15px;z-index:19;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;"><%=usuario_obj.getCorreo()%></span></div>


<input type="text" id="global_search" style="position:absolute;left:46px;top:143px;width:234px;height:16px;z-index:20;"
       name="global_search" value="" spellcheck="false" placeholder="Buscar">
<div id="wb_IconFont3"
     style="position:absolute;left:258px;top:145px;width:20px;height:20px;text-align:center;z-index:21;">
    <div id="IconFont3"><i class="fa fa-search"></i></div>
</div>

<div style="position: absolute;left:46px;width: 128px;top: 198px">
    <table>
        <tr>
            <td>
<%--                <div id="wb_IconFont4"--%>
<%--                     style="position:relative;height:28px;text-align:center;z-index:22;">--%>
<%--                    <div id="IconFont4"><i class="fa fa-sun-o"></i></div>--%>
                </div>
                <div id="wb_Text8" style="position:relative;top: -22px;left: 40px;height:15px;z-index:23;">
                    <span style="color:#000000;font-family:Arial;font-size:13px;">Mi dia</span></div>
            </td>
        </tr>
    </table>
</div>

<%--<div id="wb_IconFont5"--%>
<%--     style="position:absolute;left:46px;top:229px;width:30px;height:28px;text-align:center;z-index:24;">--%>
<%--    <div id="IconFont5"><i class="fa fa-star"></i></div>--%>
<%--</div>--%>
<%--<div id="wb_Text9" style="position:absolute;left:86px;top:234px;width:184px;height:15px;z-index:25;">--%>
<%--    <span style="color:#000000;font-family:Arial;font-size:13px;">Importante</span></div>--%>
<%--<div id="wb_IconFont6"--%>
<%--     style="position:absolute;left:46px;top:264px;width:30px;height:28px;text-align:center;z-index:26;">--%>
<%--    <div id="IconFont6"><i class="fa fa-list"></i></div>--%>
<%--</div>--%>
<%--<div id="wb_Text10" style="position:absolute;left:86px;top:269px;width:184px;height:15px;z-index:27;">--%>
<%--    <span style="color:#000000;font-family:Arial;font-size:13px;">Planeado</span></div>--%>
<%--<div id="wb_IconFont7"--%>
<%--     style="position:absolute;left:47px;top:299px;width:30px;height:28px;text-align:center;z-index:28;">--%>
<%--    <div id="IconFont7"><i class="fa fa-check-circle"></i></div>--%>
<%--</div>--%>
<%--<div id="wb_Text11" style="position:absolute;left:87px;top:304px;width:184px;height:15px;z-index:29;">--%>
<%--    <span style="color:#000000;font-family:Arial;font-size:13px;">Completadas</span></div>--%>
<%--<div id="wb_IconFont8"--%>
<%--     style="position:absolute;left:47px;top:332px;width:30px;height:28px;text-align:center;z-index:30;">--%>
<%--    <div id="IconFont8"><i class="fa fa-user"></i></div>--%>
<%--</div>--%>
<%--<div id="wb_Text12" style="position:absolute;left:87px;top:337px;width:184px;height:15px;z-index:31;">--%>
<%--    <span style="color:#000000;font-family:Arial;font-size:13px;">Asignado a mí</span></div>--%>
<%--<div id="wb_IconFont9"--%>
<%--     style="position:absolute;left:47px;top:368px;width:30px;height:28px;text-align:center;z-index:32;">--%>
<%--    <div id="IconFont9"><i class="fa fa-home"></i></div>--%>
<%--</div>--%>
<%--<div id="wb_Text13" style="position:absolute;left:87px;top:373px;width:184px;height:15px;z-index:33;">--%>
<%--    <span style="color:#000000;font-family:Arial;font-size:13px;">Tareas</span></div>--%>

<div id="wb_Shape4" style="position:absolute;left:44px;top:757px;width:246px;height:47px;opacity:0.25;z-index:34;">
    <img src="images/img0008.png" id="Shape4" alt="" width="246" height="47" style="width:246px;height:47px;"></div>
<div id="wb_IconFont10"
     style="position:absolute;left:56px;top:761px;width:40px;height:40px;text-align:center;z-index:35;">
    <div id="IconFont10"><i class="fa fa-plus"></i></div>
</div>
<div id="wb_Text14" style="position:absolute;left:102px;top:768px;width:176px;height:24px;z-index:36;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:21px;">Nueva lista</span></div>
<div id="wb_Text15" style="position:absolute;left:1150px;top:95px;width:246px;height:48px;z-index:37;">
    <span style="color:#000000;font-family:Arial;font-size:21px;">Actualizacion de puestos en sistemas</span></div>
<div id="wb_Text16" style="position:absolute;left:1184px;top:162px;width:104px;height:18px;z-index:38;">
    <span style="color:#4169E1;font-family:Arial;font-size:16px;">Agregar paso</span></div>
<div id="wb_IconFont11"
     style="position:absolute;left:1158px;top:159px;width:25px;height:25px;text-align:center;z-index:39;">
    <div id="IconFont11"><i class="fa fa-plus"></i></div>
</div>

<div id="wb_IconFont13"
     style="position:absolute;left:1167px;top:229px;width:20px;height:24px;text-align:center;z-index:41;">
    <div id="IconFont13"><i class="fa fa-sun-o"></i></div>
</div>
<div id="wb_Text17" style="position:absolute;left:1196px;top:233px;width:184px;height:15px;z-index:42;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Agregar a Mi día</span></div>
<div id="wb_IconFont14"
     style="position:absolute;left:1167px;top:280px;width:20px;height:24px;text-align:center;z-index:43;">
    <div id="IconFont14"><i class="fa fa-clock-o"></i></div>
</div>
<div id="wb_Text18" style="position:absolute;left:1196px;top:284px;width:184px;height:15px;z-index:44;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Recordarme</span></div>
<div id="wb_IconFont15"
     style="position:absolute;left:1168px;top:327px;width:20px;height:24px;text-align:center;z-index:45;">
    <div id="IconFont15"><i class="fa fa-calendar"></i></div>
</div>
<div id="wb_Text19" style="position:absolute;left:1196px;top:331px;width:184px;height:15px;z-index:46;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Agregar fecha de vencimiento</span></div>
<div id="wb_IconFont16"
     style="position:absolute;left:1168px;top:373px;width:20px;height:24px;text-align:center;z-index:47;">
    <div id="IconFont16"><i class="fa fa-repeat"></i></div>
</div>
<div id="wb_Text20" style="position:absolute;left:1196px;top:377px;width:184px;height:15px;z-index:48;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Repetir</span></div>
<div id="wb_IconFont17"
     style="position:absolute;left:1168px;top:424px;width:20px;height:24px;text-align:center;z-index:49;">
    <div id="IconFont17"><i class="fa fa-user-plus"></i></div>
</div>
<div id="wb_Text21" style="position:absolute;left:1196px;top:428px;width:184px;height:15px;z-index:50;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Asignar a</span></div>
<div id="wb_IconFont18"
     style="position:absolute;left:1167px;top:476px;width:20px;height:24px;text-align:center;z-index:51;">
    <div id="IconFont18"><i class="fa fa-paperclip"></i></div>
</div>
<div id="wb_Text22" style="position:absolute;left:1196px;top:480px;width:184px;height:15px;z-index:52;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Agregar archivo</span></div>
<div id="wb_Text23" style="position:absolute;left:1165px;top:520px;width:231px;height:72px;z-index:53;">
    <span style="color:#000000;font-family:Arial;font-size:21px;">25 de octubre primera reunion entre Alicia y Tartaglia</span>
</div>
<div id="wb_Text24" style="position:absolute;left:1168px;top:612px;width:184px;height:15px;z-index:54;">
    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Actualizado el 29 de marzo</span></div>
<%--<div id="wb_Text25" style="position:absolute;left:1196px;top:789px;width:184px;height:15px;z-index:55;">--%>
<%--    <span style="color:#4F4F4F;font-family:Arial;font-size:13px;">Creada por Damaris Flores</span></div>--%>
</body>
</html>