

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }


            /* Apply styles to the entire webpage scrollbar */
            body::-webkit-scrollbar {
                width: 12px;
            }

            body::-webkit-scrollbar-track {
                background-color: transparent;
                border: 1.5px solid #7e7e7e;
                border-radius: 8px;
            }

            body::-webkit-scrollbar-thumb {
                background-color: #f1f1f1;
                border: 2px solid #616161;
                border-radius: 8px;
            }
            .back{
                background-color: #E5E5E5;
            }
        </style>

    </head>
    <body class="back">     


        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--//banner-->

        <div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white banner-background" >
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>

                    <p>Welcome to technical blog, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>

                    <a class="btn btn-outline-light btn-lg" href="register_page.jsp"  > <span class="fa 	fa fa-user-plus"></span>  Start ! its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>

                </div>
            </div>






        </div>



        <!--//cards-->

        <div class="container">

            <div class="row mb-2">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.javatpoint.com/java-tutorial" target="_blank" class="btn primary-background text-white btn-outline-light "  >Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Javascript</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.geeksforgeeks.org/javascript/" target="_blank" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Fullstack Development</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.geeksforgeeks.org/what-is-full-stack-development/" target="_blank" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>


            </div>




            <div class="row">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Advance Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.geeksforgeeks.org/what-is-advanced-java/" target="_blank" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Database Design</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.geeksforgeeks.org/database-design-in-dbms/" target="_blank" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Web Development</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="https://www.geeksforgeeks.org/web-development/" target="_blank" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>


            </div>

        </div>
        <br><br>

        <span class="d-block p-2 bg-primary text-white text-center" style="opacity: 0.5" >Blog Preview</span>


        <div class="d-flex justify-content-center mt-5">
            <a href="#bottom" id="scrollButton" class="p-2  rounded text-center" >Check Oldest Blog &darr; </a>
        </div>
        <br><br>
        <!--        SHOW  BLOG  PREVIEW-->

        <%@include file="all_posts.jsp" %>


        <p class="text-center mt-5 mb-5">
            <a href="index.jsp" id="backToTop">Back to top &#8593;</a>
        </p>             

        <script>
            // Function to hide scroll buttons
            function hideScrollButtons() {
                document.getElementById("scrollButton").style.display = "none";
                document.getElementById("backToTop").style.display = "none";
            }

            // Check if "No Posts Available" message is displayed
            var noPostsMessage = "<h3 class=\"text-center\">No Posts Available</h3>";

            if (document.body.innerHTML.indexOf(noPostsMessage) !== -1) {
                hideScrollButtons();
            }
        </script>


        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <div id="bottom"></div>

    </body>
</html>
