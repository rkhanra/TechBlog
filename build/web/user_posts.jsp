<%-- 
    Document   : user_posts
    Created on : 14 Jun 2024, 10:45:40 pm
    Author     : Rohit Khanra
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Posts</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        .card-text {
            height: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 5; /* number of lines to show */
            -webkit-box-orient: vertical;
        }
        .modal-dialog {
            max-width: 90%;
            width: 90%;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
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
                if (userPosts.size() > 0) {
        %>

        <h3 class="text-center mb-4">Posts by <%= username %> (User ID: <%= userIdString %>)</h3>
        <div class="row">
            <%
                for (Post post : userPosts) {
            %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <img class="card-img-top" src="blog_pics/<%= post.getpPic() %>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%= post.getpTitle() %></h5>
                        <p class="card-text"><%= post.getpContent() %></p>
                        <a href="#" class="btn btn-outline-primary" data-toggle="modal" data-target="#editPostModal<%= post.getPid() %>">Check</a>
                    </div>
                </div>
            </div>

            <!-- Modal for Editing Post -->
            <div class="modal fade" id="editPostModal<%= post.getPid() %>" tabindex="-1" role="dialog" aria-labelledby="editPostModalLabel<%= post.getPid() %>" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editPostModalLabel<%= post.getPid() %>">Edit Post</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="EditPostServlet" method="post">
                                <input type="hidden" name="postId" value="<%= post.getPid() %>">
                                <input type="hidden" name="userid" value="<%= userIdString %>">
                                <input type="hidden" name="username" value="<%= username %>">
                                <div class="form-group">
                                    <label for="postTitle<%= post.getPid() %>">Post Title</label>
                                    <input type="text" class="form-control" id="postTitle<%= post.getPid() %>" name="postTitle" value="<%= post.getpTitle() %>">
                                </div>
                                <div class="form-group">
                                    <label for="postContent<%= post.getPid() %>">Post Content</label>
                                    <textarea class="form-control" id="postContent<%= post.getPid() %>" name="postContent" rows="10"><%= post.getpContent() %></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Save changes</button>
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
