<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background-image: url('images/home.png');
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100vh;
        }

        .navbar {
            display: flex;
            justify-content: flex-end;
            background: rgba(255, 255, 255, 0.8);
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: #333;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 4px;
        }

        .navbar a:hover {
            background: #ddd;
        }

        .container {
            text-align: center;
            padding: 2em;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #333;
            margin: auto;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        p {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .button {
            display: inline-block;
            margin: 1em;
            padding: 1em 2em;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Signup</a>
    </div>
</body>
</html>