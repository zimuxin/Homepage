<%@ page import="org.lsx.dao.ArticleDao" %>
<%@ page import="org.lsx.entity.Article" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-9
  Time: 下午11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理-删除帖子</title>
    <link type="text/css" rel="stylesheet" href="/admin/resources/style/base.css"/>

</head>
<body>
<table border="0" cellspacing=0 cellpadding=0>
    <tr style="background: #395a7b;color: white;font-weight: bold">
        <td>编号</td>
        <td>标题</td>
        <td>内容</td>
        <td>发布日期</td>
        <td>操作</td>
    </tr>
    <%
        ArticleDao ad = new ArticleDao();
        List<Article> list =
                ad.list();
        for (int i = 0; i < list.size(); i++) {

            Article a = list.get(i);
    %>
    <tr>
        <td><%=a.getId()%>&nbsp;</td>
        <td><%=a.getTitle()%>&nbsp;</td>
        <td><% if (a.getContent().length() > 20) {
            out.println(a.getContent().substring(0, 20));
        }%>&nbsp;</td>
        <td><%=a.getPostDate()%>&nbsp;</td>
        <td><a href="article_del.jsp?articleId=<%=a.getId()%>">删除</a></td>
    </tr>

    <%
        }
    %>
    <%
        String articleId = request.getParameter("articleId");
        if (articleId != null) {
            if (ad.del(Long.valueOf(articleId))) {
                out.println("删除成功！");

            } else {
                out.println("删除失败！");
            }
            response.sendRedirect("article_del.jsp");
        }

    %>

</table>
</body>
</html>