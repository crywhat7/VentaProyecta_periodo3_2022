<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Untitled Page</title>
    <meta name="generator" content="WYSIWYG Web Builder 17 Trial Version - https://www.wysiwygwebbuilder.com">
    <link href="Design.css" rel="stylesheet">
    <link href="crear_tarea.css" rel="stylesheet">
</head>
<body>
<div id="container">
<%--    <a href="https://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb17.png"--%>
<%--                                                                     alt="WYSIWYG Web Builder"--%>
<%--                                                                     style="position:absolute;left:441px;top:967px;margin: 0;border-width:0;z-index:250"--%>
<%--                                                                     width="16" height="16"></a>--%>
    <div id="wb_user" style="position:absolute;left:189px;top:38px;width:567px;height:565px;z-index:7;">
        <form name="Form1" method="post" action="api/agregar_tarea.jsp"
              id="user">
            <div id="wb_Text1"
                 style="position:absolute;left:105px;top:37px;width:356px;height:60px;text-align:center;z-index:0;">
                <span style="color:#000000;font-family:Arial;font-size:53px;">Crear Tarea</span></div>
            <input type="text" id="NombreTarea"
                   style="position:absolute;left:142px;top:206px;width:272px;height:20px;z-index:1;" name="NombreTarea"
                   value="" spellcheck="false">
            <input type="text" id="Nota"
                   style="position:absolute;left:142px;top:343px;width:272px;height:20px;z-index:2;" name="Nota"
                   value="" spellcheck="false">
            <div id="wb_Text2"
                 style="position:absolute;left:156px;top:147px;width:254px;height:39px;text-align:center;z-index:3;">
                <span style="color:#000000;font-family:Arial;font-size:35px;">Nombre Tarea</span></div>
            <div id="wb_Text3"
                 style="position:absolute;left:158px;top:293px;width:250px;height:39px;text-align:center;z-index:4;">
                <span style="color:#000000;font-family:Arial;font-size:35px;">Nota</span></div>
            <input type="submit" id="Ingresar_btn" name="" value="Submit"
                   style="position:absolute;left:194px;top:425px;width:178px;height:55px;z-index:5;">
        </form>
    </div>
</div>
</body>
</html>