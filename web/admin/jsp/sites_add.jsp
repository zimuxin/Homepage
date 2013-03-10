<%@ page import="org.lsx.dao.SiteDao" %>
<%@ page import="org.lsx.dao.SiteSortDao" %>
<%@ page import="org.lsx.entity.Site" %>
<%@ page import="org.lsx.entity.SiteSort" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-10
  Time: 下午6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理-添加网址收藏</title>
</head>
<body>
<form action="sites_add.jsp" method="post">
    选择一个分类
    <select name="sortId">
        <%
            SiteSortDao ssd = new SiteSortDao();
            List<SiteSort> list = ssd.list();
            for (int i = 0; i < list.size(); i++) {
                SiteSort ss = list.get(i);

        %>
        <option value="<%=ss.getId()%>"><%=ss.getName()%>
        </option>
        <%
            }
        %>
    </select> 如果没有需要的，请在左侧选在[添加网址分类]添加一个继续。
    <br> 网址：<input type="text" name="title"><br>url： <input type="text" name="url"><input
        type="submit" value="添加"></form>

</body>


</html>

<%
    String title = request.getParameter("title");
    String url = request.getParameter("url");
    String sortId = request.getParameter("sortId");
    if (null != title || "".equals(title) && null != url || "".equals(url)) {
        boolean b = new SiteDao().add(new Site(null, title, url, Long.valueOf(sortId)));
        if (b) {

            out.println("成功");
        } else {
            out.println("失败");
        }
    }
%>