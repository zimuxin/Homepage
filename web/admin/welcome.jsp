<%@ page import="org.lsx.dao.UserDao" %>
<%@ page import="org.lsx.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 13-3-9
  Time: 下午5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //  request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String loginName = request.getParameter("loginName");
    String loginPwd = request.getParameter("loginPwd");
    UserDao ud = new UserDao();


    User user = ud.getByNameAndPassword(loginName, loginPwd);
    if (null == user) {
        response.setContentType("text/plain");
        response.getWriter().write("用户和密码不匹配");

        //  out.writer("用户和密码不匹配") ;


    } else {

        request.setAttribute("user", user);
        //  response.setContentType("text/plain");
        application.setAttribute("user", user);
        response.getWriter().write(user.getId().toString());

    }

%>
