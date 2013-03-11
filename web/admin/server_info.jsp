<%@ page language="java" import="java.util.HashMap" pageEncoding="GBK" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Properties" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Server Info</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
</head>
<body>
<%
    String SERVER_NAME = request.getServerName();
    String SERVER_SOFTWARE = getServletContext().getServerInfo();
    String SERVER_PROTOCOL = request.getProtocol();
    Integer SERVER_PORT = request.getServerPort();
    String REQUEST_METHOD = request.getMethod();
    String PATH_INFO = request.getPathInfo();
    String PATH_TRANSLATED = request.getPathTranslated();
    String SCRIPT_NAME = request.getServletPath();
    String DOCUMENT_ROOT = request.getRealPath("/");
    String QUERY_STRING = request.getQueryString();
    String REMOTE_HOST = request.getRemoteHost();
    String REMOTE_ADDR = request.getRemoteAddr();
    String AUTH_TYPE = request.getAuthType();
    String REMOTE_USER = request.getRemoteUser();
    String CONTENT_TYPE = request.getContentType();
    Integer CONTENT_LENGTH = request.getContentLength();
    String HTTP_ACCEPT = request.getHeader("Accept");
    String HTTP_USER_AGENT = request.getHeader("User-Agent");
    String HTTP_REFERER = request.getHeader("Referer");

    Properties props = System.getProperties(); //获得系统属性集
    String osName = props.getProperty("os.name"); //操作系统名称
    String osArch = props.getProperty("os.arch"); //操作系统构架
    String osVersion = props.getProperty("os.version"); //操作系统版本


    HashMap infoMap = new HashMap();

    infoMap.put("OSNAME", osName);
    infoMap.put("osArch", osArch);
    infoMap.put("osversion", osVersion);
    infoMap.put("SERVER_NAME", SERVER_NAME);
    infoMap.put("SERVER_SOFTWARE", SERVER_SOFTWARE);
    infoMap.put("SERVER_PROTOCOL", SERVER_PROTOCOL);
    infoMap.put("SERVER_PORT", SERVER_PORT);
    infoMap.put("REQUEST_METHOD", REQUEST_METHOD);
    infoMap.put("PATH_INFO", PATH_INFO);
    infoMap.put("PATH_TRANSLATED", PATH_TRANSLATED);
    infoMap.put("SCRIPT_NAME", SCRIPT_NAME);
    infoMap.put("DOCUMENT_ROOT", DOCUMENT_ROOT);
    infoMap.put("QUERY_STRING", QUERY_STRING);
    infoMap.put("REMOTE_HOST", REMOTE_HOST);
    infoMap.put("REMOTE_ADDR", REMOTE_ADDR);
    infoMap.put("AUTH_TYPE", AUTH_TYPE);
    infoMap.put("REMOTE_USER", REMOTE_USER);
    infoMap.put("CONTENT_TYPE", CONTENT_TYPE);
    infoMap.put("CONTENT_LENGTH", CONTENT_LENGTH);
    infoMap.put("HTTP_ACCEPT", HTTP_ACCEPT);
    infoMap.put("HTTP_USER_AGENT", HTTP_USER_AGENT);
    infoMap.put("HTTP_REFERER", HTTP_REFERER);
    Iterator it = infoMap.keySet().iterator();
%>
<table border="1">
    <%
        while (it.hasNext()) {
            Object o = it.next();
    %>
    <tr>
        <td>
                <%=o%>
        <td>
            <%=infoMap.get(o)%>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>