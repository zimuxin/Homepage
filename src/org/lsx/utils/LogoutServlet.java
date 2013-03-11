package org.lsx.utils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/11/13
 * Time: 2:43 PM
 * To change this template use File | Settings | File Templates.
 */
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletContext().removeAttribute("user");
        PrintWriter out = resp.getWriter();
        out.print("<script>self.parent.location.href='index.jsp'</script>");
        out.flush();
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
