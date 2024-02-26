<%-- 
    Document   : myposts
    Created on : 13-Feb-2024, 10:59:04?am
    Author     : Rohit Khanra
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<style>
    .card {
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
    }

    .scrollbar {
        width: auto;
        overflow: auto;
    }

    #scrollbar1::-webkit-scrollbar {
        width: 3px;
    }

    #scrollbar1::-webkit-scrollbar-track {
        border-radius: 1px;
        background-color: #e7e7e7;
        border: 1px solid #cacaca;
    }

    #scrollbar1::-webkit-scrollbar-thumb {
        border-radius: 1px;
        background-color: #454548;
    }

</style>

<%
    // Retrieve the userid from the request parameter
    String userIdString = request.getParameter("userid");
    String username = request.getParameter("userName");

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

<!-- Display the username at the top of the webpage -->
<h2 class="text-center">Check your posts <p class="text-uppercase font-weight-bold"> <%= username%> </p></h2>

<div class="container-fluid" >
    <div class="row">
        <%
            for (Post post : userPosts) {
        %>
        <div class="col-lg-3 col-md-6 col-mb-4" style="width: 200px; height: auto;" >
            <div class="card shadow-lg p-3 mb-5 bg-white rounded d-flex flex-column" style="width: 75%; height: auto" >
                <!-- Card image -->
                <img class="card-img-top" style="overflow: hidden; object-fit: cover; width: auto; height: 100px;" src="blog_pics/<%= post.getpPic()%>" alt="Card image cap">

                <!-- Card body -->
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size: 15px"><%= post.getpTitle()%></h5>
                    <div class="dropdown-divider"></div>

                    <div class="container">
                        <!-- Scrollable content -->
                        <div class="scrollbar" id="scrollbar1">
                            <p  style="height: 75px"><%= post.getpContent()%></p>
                        </div>
                    </div>


                    <!-- Edit form -->
                    <!-- Add this form within the card body to edit and update post details --> 
                    <!--                    LATER WORK-->
                    <!--                    <form action="UpdatePostServlet" method="post" enctype="multipart/form-data">
                                            <div class="card-body">
                                                 Add hidden input field for post ID 
                                                <input type="hidden" name="postId" value="<%= post.getPid()%>">
                    
                                                 Title input field 
                                                <div class="form-group">
                                                    <label for="postTitle">Title:</label>
                                                    <input type="text" class="form-control" id="postTitle" name="postTitle" value="<%= post.getpTitle()%>" required>
                                                </div>
                    
                                                 Content input field 
                                                <div class="form-group">
                                                    <label for="postContent">Content:</label>
                                                    <textarea class="form-control" id="postContent" name="postContent" rows="3" required><%= post.getpContent()%></textarea>
                                                </div>
                    
                                                 Image input field 
                                                <div class="form-group">
                                                    <label for="postImage">Image:</label>
                                                    <input type="file" class="form-control-file" id="postImage" name="postImage">
                                                </div>
                    
                                                 Submit button to update post 
                                                <button type="submit" class="btn btn-success">Update Post</button>
                                            </div>
                                        </form>-->

                </div>
                <!-- Button to explore more -->
                <a href="show_blog_page.jsp?post_id=<%= post.getPid()%>" class="float-right mt-auto ml-auto ">Explore More</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<%
} else {
%>
<!-- Displayed if no posts are available for the specified userid -->
<div class="col-md-12">
    <h3 class="text-center">No Posts Available</h3>
</div>
<%
    }
} else {
%>
<!-- Displayed if userid is not provided in the URL -->
<div class="col-md-12">
    <h3 class="text-center">Invalid Request. Userid not provided.</h3>
</div>
<%
    }
%>
