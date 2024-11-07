<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>An error occurred</h2>
        <p><%= request.getAttribute("error") %></p>
        <a href="home.jsp">Go back to Home</a>
    </div>
</body>
</html>
