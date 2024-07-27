package com.tech.blog.servlets;

import com.tech.blog.dao.ReportDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateReportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReportDao dao = new ReportDao(ConnectionProvider.getConnection());

        // Handle marking reports as processed
        String[] reportIds = request.getParameterValues("reportIds");
        if (reportIds != null) {
            for (String reportId : reportIds) {
                int id = Integer.parseInt(reportId);
                dao.markReportAsProcessed(id);
            }
        }

        // Handle deletion if deleteReportId is present
        String deleteReportId = request.getParameter("deleteReportId");
        if (deleteReportId != null && !deleteReportId.isEmpty()) {
            int id = Integer.parseInt(deleteReportId);
            boolean deleted = dao.deleteReportById(id);
            if (deleted) {
                request.getSession().setAttribute("statusMessage", "Report deleted successfully.");
            } else {
                request.getSession().setAttribute("statusMessage", "Failed to delete report.");
            }
        } else {
            if (reportIds != null) {
                request.getSession().setAttribute("statusMessage", "Reports updated successfully.");
            }
        }

        // Set the session attribute to prevent redirect to error_page.jsp
        request.getSession().setAttribute("fromAdmin", "true");

        response.sendRedirect("reports.jsp");
    }
}
