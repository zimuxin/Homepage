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
    <link type="text/css" rel="stylesheet" href="../resources/style/base.css"/>
    <link type="text/css" rel="stylesheet" href="../resources/button.css"/>
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
    </select>
    <br> 网站名字：<input style="border: 1px solid #cc9900" type="text" name="title"><br>
    <span style="text-align: right;width:140px">网址(URL)： </span> <input style="border: 1px solid #cc9900" type="text"
                                                                        name="url">
    <br>
    <input class="btn5" type="submit" value="添加">


</form>

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