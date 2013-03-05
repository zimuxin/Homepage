<%@ page import="org.lsx.entity.Message" %>
<%@ page import="org.lsx.dao.MessageDao" %>
<%@ page import="org.lsx.utils.Commons" %>
<%--
  Created by IntelliJ IDEA.
  User: lsx
  Date: 3/5/13
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    request.setCharacterEncoding("utf-8");

    String sender = request.getParameter("sender");
    String email = request.getParameter("email");
    String content = request.getParameter("content");
    Message message = new Message(0L, sender, email, content, Commons.nowTime());
    MessageDao md = new MessageDao();
    if (md.add(message)) {
        System.out.println("request = [" + request + "], response = [" + response + "]");
        System.out.println("successfully");
        out.print("发表留言成功！");
        out.flush();
        response.sendRedirect("index.jsp");

    }
%>


<html>
<head>
    <title>处理发表留言的jsp页面</title>
</head>
<body>
<a href="index.jsp">返回</a>
</body>
</html>