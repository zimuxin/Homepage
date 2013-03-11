package org.lsx.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.lsx.dao.PhotoDao;
import org.lsx.entity.Photo;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        this.doPost(request, response);
    }

    public void doAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String str = request.getParameter("filename");
        if (null != str && !str.equals("")) {
            String albumId = request.getParameter("album");
            String describe = request.getParameter("describe");
            String filename = request.getParameter("filename");
            PhotoDao pd = new PhotoDao();
            Photo photo = new Photo();
            photo.setFilename(filename);
            photo.setDescribe(describe);
            photo.setAlbumId(Long.valueOf(albumId));
            PrintWriter out = response.getWriter();
            if (pd.add(photo)) {

                out.println("成功");

            } else {
                out.println("失败");
            }

        }
    }

    @SuppressWarnings("unchecked")
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        //
        String str = request.getParameter("filename");
        if (null != str && !str.equals("")) {
            String albumId = request.getParameter("album");
            String describe = request.getParameter("describe");
            String filename = request.getParameter("filename");
            PhotoDao pd = new PhotoDao();
            Photo photo = new Photo();
            photo.setFilename(filename);
            photo.setDescribe(describe);
            photo.setAlbumId(Long.valueOf(albumId));
            PrintWriter out = response.getWriter();
            boolean i = pd.add(photo);
            if (i) {

                out.println("成功");

            } else {
                out.println("失败");
            }

        }


        // 采用apache工具包进行文件上传操作
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> fileitems = upload.parseRequest(request);

            //
            String albumId = "";
            String describe = "";
            String filename1 = "";

            //
            for (FileItem item : fileitems) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equals("album")) {
                        albumId = value;
                    } else if (name.equals("describe")) {
                        describe = value;
                    }
                    // 转换下字符集编码
                    value = new String(value.getBytes("iso-8859-1"), "utf-8");
                    System.out.println(name + "=" + value);
                } else {
                    String filename = item.getName();
                    filename1 = filename;
                    PhotoDao pd = new PhotoDao();
                    Photo photo = new Photo();
                    photo.setFilename(filename);
                    photo.setDescribe(describe);
                    photo.setAlbumId(Long.valueOf(albumId));
                    boolean r = pd.add(photo);
                    response.setCharacterEncoding("utf-8");
                    PrintWriter out = response.getWriter();
                    if (r) {
                        request.setAttribute("msg","上传成功");
                        //response.sendRedirect("/admin/jsp/photo_add.jsp?");
                        out.print("<script>alert('ok,上传成功！');window.location.href='/admin/jsp/photo_add.jsp'</script>");
                    } else {
                        request.setAttribute("msg","上传失败");
                       // response.sendRedirect("/admin/jsp/photo_add.jsp");
                        out.print("<script>alert('上传失败');window.location.href='/admin/jsp/photo_add.jsp'</script>");
                    }
                    out.flush();out.close();

                    //System.out.println(filename);
                    ServletContext context = getServletContext();

                    // 上传的文件存放路径为...\\WebRoot\\upload\\filename
                    String dir = context.getRealPath("/resources/image/photo");
                    System.out.println("上传的文件位置:" + dir+"/" + filename);
                    File file = new File(dir, filename);
                    System.out.println(file.getAbsoluteFile().toString());

                    file.createNewFile();

                    // 获得流，读取数据写入文件
                    InputStream in = item.getInputStream();
                    FileOutputStream fos = new FileOutputStream(file);

                    int len;
                    byte[] buffer = new byte[1024];
                    while ((len = in.read(buffer)) > 0)
                        fos.write(buffer, 0, len);

                    // 关闭资源文件操作
                    fos.close();
                    in.close();
                    // 删除临时文件
                    item.delete();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}