<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page errorPage="error_page.jsp" %>
<%
    Boolean accessAllowed = (Boolean) session.getAttribute("accessAllowed");

    if (accessAllowed == null || !accessAllowed) {
        String fromAdmin = (String) session.getAttribute("fromAdmin");

        if (fromAdmin == null || !"true".equals(fromAdmin)) {
            response.sendRedirect("error_page.jsp");
            return;
        }

        // Remove the session attribute to prevent reuse
        session.removeAttribute("fromAdmin");

        // Set accessAllowed flag in session
        session.setAttribute("accessAllowed", true);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Posts</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="js/admin.js" type="text/javascript"></script>
        <style>
            .card {
                margin: 10px;
            }
            .card img {
                height: 200px;
                object-fit: cover;
            }
            .card-body {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .card-content {
                height: 100px; /* Adjust the height of the content area */
                overflow-y: auto; /* Enable vertical scrollbar */
            }
            .modal-dialog {
                max-width: 90%;
                width: 90%;
            }
            .scrollbar::-webkit-scrollbar {
                width: 5px; /* Width of the scrollbar */
            }
            .scrollbar::-webkit-scrollbar-track {
                background-color: #f1f1f1; /* Track color */
            }
            .scrollbar::-webkit-scrollbar-thumb {
                background-color: #888; /* Thumb color */
                border-radius: 5px; /* Rounded corners */
            }
            /* New CSS rule for the sticky back button */
            .back-button-container {
                position: sticky;
                top: 10px; /* Adjusted value */
                left: 10px; /* Adjusted value */
                z-index: 1000; /* Ensure it stays on top */
                margin: 10px;
            }
        </style>
        <script>
            function confirmDelete(postId) {
                if (confirm("Are you sure you want to delete this post?")) {
                    document.getElementById('deleteForm' + postId).submit();
                }
            }
        </script>
    </head>
    <body>
        <!-- Sticky Back button to navigate to admin page -->
        <div class="back-button-container">
            <a href="admin.jsp" class="btn btn-outline-secondary">Back to Admin Page</a>
        </div>
        <div class="container">
            <%
                // Retrieve the userid and username from the request parameter
                String userIdString = request.getParameter("userid");
                String username = request.getParameter("username");

                // Check if userid is not null
                if (userIdString != null && !userIdString.isEmpty()) {
                    // Convert userIdString to int
                    int userId = Integer.parseInt(userIdString);

                    // Fetch posts associated with the given userid
                    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                    List<Post> userPosts = postDao.getPostsByUserId(userId);

                    // Check if there are posts
                    int postCount = userPosts.size();
                    if (postCount > 0) {
            %>

            <h3 class="text-center mb-4">Posts by <%= username%> (User ID: <%= userIdString%>)</h3>
            <p class="text-center">Number of Posts: <%= postCount%></p>
            <div class="row">
                <%
                    for (Post post : userPosts) {
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card" id="dark">
                        <img class="card-img-top" src="blog_pics/<%= post.getpPic()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= post.getpTitle()%></h5>
                            <div class="card-content scrollbar">
                                <p class="card-text"><%= post.getpContent()%></p>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <a href="#" class="btn btn-outline-primary" data-toggle="modal" data-target="#editPostModal<%= post.getPid()%>">Check</a>
                                <form id="deleteForm<%= post.getPid()%>" action="DeletePostServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="postId" value="<%= post.getPid()%>">
                                    <input type="hidden" name="userId" value="<%= userIdString%>">
                                    <input type="hidden" name="username" value="<%= username%>">
                                    <button type="button" class="btn btn-outline-danger ml-2" onclick="confirmDelete(<%= post.getPid()%>)">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal for Editing Post -->
                <div class="modal fade" id="editPostModal<%= post.getPid()%>" tabindex="-1" role="dialog" aria-labelledby="editPostModalLabel<%= post.getPid()%>" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content" id="dark">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editPostModalLabel<%= post.getPid()%>">Edit Post</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="EditPostServlet" method="post">
                                    <input type="hidden" name="postId" value="<%= post.getPid()%>">
                                    <input type="hidden" name="userId" value="<%= userIdString%>">
                                    <input type="hidden" name="username" value="<%= username%>">
                                    <div class="form-group">
                                        <label for="postTitle<%= post.getPid()%>">Post Title</label>
                                        <input type="text" class="form-control" id="postTitle<%= post.getPid()%>" name="postTitle" value="<%= post.getpTitle()%>">
                                    </div>
                                    <div class="form-group formscroll">
                                        <label for="postContent<%= post.getPid()%>">Post Content</label>
                                        <textarea class="form-control" id="postContent<%= post.getPid()%>" name="postContent" rows="10"><%= post.getpContent()%></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-outline-primary">Save changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
            } else {
            %>
            <h3 class="text-center">No Posts Available</h3>
            <%
                }
            } else {
            %>
            <h3 class="text-center">Invalid Request. User ID not provided.</h3>
            <%
                }
            %>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-/bQdsTh/eiA7gyF5q6yYd06t92U7SEe1K/Iz6eJBuZXjk+3gG8jFw5y6Tktv65p6" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
