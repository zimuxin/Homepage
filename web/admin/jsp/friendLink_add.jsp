<%@ page import="org.lsx.utils.DbUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-10
  Time: 下午5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理-添加友情链接</title>
    <link type="text/css" rel="stylesheet" href="../resources/style/base.css"/>
</head>
<body>
<form action="friendLink_add.jsp">

    网站名称：<input type="text" name="title"><br>
    网址：<input type="text" name="url"><br>
    <input type="submit" title="添加">

</form>
</body>
</html>
<%
    String title = request.getParameter("title");
    String url = request.getParameter("url");
    if (null != title && null != url) {
        Connection conn = DbUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO tb_friendlink(title,url) VALUES(?,?)");
        ps.setString(1, title);
        ps.setString(2, url);
        int i = ps.executeUpdate();
        if (i > 0) {
            out.print("添加成功");
        } else {
            out.print("添加失败");
        }


    }


%>