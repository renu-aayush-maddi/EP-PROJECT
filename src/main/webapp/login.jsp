<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background-image: url('images/about.png');
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .navbar {
            display: flex;
            justify-content: flex-end;
            background: white;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1;
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
            background: rgba(255, 255, 255, 0.8); /* White with 80% opacity */
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            margin-top: 30px; /* Adjust this if needed to avoid overlap with the navbar */
            margin-left: 60%;
        }

        .logo {
            font-family: 'Pacifico', cursive;
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 25px;
            background-color: #f7f7f7;
            color: #333;
            outline: none;
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #bbb;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            padding: 12px 0;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #9b59b6, #3498db);
        }

        .signup-link {
            display: block;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link:hover {
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 20px 0;
            color: #bbb;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #ddd;
        }

        .divider:not(:empty)::before {
            margin-right: .25em;
        }

        .divider:not(:empty)::after {
            margin-left: .25em;
        }

        .social-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .social-button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
        }

        .social-button.facebook {
            background-color: #3b5998;
        }

        .social-button.twitter {
            background-color: #1da1f2;
        }

        .social-button:hover {
            opacity: 0.9;
        }

        .error-message {
            color: red;
            margin-bottom: 20px;
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

    <div class="container">
        <div class="logo">Login</div>
        <form action="login" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="username" required><br>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Log In">
        </form>
        <div class="divider">OR</div>
        <div class="social-buttons">
            <!-- Social buttons can be added here -->
        </div>
        <a class="signup-link" href="signup.jsp">Don't have an account? Sign up</a>
        
        <!-- Display error message if present -->
        <div class="error-message">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
                    out.print(errorMessage);
                }
            %>
        </div>
    </div>
</body>
</html>
