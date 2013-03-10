<%@ page import="org.lsx.dao.UserDao" %>
<%@ page import="org.lsx.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title> - 管理页面</title>
    <script language=JavaScript>
        function logout() {
            if (confirm("您确定要退出控制面板吗？"))
                top.location = "out.asp";
            return false;
        }
    </script>
    <script language=JavaScript1.2>
        function showsubmenu(sid) {
            var whichEl = eval("submenu" + sid);
            var menuTitle = eval("menuTitle" + sid);
            if (whichEl.style.display == "none") {
                eval("submenu" + sid + ".style.display=\"\";");
            } else {
                eval("submenu" + sid + ".style.display=\"none\";");
            }
        }
    </script>
    <meta http-equiv=Content-Type content=text/html;charset=gb2312>
    <meta http-equiv="refresh" content="60">
    <script language=JavaScript1.2>
        function showsubmenu(sid) {
            var whichEl = eval("submenu" + sid);
            var menuTitle = eval("menuTitle" + sid);
            if (whichEl.style.display == "none") {
                eval("submenu" + sid + ".style.display=\"\";");
            } else {
                eval("submenu" + sid + ".style.display=\"none\";");
            }
        }
    </script>
    <base target="main">
    <link href="images/skin.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
    <tr>
        <td width="61%" height="64" style="vertical-align: top;margin-top: 4px">
            <a href="/index.jsp" style="color:#000" target="_parent"> <span
                    style="color:white;margin-left: 6px;font-weight: bold">返回前台主页</span></a>
            <%--<img src="images/logo.gif" width="262" height="64">--%></td>
        <td width="39%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="74%" height="38" class="admin_txt">管理员：<b><%

                        UserDao ud = new UserDao();
                        User user = (User) application.getAttribute("user");
                        session.setAttribute("user", user);
                        System.out.println("当前登录用户的状态:" + user);
                        if (user == null) {
                            out.println("null,我要跳转了！");
                            out.println("<script type=\"text/javascript\">");
                            out.println("self.parent.location.href='/admin/login.html'");
                            out.println("</script>");
                            out.flush();
                            //response.sendRedirect("login.html");
                        } else {


                    %>
                        <%--<%=user.getNickName()%>--%>

                        <%=user.getNickName()%>
                        <%
                            }
                        %>
                    </b> 您好,感谢登陆使用！
                    </td>
                    <td width="22%"><a href="#" target="_self" onClick="logout();"><img src="images/out.gif" alt="安全退出"
                                                                                        width="46" height="20"
                                                                                        border="0"></a></td>
                    <td width="4%">&nbsp;</td>
                </tr>
                <tr>
                    <td height="19" colspan="3">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
