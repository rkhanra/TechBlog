<%-- 
    Document   : reports
    Created on : 17 Jul 2024, 11:26:28 pm
    Author     : Rohit Khanra
--%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.ReportDao"%>
<%@page import="com.tech.blog.entities.Report"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Reports</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .body {
                background-color: #f8f9fa;
            }
            .card-body {
                background-color: #ffffff;
            }
            .message-content {
                height: 23vh; /* Set height to 23% of viewport height */
                overflow-y: auto; /* Add vertical scrollbar when content exceeds height */
                padding-right: 15px; /* Adjust for scrollbar width */
            }
            .message-content::-webkit-scrollbar {
                width: 5px;
            }
            .message-content::-webkit-scrollbar-thumb {
                background-color: #C0C0C0;
            }
            .modal-dialog {
                max-width: 90% !important; /* Set maximum width to 90% of viewport */
            }
        </style>
    </head>
    <body class="body">
        <div class="container">
            <h1 class="my-4">All Reports</h1>

            <%
                // Get the list of reports
                ReportDao reportDao = new ReportDao(ConnectionProvider.getConnection());
                List<Report> reportList = reportDao.getAllReports();
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            %>

            <div class="row">
                <% if (reportList != null && !reportList.isEmpty()) {
                        for (Report report : reportList) {
                %>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= report.getRname()%></h5>
                            <p class="card-text">
                                <strong>Email:</strong> <span><%= report.getRemail()%></span>
                            </p>
                            <div class="message-content">
                                <%= report.getMessage()%>
                            </div>
                            <!-- Button to trigger modal -->
                            <button type="button" class="btn btn-primary view-message-btn" data-toggle="modal" data-target="#messageModal" data-message="<%= report.getMessage().replaceAll("[\\r\\n]+", "<br>")%>">
                                View Full Message
                            </button>
                        </div>
                    </div>
                </div>

                <% }
                } else {
                %>
                <div class="col-12">
                    <div class="alert alert-warning text-center" role="alert">
                        No reports found.
                    </div>
                </div>
                <% }%>
            </div>
        </div>

        <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="messageModalLabel">Full Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="modalContent"></div> <!-- Content will be loaded here -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
<script
    src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        $('.view-message-btn').click(function () {
            var message = $(this).data('message');
            $('#modalContent').html(message);
        });
    });
</script>
