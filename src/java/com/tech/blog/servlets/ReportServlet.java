/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.ReportDao;
import com.tech.blog.entities.Report;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rohit Khanra
 */
public class ReportServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String rname = request.getParameter("rname");
            String remail = request.getParameter("remail");
            String message = request.getParameter("message");

            Report report = new Report(rname, remail, message);

            //create a user daao object..
            ReportDao dao = new ReportDao(ConnectionProvider.getConnection());

            if (dao.saveReport(report)) {
//                save..
                out.println("done");
                out.println("<div id=\"timer\"></div>"); // Add the timer div
                out.println("<script>");
                out.println("var countdownTime = 10;");
                out.println("function updateTimer() {");
                out.println("var timerElement = document.getElementById('timer');");
                out.println("timerElement.innerText = 'Redirecting in ' + countdownTime + ' seconds';");
                out.println("countdownTime--;");
                out.println("if (countdownTime < 0) {");
                out.println("clearInterval(timerInterval);");
                out.println("timerElement.innerText = 'Redirecting...';"); // or any other final message
                out.println("// Redirect code can be added here");
                out.println("}");
                out.println("}");
                out.println("updateTimer();");
                out.println("var timerInterval = setInterval(updateTimer, 1000);");
                out.println("</script>");
                response.setHeader("Refresh", "10;url=login_page.jsp"); // Redirect after 10 seconds

            } else {
                out.println("error");
                out.println(" Reporting failed redirecting in 10seconds ");
                response.setHeader("Refresh", "10;url=error_page.jsp"); // Redirect after 10 seconds

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
