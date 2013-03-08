<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.AlbumDao" %>
<%@ page import="org.lsx.dao.ArticleDao" %>
<%@ page import="org.lsx.dao.MessageDao" %>
<%@ page import="org.lsx.dao.SiteSortDao" %>
<%@ page import="org.lsx.entity.*" %>
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

<body onload="switchDisplay('nav-daily')">
<a name="top"/>
<!--头部开始-->
<header>
    <nav>
        <ul id="navbar">
            <li><a id="nav-daily" onclick="switchDisplay(this.id)">日志</a></li>
            <li><a id="nav-message" onclick="switchDisplay(this.id)">留言</a></li>
            <li><a id="nav-photo" onclick="switchDisplay(this.id)">图片</a></li>
            <li><a id="nav-myCollection" onclick="switchDisplay(this.id)">网址收藏</a></li>
            <li><a id="nav-about" onclick="switchDisplay(this.id)">关于</a></li>
        </ul>
    </nav>
    <!--返回顶部的按钮-->
    <div id="toTop" class="toTop">

        <a href="#"><img src="/resources/image/top2.png"/></a>
    </div>
</header>
<!--//头部结束-->

<!--主体部分-->


<div id="contentBody" class="contentBody">

    <!--日志-->
    <div id="daily_">
         <%
             ArticleDao ad=  new ArticleDao();

             List<Article> list=null;

            list= ad.list();

              for (Article a:list){
         %>
            <h2> <%=a.getTitle()%></h2>
            <article>
               <div><%=a.getContent()%></div>
            </article>
         <%
        }
        %>
    </div>


    <!--留言-->
    <div id="message_">


        <strong style="font-size:1.5em;margin-right: 600px;">最新留言4：</strong> <div class="postMessage"> <a href="#postMessage" >发表留言</a></div><br/>
        <hr  size=1 color="#ccc" style="width:100%;text-align:left;margin-top: 1px;margin-bottom: 10px;">
        <!--已有的留言--->

        <%
            MessageDao md=new MessageDao();
            List<Message> msgList=md.list();
            for(Message msg:msgList){
        %>
        <p class="msg-email"><%=msg.getEmail()%></p>

         <article >

           <%=msg.getContent()%>

         </article>
        <div class="msg-date"><%=msg.getDate()%></div>

        <%
            }
        %>

        <p>
          <br/>
          <br/>
          <br/>

        </p>

        <!---发表留言-->


            <div id="msg_result"></div>
        <a name="postMessage"/>
        <strong style="font-size: 13">发表留言:</strong>  <br>
        <form action="post_message.jsp" method="post">

            <span>发信人：</span><input name="sender"  type="text" /> &nbsp;
            <span>邮 箱：</span><input type="email" name="email"/>
            <input type="submit"/>
            <input type="reset"/> <br/>
            <span>内 容：</span> <textarea name="content"></textarea>
            <br/>



            <br/>
        </form>

    </div>


    <!--图片-->

    <div id="photo_">我的相册 <br>
          <%
              AlbumDao albumDao=new AlbumDao();
              List<Album> albumList=albumDao.list();
              int len=albumList.size();
              for (int i = 0; i <len; i++) {
                  Album a=    albumList.get(i);
            %>
        <div class="photo-album">
            <dl>
            <dd><img onclick="window.location.href='album.jsp?id=<%=a.getId()%>'" src="resources/image/photo/<%=a.getCoverPath()%>"></dd>
            </dl>
            <dt style="margin:auto;text-align: center;"><%=a.getName()%></dt>

        </div>
         <%
             }

         %>




    </div>


    <!--网址收藏-->
    <div id="myCollection_">我的网址收藏<br/>
        <sql:setDataSource  var="dataSour" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost/homepage" user="app" password="ok"/>
        <sql:query var="rs" dataSource="${dataSour}" sql="select id,title,url from tb_site" />













      <%
          SiteSortDao ssd=new SiteSortDao();
          List<SiteSort> siteSortLis=ssd.list();
          for(SiteSort ss:siteSortLis){


      %>
        <div class="siteItem">
            <h3><%=ss.getName()%></h3>
            <br>

            <%

               List<Site> siteList= ss.getSiteList();
                for(int j=0;j<siteList.size();j++){
                     Site site=siteList.get(j);
                     String title=site.getTitle();
                    String url=site.getUrl();
            %>
            <li>
                <a href="<%=url%>">

                <%=title%></a></li>
               <%
                   }
               %>

        </div>
       <%
           }
       %>

    </div>


    <!--about-->
    <div id="about_">关于 <br>

            这个...

    </div>

</div>

<!--//主体部分结束-->
<!--页脚部分开始-->
<footer>

    <p>----页脚----- </p>
    <br/>
    切换背景图片
    <select id="bgSelector" onchange="selectBg(this.value)">

        <option value="1">1</option>

        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="11">小清新1</option>

    </select>
</footer>
<!--导入的脚本-->
<script src="resources/script/floatTips.js"></script>
</body>
</html>