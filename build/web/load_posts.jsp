<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

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
            <div class="card-body">
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