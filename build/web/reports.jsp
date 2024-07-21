<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.dao.ReportDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Report" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <style>
        .custom-container {
            padding: 10px !important;
            margin-left: auto;
            margin-right: auto;
            transition: width 0.5s;
        }
    </style>
    <script>
        function confirmDeletion(reportId) {
            if (confirm("Are you sure you want to delete this report?")) {
                document.getElementById('deleteReportId').value = reportId;
                document.getElementById('reportsForm').submit();
            }
        }

        function adjustContainerWidth() {
            var table = document.querySelector('.table');
            var container = document.querySelector('.custom-container');
            if (table) {
                var tableWidth = table.offsetWidth;
                container.style.width = tableWidth + 'px';
            }
        }

        window.onload = adjustContainerWidth;
        window.onresize = adjustContainerWidth;
    </script>
</head>
<body>
    <div class="container custom-container">
        <h1>Reports</h1>
        <form id="reportsForm" action="UpdateReportServlet" method="post">
            <input type="hidden" id="deleteReportId" name="deleteReportId" value="">
            <%
                ReportDao dao = new ReportDao(ConnectionProvider.getConnection());
                List<Report> reports = dao.getAllReports();
                if (reports.isEmpty()) {
            %>
                <div class="alert alert-info" role="alert">
                    No reports found.
                </div>
            <%
                } else {
            %>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Date</th>
                        <th>Processed</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Report report : reports) {
                    %>
                    <tr>
                        <td><input type="checkbox" name="reportIds" value="<%= report.getId() %>" <%= report.isProcessed() ? "checked" : "" %>></td>
                        <td><%= report.getId() %></td>
                        <td><%= report.getRname() %></td>
                        <td><a href="mailto:<%= report.getRemail() %>?subject=Regarding your report&body=Hi <%= report.getRname() %>,%0D%0A%0D%0A"><%= report.getRemail() %></a></td>
                        <td><%= report.getMessage() %></td>
                        <td><%= report.getRdate() %></td>
                        <td><%= report.isProcessed() ? "Yes" : "No" %></td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="confirmDeletion(<%= report.getId() %>)">Delete</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <button type="submit" class="btn btn-primary">Update Status</button>
            <%
                }
            %>
        </form>
        <%
            String statusMessage = (String) request.getSession().getAttribute("statusMessage");
            if (statusMessage != null) {
                request.getSession().removeAttribute("statusMessage");
        %>
        <div class="alert alert-info" role="alert">
            <%= statusMessage %>
        </div>
        <% } %>
    </div>
</body>
</html>
