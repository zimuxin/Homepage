<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lsx.utils.Commons" %>
<%@ page import="org.lsx.utils.DbUtil" %>
<link href="images/skin.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style type="text/css">
    <!--
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        background-color: #EEF2FB;
    }

    -->
</style>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17"
                                                                             height="29"/></td>
        <td valign="top" background="images/content-bg.gif">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
                <tr>
                    <td height="31">
                        <div class="titlebt">欢迎界面</div>
                    </td>
                </tr>
            </table>
        </td>
        <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16"
                                                                              height="29"/></td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" valign="top">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" valign="top"><span class="left_bt">欢迎使用个人博客后台管理</span><br>
                        <br>
            <span class="left_txt">&nbsp;<img src="images/ts.gif" width="16" height="16"> 提示：<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
                                class="left_ts">今天是：<%
                            String nowTime = Commons.nowTime();
                            out.println(nowTime.substring(0, nowTime.indexOf(" ")));
                        %>

        </span><span class="left_txt"><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　 <br>
</span></td>
                    <td width="7%">&nbsp;</td>
                    <td width="40%" valign="top">

                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" valign="top"><!--JavaScript部分-->
                        <SCRIPT language=javascript>

                        </SCRIPT>
                        <!--HTML部分-->
                        <TABLE width=72% border=0 cellPadding=0 cellSpacing=0 id=secTable>
                            <TBODY>
                            <TR align=middle height=20>

                                <TD align="center" class=sec1 onclick=secBoard(1)>统计信息</TD>
                                <TD align="center" class=sec1 onclick=secBoard(2)>系统参数</TD>

                            </TR>
                            </TBODY>
                        </TABLE>
                        <TABLE class=main_tab id=mainTable cellSpacing=0
                               cellPadding=0 width=100% border=0>
                            <!--关于TBODY标记-->

                            <!--关于cells集合-->

                            <!--关于tBodies集合-->
                            <TBODY style="DISPLAY: block">
                            <TR>
                                <TD vAlign=top align=middle>
                                    <TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>
                                        <TBODY>
                                        <TR>
                                            <TD colspan="3"></TD>
                                        </TR>
                                        <TR>
                                            <TD height="5" colspan="3"></TD>
                                        </TR>
                                        <TR>
                                            <TD width="4%" height="25" background="images/news-title-bg.gif"></TD>
                                            <TD height="25" colspan="2" background="images/news-title-bg.gif"
                                                class="left_txt"><span
                                                    class="TableRow2">服务器IP:<%
                                                out.print(request.getLocalAddr());
                                            %></span>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD height="25" bgcolor="#FAFBFC">&nbsp;</TD>
                                            <TD width="30%" height="25" bgcolor="#FAFBFC"><span class="left_txt">服务器类型：

           </span></TD>
                                            <TD width="400px" height="25" bgcolor="#FAFBFC"><span
                                                    class="left_txt"><%=request.getServletContext().getServerInfo()%></span>
                                            </TD>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD height="25" bgcolor="#FAFBFC">&nbsp;</TD>
                                            <TD height="25" bgcolor="#FAFBFC"><span class="left_txt">站点物理路径：</span></TD>

                                            <TD width="54%" height="25" bgcolor="#FAFBFC"><span class="left_txt">
                    <%
                        out.print(System.getProperty("user.dir"));
                    %>
</span></TD>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD height="25" bgcolor="#FAFBFC">&nbsp;</TD>

                                            <TD height="25" colspan=2 bgcolor="#FAFBFC"><span
                                                    class="left_txt">数据库使用：</span><span class="left_ts"><%=
                                            DbUtil.getConnection().getMetaData().getDatabaseProductName()
                                            %><b style="color:blue">


                                            </b></span></TD>
                                        </TR>

                                        <TR>
                                            <TD height="5" colspan="3"></TD>
                                        </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            </TBODY>
                            <!--关于display属性-->
                            <TBODY style="DISPLAY: none">
                            <TR>
                                <TD vAlign=top align=middle>

                                </TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </td>
                    <td>&nbsp;</td>
                    <td valign="top">

                    </td>
                </tr>
                <tr>
                    <td height="40" colspan="4">
                        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>
        </td>
        <td background="images/mail_rightbg.gif">&nbsp;</td>
    </tr>
    <tr>
        <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17"
                                                                     height="17"/>
        </td>
        <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16"
                                                                      height="17"/></td>
    </tr>
</table>
</body>
