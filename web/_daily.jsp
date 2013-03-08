<%@page pageEncoding="utf-8" language="java" %>
<%@ page import="org.lsx.dao.ArticleDao" %>
<%@ page import="org.lsx.entity.Article" %>
<%@ page import="java.util.List" %>
<div id="daily_">
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
</div>