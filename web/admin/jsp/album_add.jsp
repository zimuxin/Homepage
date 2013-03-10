<%@ page import="org.lsx.dao.AlbumDao" %>
<%@ page import="org.lsx.entity.Album" %>
<%@ page import="org.lsx.utils.Commons" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-10
  Time: 下午2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AlbumDao ad = new AlbumDao();
    String title = request.getParameter("title");
    String cover = request.getParameter("cover");
    if (cover != null && cover.trim() == "") {
        cover = "nocover.png";
    }

    if (null != title && !title.equals("")) {
        Album album = new Album(null, title, "nocover.png", Commons.nowTime(), null);
        boolean rst = ad.add(album);
        if (rst) {
            out.print("添加成功");
        } else {
            //  out.println("添加失败") ;
        }
    }

%>
<html>
<head>
    <title>后台管理-新建相册</title>
    <script type="text/javascript">
        function $() {
            return document.getElementById(arguments[0]);
        }
        function add() {
            var title = $('title').value;

            if (title.trim() != "") {
                $('myform').submit();
            } else {
                $('title-msg').innerText = "起个名字先！";
            }
        }

    </script>
</head>
<body>
<form id="myform" action="/admin/jsp/album_add.jsp" method="post">
    相册名：<input type="text" name="title" id="title"><span id="title-msg"></span><br>
    封 &nbsp;面：<input type="text" name="cover "/>可以不指定 <br>
    <input type="button" onclick="add()" value="添加"></form>
</body>
</html>