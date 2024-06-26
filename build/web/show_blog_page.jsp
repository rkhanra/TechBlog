<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0"
    nonce="TyEv0YD8"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= p.getpTitle()%> || by <%= user.getName()%> </title>

    <script async src="https://talk.hyvor.com/embed/embed.js" type="module"></script>

    <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>

        .post-title{
            font-weight: 100;
            font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;

        }
        .post-date{
            font-style: italic;
            font-weight: bold;
        }
        .post-user-info{
            font-size: 20px;

        }


        .row-user{
            border:1px solid #e2e2e2;
            padding-top: 15px;
        }

        body {
            background: url(img/bg.jpeg);
            background-size: cover;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            /* Ensure the body takes at least the full height of the viewport */
        }


        .comment {
            background-color: #B0B9B4;

            padding: 15px;
            margin-top: auto;
            /* Push the footer to the bottom of the container */
            text-align: center;
            /* Center-align the content within the footer */
            z-index: 1;
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

        /*            PROGRESS BAR*/
        body,
        html {
            margin: 0;
            padding: 0;
            height: 100%;
            position: relative;
        }

        .progress-container {
            width: 100%;
            /* Adjust as needed */
            position: fixed;
            top: 0;
            background-color: #d2d1d1;
            z-index:99;
            display: none;
        }

        .progress-bar {
            height: 5px;
            /* Adjust as needed */
            color: red;
            background-color: #749597;
            width: 100%;
            z-index:99;
        }

        .modal-blur {
            backdrop-filter: blur(5px);
            background-color: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
        }

        /*          COPY CODE BUTTON*/
        .post-code {
            position: relative;
        }
        #copyCodeButton {
            font-size: 14px;
            position: absolute;
            transform: translateY(-50%);
            right: 10px;
        }
        .img{
            object-fit: contain;
            height: 25%;
            width: 100%
        }
        /*        LIGHT AND DARK MODE*/
        #navbar{
            background-color: #0f77ff;
        }
        .dark-mode #navbar{
            background-color: #1A1A1A;
        }
        .card-header{
            background-color: #0f77ff;
        }
        .card-footerr {
            background-color: #0f77ff;
        }
        .modal-header{
            background-color: #0f77ff;
        }
        .dark-mode .card-footerr, .dark-mode .modal-header{
            background-color: #212121;
        }
        .dark-mode .card-header{
            background-color: #212121;
        }
        .dark-mode .card {
            background-color: #333;
            color: #fff;
        }

        .card.dark-mode .card-title,
        .card.dark-mode .card-text {
            color: #fff;
        }
        .dark-mode #codeContent{
            color: white;
        }
        .modal-content.dark-mode {
            background-color: #333;
            color: #fff;
        }
        .dark-mode #dark {
            background-color: #333;
            color: #fff;
        }
        .dark-mode #darkpass{
            background-color: #333333;
            color: #ffffff;
        }
        .dark-mode input[type=file]::file-selector-button{
            background-color: #333;
            color: #fff;
        }
        body.dark-mode {
            background-color: #212121;
            color: #fff;
            background:url(img/dbg.jpg);
            background-size: cover;
            background-attachment: fixed;
        }
        .dark-mode .btn {
            background-color: #333;
            color: white;
            border: 1px solid #0f77ff;
        }
        .dark-mode #noDataMessage{
            color: white;
        }
        #card {
            max-width: 95%;
            width: 90%;
        }
        #post-image{
            height: 500px;
            object-fit: cover;
        }
    </style>



