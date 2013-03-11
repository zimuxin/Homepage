<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.AlbumDao" %>
<%@ page import="org.lsx.entity.Album" %>
<%@ page import="org.lsx.entity.Photo" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html>
<head>
    <base href="<%=basePath %>">
    <title>个人主页-照片</title>
</head>
<!--导入的外部样式表-->
<link type="text/css" rel="stylesheet" href="resources/style/base.css"/>
<link type="text/css" rel="stylesheet" href="resources/style/index.css"/>
<!--导入的JavaScript脚本-->
<script src="resources/script/base.js"></script>

<body>
<a name="top"/>
<!--头部开始-->
<%@include file="_header.jsp" %>
<!--//头部结束-->

<!--主体部分-->


<div id="contentBody" class="contentBody">


    <!--图片-->
    <%

        String id = request.getParameter("id");
        AlbumDao albumDao = new AlbumDao();
        Album album = albumDao.get(new Long(id));
    %>
    <div id="photo_"><a href="album.jsp">我的相册</a> >><a href="photos.jsp?id=<%=album.getId()%>"><%=album.getName()%>
    </a> <span>&nbsp;<a href=""></a></span> <br>


        <%

            for (Photo photo : album.getPhotoList()) {
        %>
        <div class="photo-item">
            <img alt="<%=photo.getDescribe()%>" title="<%=photo.getDescribe()%>"
                 src="resources/image/photo/<%=photo.getFilename()%>">
            <br>
            <%--<span style="margin: auto;"><%=photo.getDescribe()%></span>--%>

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