<%-- 
    Document   : contributors
    Created on : 07-Apr-2024, 10:41:54?pm
    Author     : Rohit Khanra
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title> Contrubuters </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body class="body">
    <h1>Our Contributors</h1>
    <input type="text" class="customSearchInput" id="searchInput" placeholder="Search User by Name" onkeyup="search()">
    <button class="btn" id="modeToggle">Toggle Mode</button>

    <%
        // Get the list of users
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        List<User> userList = userDao.getAllUsers();

    %>

    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>About</th>
                <th>Joined on</th>
                <th>Avatar</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <%                    if (userList != null && !userList.isEmpty()) {
                    for (User user : userList) {
            %>
            <tr>
                <td><%= user.getName()%></td>
<!--                    <td><%= user.getEmail()%></td>-->
                <td onclick="copyEmail('<%= user.getEmail()%>')"><%= user.getEmail()%></td>

                <td> <%= user.getAbout()%> </td>
                <td> <%= user.getDateTime()%> </td>
                <td>
                    <!-- Add onclick event to trigger modal -->
                    <img src="pics/<%= user.getProfile()%>"
                         class="avatar"
                         onclick="openModal('pics/<%= user.getProfile()%>')">
                </td>

            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No users found</td>
            </tr>
            <% }%>
        </tbody>


    </table>
    <!-- The Modal -->
    <div id="avatarModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <img id="modalImg" style="width:100%">
        </div>
    </div>
</body>
</html>

<!-- JavaScript function to copy email address to clipboard -->
<script>
    function copyEmail(email) {
        navigator.clipboard.writeText(email)
                .then(() => {
                    console.log('Email copied to clipboard: ' + email);
                    alert('Email copied to clipboard: ' + email);
                })
                .catch(err => {
                    console.error('Failed to copy email: ', err);
                });
    }
</script>
<!-- JavaScript for Toggle Mode Functionality -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const modeToggle = document.getElementById('modeToggle');
        const body = document.body;

        // Load user's preference from localStorage
        const currentMode = localStorage.getItem('theme') || 'light';
        body.classList.add(currentMode + '-mode');

// Function to update colors based on mode
        function updateColors(mode) {
            const modeToggle = document.getElementById('modeToggle');

            if (mode === 'dark') {
                body.classList.remove('light-mode');
                body.classList.add('dark-mode');
                modeToggle.textContent = 'Light Mode'; // Update button text
                modeToggle.style.backgroundColor = '#333333'; // Dark gray background for the mode toggle button
                modeToggle.style.color = '#ffffff'; // White text for the mode toggle button
            } else {
                body.classList.remove('dark-mode');
                body.classList.add('light-mode');
                modeToggle.textContent = 'Dark Mode'; // Update button text
                modeToggle.style.backgroundColor = '#ffffff'; // White background for the mode toggle button
                modeToggle.style.color = '#000000'; // Black text for the mode toggle button
            }
        }


        // Update colors based on initial mode
        updateColors(currentMode);

        // Function to toggle mode
        function toggleMode() {
            const newMode = body.classList.contains('dark-mode') ? 'light' : 'dark';
            localStorage.setItem('theme', newMode);
            updateColors(newMode);
            location.reload();
            console.log('New Mode:', newMode); // Log the new mode
        }

        // Event listener for mode toggle button
        modeToggle.addEventListener('click', toggleMode);
    });



    // Function to open modal with clicked avatar image
// Function to open modal with clicked avatar image
    function openModal(imageSrc) {
        var modal = document.getElementById('avatarModal');
        var modalImg = document.getElementById('modalImg');
        modal.style.display = "block";
        modalImg.src = imageSrc;
    }

// Function to close modal
    function closeModal() {
        var modal = document.getElementById('avatarModal');
        modal.style.display = "none";
    }

// Close modal when clicking outside of it
    window.onclick = function (event) {
        var modal = document.getElementById('avatarModal');
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }

</script>
<script>
    function search() {
        var input = document.getElementById('searchInput').value.toUpperCase();
        var table = document.getElementById('tableBody');
        var rows = table.getElementsByTagName('tr');
        var found = false;

        // If search input is empty, show all rows and exit the function
        if (input.trim() === '') {
            for (var i = 0; i < rows.length; i++) {
                rows[i].style.display = '';
            }
            return;
        }

        // Loop through all table rows, and hide those who don't match the search query
        for (var i = 0; i < rows.length; i++) {
            var name = rows[i].getElementsByTagName('td')[0];
            if (name) {
                var textValue = name.textContent || name.innerText;
                if (textValue.toUpperCase().indexOf(input) > -1) {
                    rows[i].style.display = '';
                    found = true;
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }

        // If no results found, show an alert
        if (!found) {
            alert('No matching results found.');
            // Show all rows
            for (var i = 0; i < rows.length; i++) {
                rows[i].style.display = '';
            }
        }
    }
</script>



<style>
    .body{
        background-color: #B7D6FF;
    }
    h1{
        text-align: center;
        padding: 10px;
        font-family: sans-serif;
    }
    /* Table style */
    table {
        width: 100%;
        border-collapse: collapse;
        overflow-x: auto;
        border: 1px solid black;
    }

    th, td {
        padding: 8px;
        text-align: left;

    }
    th {
        background-color: #8ABCFD;
        text-align: center;
        border: 1px solid black;
    }
    /* Avatar style */
    .avatar {
        border-radius: 50%;
        width: 30px;
        height: 30px;
        object-fit: cover;
    }
    tr, td{
        text-align: center;
        border: 1px solid black;

    }

    /* Modal style */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */

    }
    .modal-content {
        position: relative;
        margin: auto;
        width: 50%;
        max-width: 400px;
        background-color: #fefefe;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        animation-name: modalopen;
        animation-duration: 0.4s;
    }

    @keyframes modalopen {
        from {
            opacity: 0
        }
        to {
            opacity: 1
        }
    }

    .close {
        position: absolute;
        right: 10px;
        top: 5px;
        color: #aaa;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }


    /*    BLUR*/
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */
        backdrop-filter: blur(5px); /* Apply blur effect to the background */
    }

    .modal-content {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 50%;
        max-width: 400px;
        background-color: #fefefe;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        animation-name: modalopen;
        animation-duration: 0.4s;
    }

    @keyframes modalopen {
        from {
            opacity: 0
        }
        to {
            opacity: 1
        }
    }

    .close {
        position: absolute;
        right: 10px;
        top: 5px;
        color: #aaa;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }
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


    /* Dark Mode Styles */
    /* Dark Mode Styles */
    .body.dark-mode {
        background-color: #212121; /* Dark gray background */
        color: #ffffff; /* White text */
    }
    #modeToggle {
        background-color: #333333; /* Dark gray background for the mode toggle button */
        color: #ffffff; /* White text for the mode toggle button */
        border: 1px solid black;
    }
    table.dark-mode {
        border-color: white; /* White border for table in dark mode */
    }
    .dark-mode tr,
    .dark-mode td {
        background-color: #383838; /* Dark gray background for table header */
        color: #ffffff; /* White text for table cells */
    }
    .dark-mode .customSearchInput {
        background-color: #333333; /* Dark gray background for search input */
        color: #ffffff; /* White text for search input */
    }
    .dark-mode th{
        background-color: #212121;
    }
    .dark-mode .modal-content{
        background-color: #3A3A3A;
    }
    

</style>