</head>
<body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0" nonce="mVRWTEas"></script>

    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0" nonce="PxiZNLAZ"></script>

    <!--navbar--> 

    <nav class="navbar navbar-expand-lg navbar-dark" id="navbar">
        <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <!--                <li class="nav-item active">
                                    <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell-o"></span> Code with Pain <span class="sr-only">(current)</span></a>
                                </li>-->

                <!--                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="	fa fa-check-square-o"></span> Categories
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" target="_blank" href="programming_languages.jsp">Programming Language</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" target="_blank" href="https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/">Data Structure</a>
                                    </div>
                                </li>-->

                <li class="nav-item active">
                    <a class="nav-link" href="contact.jsp"> <span class="	fa fa-address-card-o"></span> Contact</a>
                </li>

                <!--                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                                </li>-->
                <li class="nav-itemk"> 
                    <a id="mode-toggle-btn" class="nav-link">Toggle Theme</a>
                </li>



            </ul>

            <ul class="navbar-nav mr-right">

                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">  <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;width: 30px; height: 30px; object-fit: cover;  " >&nbsp; <%= user.getName()%> </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="progress-container">
        <div class="progress-bar" id="myBar"></div>
    </div>

    <!--//banner-->
    <div class="content">
        <!--end of navbar-->

        <!--main content of body-->
        <div class="container" >

            <div class="row my-4">

                <!--                <div class="col-md-8 offset-md-2">-->


                <div class="card" id="card">

                    <div class="card-header text-white">

                        <h4 class="post-title text-center"><%= p.getpTitle()%></h4>


                    </div>

                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" id="post-image" ">
                        <a href="blog_pics/<%= p.getpPic()%>" download="image.jpg" class="download-button" title="Download Image" id="download-image" >
                            <i class="fa fa-download" id="download-Icon">Download</i>
                        </a>



                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : </p>
                            </div>

                            <div class="col-md-4">
                                <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                            </div>
                        </div>


                    <div class="post-content" id="post-content"><%= p.getpContent() %></div>

                        <br>
                        <p class="dropdown-divider"> </p>
                        <p class="text-center">code</p>
                        <p class="dropdown-divider"> </p>

                        <div class="post-code" style="position: relative;">
                            <button id="copyCodeButton" class="fa fa-copy" style="font-size:14px; display: none; " title="Click to copy" ></button>
                            <span> <br> </span>

