<%@ page import="org.lsx.dao.ArticleDao" %>
<%@ page import="org.lsx.entity.Article" %>
<%@ page import="org.lsx.utils.Commons" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-9
  Time: 下午11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    if (title != null && contents != null && !title.trim().isEmpty() && !contents.trim().isEmpty()) {
        if (new ArticleDao().add(new Article(null, request.getParameter("title"), request.getParameter("contents"), Commons.nowTime()))) {
            out.println("发表成功！");
        } else {
            out.println("发表失败！");
        }
    }


%>
<html>
<head>
    <title>系统后台管理-发表文章</title>
    <link type="text/css" rel="stylesheet" href="/admin/resources/style/base.css"/>
</head>
<body style="margin-left: 20px">
<br>发表文章 <br> <br>

<form action="" method="post">

    标题：<input type="text" name="title"/> <br>
    内容：<br/><textarea name="contents" style="width: 600px;height: 400px;margin-left:35px;"></textarea>
    <br>&nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="发表"><input type="reset">
</form>

</body>
</html>