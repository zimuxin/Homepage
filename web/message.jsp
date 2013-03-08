<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.dao.MessageDao" %>
<%@ page import="org.lsx.entity.Message" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人主页-留言</title>
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


    <!---发表留言-->


    <div id="message_">


        <strong style="font-size:1.5em;margin-right: 600px;">最新留言：</strong>

        <div class="postMessage"><a href="#postMessage">发表留言</a></div>
        <br/>
        <hr size=1 color="#ccc" style="width:100%;text-align:left;margin-top: 1px;margin-bottom: 10px;">
        <!--已有的留言--->

        <%
            MessageDao md = new MessageDao();
            List<Message> msgList = md.list();
            for (Message msg : msgList) {
        %>
        <p class="msg-email"><%=msg.getEmail()%>
        </p>

        <article>

            <%=msg.getContent()%>

        </article>
        <div class="msg-date"><%=msg.getDate()%>
        </div>

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
        <strong style="font-size: 13">发表留言:</strong> <br> <br>

        <form action="post_message.jsp" method="post">

            <span>发信人：</span><input name="sender" type="text"/> &nbsp;
            <span>邮 箱：</span><input type="email" name="email"/>
            <input type="submit" title="发表" value="发表"
                   style="width: 90px;height: 30px;background-color:#a52a2a;color:white"/>
            <input type="reset" title="清空" value="清空" style="width: 68px;height: 30px;background-color:aqua"/> <br/>
            <span>内 容：</span> <textarea name="content"></textarea>
            <br/>


            <br/>
        </form>

    </div>


</div>

<!--//主体部分结束-->
<!--页脚部分开始-->

<%@ include file="_footer.jsp" %>
<!--导入的脚本-->
<script src="resources/script/floatTips.js"></script>
</body>
</html>