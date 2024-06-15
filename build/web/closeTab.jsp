<%-- 
    Document   : closeTab
    Created on : 15 Jun 2024, 6:26:03 pm
    Author     : Rohit Khanra
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <script type="text/javascript">
        // Close the browser tab using JavaScript
        window.onload = function() {
            // Trying to close the tab
            window.open('', '_self').close();
        };

        // Function to block arrow key navigation
        function blockNavigation(event) {
            const keyCode = event.keyCode || event.which;
            if ([37, 38, 39, 40].includes(keyCode)) { // Arrow keys: 37=Left, 38=Up, 39=Right, 40=Down
                event.preventDefault();
            }
        }

        // Add event listener to block arrow key navigation
        document.addEventListener('keydown', blockNavigation);

        // Prevent the default back navigation behavior
        window.addEventListener('popstate', function(event) {
            history.pushState(null, null, document.URL);
        });

        // Push an initial state to the history
        history.pushState(null, null, document.URL);
    </script>
</head>
<body>
    <h1>Logging out...</h1>
    <p>If the tab does not close automatically, please close it manually.</p>
</body>
</html>
