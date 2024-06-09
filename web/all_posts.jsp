<%-- 
    Document   : all_posts
    Created on : 13-Feb-2024, 10:59:04?am
    Author     : Rohit Khanra
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Posts</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

        /* Dark mode styles */
        body.dark-mode {
            background-color: #212121;
            color: #fff;
        }

        .card.dark-mode {
            background-color: #333;
            color: #fff;
        }

        .card.dark-mode .card-title,
        .card.dark-mode .card-text {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 text-right">
<!--            <button id="mode-toggle-btn" class="btn btn-primary">Toggle Dark Mode</button>-->
        </div>
        <% // Get all posts
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());
            List<Post> allPosts = postDao.getAllPosts();
            // Check if there are posts
            if (allPosts.size() > 0) {
                for (Post post : allPosts) {
        %>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="card mb-4 shadow-lg p-3 mb-5 rounded d-flex flex-column">
                <img class="card-img-top" style="overflow: hidden; object-fit: cover; width: auto; height: 180px" src="blog_pics/<%= post.getpPic()%>" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><%= post.getpTitle()%></h5>
                    <div class="dropdown-divider"></div>
                    <div class="container">
                        <div class="scrollbar" id="scrollbar1">
                            <p class="card-text" style="height: 75px"><%= post.getpContent()%></p>
                        </div>
                    </div>
                </div>
                <a href="show_blog_page.jsp?post_id=<%= post.getPid()%>" class="primary-btn text-center">Explore More</a>
            </div>
        </div>
        <% }
            } else { %>
        <div class="col-md-12">
            <h3 class="text-center">No Posts Available</h3>
        </div>
        <% } %>
    </div>
</div>
<script>
    const modeToggleBtn = document.getElementById('mode-toggle-btn');
    const body = document.body;

    modeToggleBtn.addEventListener('click', () => {
        body.classList.toggle('dark-mode');
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.classList.toggle('dark-mode');
        });
    });
</script>
</body>
</html>
