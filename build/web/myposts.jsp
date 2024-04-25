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

    .scrollbarr {
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


    /*            PROGRESS BAR*/
    body,
    html {
        margin: 0;
        padding: 0;
        height: 100%;
        position: relative;
        background-color: hsla(105, 2%, 60%);
        
    }

    .progress-container {
        width: 100%;
        /* Adjust as needed */
        position: fixed;
        top: 0;
        background-color: #929191;
        z-index:99;
        display: none;
    }

    .progress-bar {
        height: 5px;
        /* Adjust as needed */
        color: red;
        background-color: #FCECC5;
        width: 100%;
        z-index:99;
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

<!--PROGRESS BAR-->
<div class="progress-container">
    <div class="progress-bar" id="myBar"></div>
</div>

<!--//banner-->
<div class="content">

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

                            <!-- Scrollable content -->
                            <div class=" scrollbarr" id="scrollbar1">
                                <p  style="height: 75px"><%= post.getpContent()%></p>
                            </div>

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

</div>

<!-- comment -->

<script>
    window.onscroll = function () {
        myFunction()
    };

    function myFunction() {
        var winScroll = document.documentElement.scrollTop || document.body.scrollTop;
        var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        var scrolled = (winScroll / height) * 100;
        var progressBar = document.querySelector('.progress-bar');
        if (scrolled > 0) {
            // If scrolled down, show progress bar
            document.querySelector('.progress-container').style.display = "block";
            progressBar.style.width = scrolled + "%";
        } else {
            // If at the top, hide progress bar
            document.querySelector('.progress-container').style.display = "none";
        }
    }
</script>