<!--                       <pre><%= p.getpCode()%> </pre>
                             <pre>No Data available</pre>-->
                            <!-- Original HTML -->
                            <pre id="codeContent" style="display: none;"><%= p.getpCode()%></pre>
                            <pre id="noDataMessage">No Data available</pre>


                        </div>


                    </div>
                    <div class="card-footerr" > 


                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        %>

                        <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i>
                            <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                        <!--                        <a href="" class="btn btn-outline-light btn-sm"  > <i class="fa fa-commenting-o"></i>   </a>-->

                        <span style="position: absolute; left: 46%; font-weight: bolder;">comments</span>
                    </div>

                    <div class="card-footer">
                        <!-- HYVOR TALK COMMENTS  Facebook Comments Plugin -->
                        <hyvor-talk-comments website-id="11178" page-id="<%= p.getPid()%>" ></hyvor-talk-comments>
                        <!--                        <span> Please mention Post Title while commenting || eg Post name : name </span>
                                                <div class="fb-comments" data-href="http://127.0.0.1:5500/index%20(2).html" data-numposts="5"></div>-->
                        <!--        <div class="fb-comments" data-href="http://localhost:8090/TechBlog/show_blog_page.jsp?post_id=32" data-numposts="5"></div>-->
                    </div>


                </div>


                <!--                </div>-->

            </div>

        </div>






        <!--end of main content  of body-->  


        <!-- Profile Picture Modal -->
        <div class="modal fade modal-blur" id="profile-pic-modal" tabindex="-1" role="dialog" aria-labelledby="profilePicModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" class="modal-dialog d-flex justify-content-center align-items-center">
                <div class="modal-content"> 
                    <div class="modal-header ">
                        <h5 class="modal-title mx-auto" id="profilePicModalLabel"><%= user.getName()%></h5>
                        <!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>-->
                    </div>
                    <div class="modal-body">
                        <img id="profile-pic" src="" class="img-fluid" alt="Profile Picture">
                    </div>
                </div>
            </div>
        </div>


        <!--profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <span class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">
                                <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; width:200px; height: 200px; object-fit: cover;" id="profile-pic-thumbnail" >
                                <br>
                                <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            </span>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" id="dark" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" id="dark" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" id="darkpass" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                            <td> <i onclick="passwordReveal()" class="fa fa-eye"> </i> </td> 
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" id="dark" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" id="dark" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

        <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" id="dark" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" id="dark" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" id="dark" class="form-control" style="height: 200px;" placeholder="Enter your content. Kindly use <br> for new line"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" id="dark" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>
    </div>

    <!--END add post modal-->


    <!--javascripts-->
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>



    <script>



                                                $(document).ready(function () {
                                                    let editStatus = false;

                                                    $('#edit-profile-button').click(function ()
                                                    {

                                                        if (editStatus == false)
                                                        {
                                                            $("#profile-details").hide()

                                                            $("#profile-edit").show();
                                                            editStatus = true;
                                                            $(this).text("Back")
                                                        } else
                                                        {
                                                            $("#profile-details").show()

                                                            $("#profile-edit").hide();
                                                            editStatus = false;
                                                            $(this).text("Edit")

                                                        }


                                                    })
                                                });

    </script>
    <!--now add post js-->
    <script>
        $(document).ready(function (e) {
            //
            $("#add-post-form").on("submit", function (event) {
                //this code gets called when form is submitted....
                event.preventDefault();
                console.log("you have clicked on submit..")
                let form = new FormData(this);

                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success ..
                        console.log(data);
                        if (data.trim() == 'done')
                        {
                            swal("Good job!", "saved successfully", "success");
                        } else
                        {
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error..
                        swal("Error!!", "Something went wrong try again...", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        })

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
    <script>
        // JavaScript to handle profile picture modal
        $(document).ready(function () {
            // When clicking on the profile picture thumbnail, show the full-size picture in the modal
            $('#profile-pic-thumbnail').on('click', function () {
                var profilePicUrl = $(this).attr('src');
                $('#profile-pic').attr('src', profilePicUrl);
                $('#profile-pic-modal').modal('show');
            });
        });

        // JavaScript to handle background blur effect
        $(document).ready(function () {
            // When the profile picture modal is shown
            $('#profile-pic-modal').on('show.bs.modal', function () {
                // Add the 'modal-blur' class to the body
                $('body').addClass('modal-blur');
            });

            // When the profile picture modal is hidden
            $('#profile-pic-modal').on('hidden.bs.modal', function () {
                // Remove the 'modal-blur' class from the body
                $('body').removeClass('modal-blur');
            });
        });
    </script>

    <!--    COPY CODE SCRIPT-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Get the pre tag
            var codePre = document.querySelector(".post-code pre");
            // Get the copy button
            var copyButton = document.getElementById("copyCodeButton");

            // Check if pre tag has content
            if (codePre.textContent.trim() !== "") {
                // Show the copy button
                copyButton.style.display = "inline";
            }

            // Add click event listener to copy button
            copyButton.addEventListener("click", function () {
                // Select the content inside the pre tag
                var code = codePre.textContent;
                // Create a temporary textarea element
                var textarea = document.createElement("textarea");
                // Set the textarea value to the code
                textarea.value = code;
                // Append the textarea to the document body
                document.body.appendChild(textarea);
                // Select the textarea content
                textarea.select();
                // Copy the selected content
                document.execCommand("copy");
                // Remove the temporary textarea
                document.body.removeChild(textarea);
                // Change button text to indicate copied
                copyButton.innerText = "Copied!";
                // Reset button text after 1 second
                setTimeout(function () {
                    copyButton.innerText = "";
                }, 1000);
            });

            // Show or hide copy button based on pre tag content
            codePre.addEventListener("input", function () {
                if (codePre.textContent.trim() !== "") {
                    copyButton.style.display = "inline";
                } else {
                    copyButton.style.display = "none";

                }
            });
        });
    </script>
    <!-- code block conditional rendering -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var codeContentPre = document.getElementById("codeContent");
            var noDataMessagePre = document.getElementById("noDataMessage");
            var code = codeContentPre.textContent.trim();

            if (code !== "") {
                // Content exists, display the first <pre> block
                codeContentPre.style.display = "block";
                // Hide the second <pre> block
                noDataMessagePre.style.display = "none";
            } else {
                // No content, hide the first <pre> block
                codeContentPre.style.display = "none";
                // Display the second <pre> block
                noDataMessagePre.style.display = "block";
            }
        });
    </script>
    <!--    light and dark mode-->
    <script>
        document.addEventListener('DOMContentLoaded', (event) => {
            const body = document.body;
            const navbar = document.querySelector('.navbar');
            const listGroupItems = document.querySelectorAll('.list-group-item');
            const modalContent = document.querySelectorAll('.modal-content');
            const formControls = document.querySelectorAll('.form-control');
            const btnOutlinePrimary = document.querySelectorAll('.btn-outline-primary');
            const modeToggleBtn = document.getElementById('mode-toggle-btn'); // Get the mode toggle button

            // Apply dark mode if it was previously enabled
            if (localStorage.getItem('theme') === 'dark') {
                enableDarkMode();
            } else {
                disableDarkMode(); // Ensures the correct mode is applied if the value is 'light'
            }

            function enableDarkMode() {
                body.classList.add('dark-mode');
                navbar.classList.add('dark-mode');
                listGroupItems.forEach(item => item.classList.add('dark-mode'));
                modalContent.forEach(item => item.classList.add('dark-mode'));
                formControls.forEach(item => item.classList.add('dark-mode'));
                btnOutlinePrimary.forEach(item => item.classList.add('dark-mode'));
                modeToggleBtn.innerText = 'Light Mode'; // Change button text to Light Mode

                localStorage.setItem('theme', 'dark');
            }

            function disableDarkMode() {
                body.classList.remove('dark-mode');
                navbar.classList.remove('dark-mode');
                listGroupItems.forEach(item => item.classList.remove('dark-mode'));
                modalContent.forEach(item => item.classList.remove('dark-mode'));
                formControls.forEach(item => item.classList.remove('dark-mode'));
                btnOutlinePrimary.forEach(item => item.classList.remove('dark-mode'));
                modeToggleBtn.innerText = 'Dark Mode'; // Change button text to Dark Mode

                localStorage.setItem('theme', 'light');
            }

            document.getElementById('mode-toggle-btn').addEventListener('click', () => {
                if (body.classList.contains('dark-mode')) {
                    disableDarkMode();
                } else {
                    enableDarkMode();
                }
            });
        });



        //show password
        function passwordReveal() {
            var x = document.getElementById("darkpass");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
//        displaying content of links in post
        document.addEventListener("DOMContentLoaded", function () {
            const contentElement = document.getElementById('post-content');
            let contentHTML = contentElement.innerHTML;

            const urlRegex = /(https?:\/\/[^\s]+)/g;
            contentHTML = contentHTML.replace(urlRegex, function(url) {
                if (url.includes('youtube.com') || url.includes('youtu.be')) {
                    let videoId = url.split('v=')[1] || url.split('/')[3];
                    return '<iframe width="100%" height="500px" src="https://www.youtube.com/embed/' + videoId + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
                } else if (url.includes('vimeo.com')) {
                    let videoId = url.split('.com/')[1];
                    return '<iframe src="https://player.vimeo.com/video/' + videoId + '" width="100%" height="500px" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>';
                } else {
                    return '<iframe src="' + url + '" width="100%" height="500px" frameborder="0" class="dynamic-iframe"></iframe>';
                }
            });

            contentElement.innerHTML = contentHTML;
        });
    </script>


</body>
</html>
