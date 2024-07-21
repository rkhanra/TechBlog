package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        boolean result = postDao.deletePost(postId);

        response.setContentType("text/html");
        if (result) {
            response.getWriter().write("<script>alert('Post deleted successfully'); window.location.href = 'user_posts.jsp?userid=" + request.getParameter("userId") + "&username=" + request.getParameter("username") + "';</script>");
        } else {
            response.getWriter().write("<script>alert('Error deleting post'); window.location.href = 'user_posts.jsp?userid=" + request.getParameter("userId") + "&username=" + request.getParameter("username") + "';</script>");
        }
    }
}
