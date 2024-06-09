package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            String fileName = part.getSubmittedFileName();
            if (fileName == null || fileName.isEmpty()) {
                fileName = "default.jpg";
            } else {
                // Check if a picture with the same base name exists
                String picBaseName = fileName.substring(0, fileName.lastIndexOf('.'));
                File dir = new File(request.getRealPath("/") + "blog_pics");
                File[] matchingFiles = dir.listFiles((d, name) -> name.startsWith(picBaseName));

                if (matchingFiles != null && matchingFiles.length > 0) {
                    // Rename the file if a match is found
                    fileName = generateUniqueName(fileName);
                }
            }

            Post p = new Post(pTitle, pContent, pCode, fileName, null, cid, user.getId());
            PostDao dao = new PostDao(ConnectionProvider.getConnection());

            boolean postSaved = dao.savePost(p);
            if (postSaved) {
                if (!fileName.equals("default.jpg")) {
                    String path = request.getRealPath("/") + "blog_pics" + File.separator + fileName;
                    if (!Helper.saveFile(part.getInputStream(), path)) {
                        out.println("error: could not save file");
                        return;
                    }
                }
                out.println("done");
            } else {
                out.println("error: could not save post");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("error: an exception occurred");
        }
    }

    private String generateUniqueName(String fileName) {
        long timestamp = System.currentTimeMillis();
        String fileExtension = fileName.substring(fileName.lastIndexOf('.'));
        String fileNameWithoutExt = fileName.substring(0, fileName.lastIndexOf('.'));
        return fileNameWithoutExt + "_" + timestamp + fileExtension;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "AddPostServlet handles adding new blog posts";
    }
}
