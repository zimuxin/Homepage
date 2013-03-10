<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.SiteSortDao" %>
<%@ page import="org.lsx.entity.Site" %>
<%@ page import="org.lsx.entity.SiteSort" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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

<!--主体部分-->


<div id="contentBody" class="contentBody">


    <!--网址收藏-->
    <div id="myCollection_">我的网址收藏<br/>
        <sql:setDataSource var="dataSour" driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost/homepage" user="app" password="ok"/>
        <sql:query var="rs" dataSource="${dataSour}" sql="select id,title,url from tb_site"/>


        <%
            SiteSortDao ssd = new SiteSortDao();
            List<SiteSort> siteSortLis = ssd.list();
            for (SiteSort ss : siteSortLis) {


        %>
        <div class="siteItem">


            <h3><%=ss.getName()%>
            </h3>
            <br>

            <%

                List<Site> siteList = ss.getSiteList();
                for (int j = 0; j < siteList.size(); j++) {
                    Site site = siteList.get(j);
                    String title = site.getTitle();
                    String url = site.getUrl();
            %>
            <li>
                <a href="<%=url%>" target="_blank">

                    <%=title%>
                </a></li>
            <%
                }
            %>

        </div>
        <%
            }
        %>

    </div>


</div>

<!--//主体部分结束-->
<!--页脚部分开始-->

<%@ include file="_footer.jsp" %>
<!--导入的脚本-->
<script src="resources/script/floatTips.js"></script>
</body>
</html>