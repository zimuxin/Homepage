<%@ page import="org.lsx.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理中心</title>
    <meta http-equiv=Content-Type content=text/html;charset=utf-8>
</head>
<input name="userId" type="hidden" id="userId" value="<%
String userId=request.getParameter("userId");
session.setAttribute("user",new UserDao().get(Long.valueOf(userId)));
application.setAttribute("userId",userId);
out.print(userId);
%>"/>
<frameset rows="64,*" frameborder="NO" border="0" framespacing="0">
    <frame src="admin_top.jsp" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0"
           marginheight="0" target="main"/>
    <frameset cols="200,*" rows="560,*" id="frame">
        <frame src="left.html" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0"
               scrolling="no" target="main"/>
        <frame src="right.html" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"
               target="_self"/>
    </frameset>
    <noframes>
        <body></body>
    </noframes>
</html>
