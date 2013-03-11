<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.AlbumDao" %>
<%@ page import="org.lsx.entity.Album" %>
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


    <!--图片-->

    <div id="photo_"><br>
        <%
            AlbumDao albumDao = new AlbumDao();
            List<Album> albumList = albumDao.list();
            int len = albumList.size();
            for (int i = 0; i < len; i++) {
                Album a = albumList.get(i);
        %>
        <div class="photo-album">
            <dl>
                <dd><img alt="无封面"  onclick="window.location.href='photos.jsp?id=<%=a.getId()%>'"
                         src="resources/image/photo/<%=a.getCoverPath()%>"></dd>
            </dl>
            <dt style="margin:auto;text-align: center;"><%=a.getName()%>
            </dt>

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