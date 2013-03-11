<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.ArticleDao" %>
<%@ page import="org.lsx.entity.Article" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html>
<head>
    <base href="<%=basePath %>">
    <title>个人主页</title>
</head>
<!--导入的外部样式表-->
<link type="text/css" rel="stylesheet" href="resources/style/base.css"/>
<link type="text/css" rel="stylesheet" href="resources/style/index.css"/>
<!--导入的JavaScript脚本-->
<script src="resources/script/base.js"></script>

<body>

<!--头部开始-->
<%@include file="_header.jsp" %>
<!--//头部结束-->
<a name="top"/>
<!--主体部分-->


<div id="contentBody" class="contentBody">

    <!--日志-->
    <%
        ArticleDao ad = new ArticleDao();

        List<Article> list = null;

        list = ad.list();

        for (Article a : list) {
    %>
    <h2><%=a.getTitle()%>
    </h2>
    <article>
        <div><%=a.getContent()%>
        </div>
    </article>
    <%
        }
    %>


    h

</div>

<!--//主体部分结束-->
<!--页脚部分开始-->

<%@ include file="_footer.jsp" %>
<!--导入的脚本-->
<script src="resources/script/floatTips.js"></script>
</body>
</html>