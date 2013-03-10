<%@ page import="org.lsx.utils.DbUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@page pageEncoding="utf-8" language="java" %>
<footer>
    <%

        Connection conn = DbUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement("select id,title,url from tb_friendLink");
        ResultSet rs = ps.executeQuery();
        String title = "";
        String url = "";
        while (rs.next()) {
            title = rs.getString("title");
            url = rs.getString("url");


    %>

    <a href="<%=url%>"><%=title%>
    </a>
    <%
        }
        rs.close();
        ps.close();
        conn.close();
    %>
    <p style="text-align: center;color:#fff"><a href="admin/login.html">登陆后台</a></p>
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