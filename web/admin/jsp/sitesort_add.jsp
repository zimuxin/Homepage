<%@ page import="org.lsx.dao.SiteSortDao" %>
<%@ page import="org.lsx.entity.SiteSort" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-10
  Time: 下午7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理-添加网址分类</title>
</head>
<body>

<form action="sitesort_add.jsp" method="post">分类名：<input type="text" name="name"><br>
    <input type="submit" value="添加"><br></form>

</body>
</html>

<%

    String name = request.getParameter("name");
    if (null != name && !"".equals(name)) {
        SiteSort ss = new SiteSort(null, name, null);
        boolean b = new SiteSortDao().add(ss);
        if (b) {
            out.println("成功");
        } else {
            out.print("失败");
        }
    }
%>