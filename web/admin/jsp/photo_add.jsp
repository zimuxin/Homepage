<%@ page import="org.lsx.dao.AlbumDao" %>
<%@ page import="org.lsx.entity.Album" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-10
  Time: 下午2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /* String str=request.getParameter("filename");
    if(null!=str&&!str.equals("")){
     String albumId=request.getParameter("album");
     String describe=request.getParameter("describe");
     String   filename=request.getParameter("filename");
     PhotoDao pd=new PhotoDao();
     Photo photo=new Photo();
     photo.setFilename(filename);
     photo.setDescribe(describe);
     photo.setAlbumId(Long.valueOf(albumId));

     if(pd.add(photo)){
         out.println("成功");

     }else{
         out.println("失败");
     }

    }*/

%>
<html>
<head>
    <title>后台管理-上传图片</title>
</head>
<body>
<form action="/fileUpload" method="post" enctype="multipart/form-data">
    选择所属相册:
    <select id="albums" name="album">
        <%
            AlbumDao ad = new AlbumDao();
            List<Album> list = ad.list();
            for (int i = 0; i < list.size(); i++) {
                Album a = list.get(i);

        %>
        <option value="<%=a.getId()%>"><%=a.getName()%>
        </option>
        <%
            }
        %>
    </select>
    <br>
    描述：<input type="text" name="describe"><br>
    <input type="file" name="filename"><br>
    <input type="submit" value="开始上传"><br>
</form>
</body>
</html>