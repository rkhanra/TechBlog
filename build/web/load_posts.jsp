<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<style>
    /* Style for the input element */
    .customSearchInput {
        width: 300px; /* Adjust width as needed */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;

    }

    /* Optional: Style for the placeholder text */
    ::placeholder {
        color: #99; /* Adjust placeholder color */
    }

</style>

<input type="text" class="customSearchInput" id="searchInput" placeholder="Search Post by Name" onkeyup="search()">
<div class="row">

    <%

        User uuu = (User) session.getAttribute("currentUser");

        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
            return;
        }

        for (Post p : posts) {
    %>


    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top fixed-size-img"  style="overflow: hidden; object-fit: cover; width: auto; height: 150px" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">

            <div class="card-body" id="tableBody">
                <span>
                    <b><%= p.getpTitle()%></b>
                    <div style="border: 1px solid black"></div>

                    <!--STYLE FOR CONTAINER-->
                    <style>

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

                    <div class="container">
                        <div class="scrollbar" id="scrollbar1">

                            <p style="height: 50px"><%= p.getpContent()%></p>
                        </div>
                    </div>


                </span>
            </div>

            <div class="card-footer primary-background text-center">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>&user_id=<%= uuu.getId()%>" class="btn btn-outline-light btn-sm">Read More...</a>

                <!--                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span></span>  </a>-->
            </div>

        </div>


    </div>




    <%
        }
    %>

</div>

<script>
    function search() {
        var input = document.getElementById('searchInput').value.toUpperCase();
        var cards = document.getElementsByClassName('card');
        var found = false;
        var matchingCards = []; // Array to store matching cards

        // Loop through all cards, and hide those which do not match the search query
        for (var i = 0; i < cards.length; i++) {
            var title = cards[i].getElementsByTagName('b')[0];
            if (title) {
                var textValue = title.textContent || title.innerText;
                if (textValue.toUpperCase().indexOf(input) > -1) {
                    cards[i].style.display = ''; // Show card if it matches search query
                    found = true;
                    matchingCards.push(cards[i]); // Store matching card
                } else {
                    cards[i].style.display = 'none'; // Hide card if it doesn't match
                }
            }
        }

        // If no results found, show an alert
        if (!found) {
            alert('No matching results found.');
            // Show all cards
            for (var i = 0; i < cards.length; i++) {
                cards[i].style.display = ''; // Show all cards
            }
        } else {
            // Clear container before appending matching cards
            var container = document.getElementById('container');
            container.innerHTML = '';

            // Append matching cards to the container in order
            matchingCards.forEach(function(card) {
                container.appendChild(card);
            });
        }
    }
</script>

