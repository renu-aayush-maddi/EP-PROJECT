<!DOCTYPE html>
<html>
<head>
    <title>Signup Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background-image: url('images/about.png'); /* Background image */
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
            padding: 15px; /* Reduced padding */
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px; /* Reduced width */
            text-align: center;
            margin-top: 70px; /* Adjust this if needed to avoid overlap with the navbar */
            margin-left: 60%;
             /* Center horizontally */
        }

        .logo {
            font-family: 'Pacifico', cursive;
            font-size: 28px; /* Adjusted font size */
            color: #333;
            margin-bottom: 15px; /* Adjusted margin */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            text-align: left;
        }

        input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
            width: 90%;
            padding: 8px 12px; /* Adjusted padding */
            margin-bottom: 15px; /* Adjusted margin */
            border: 1px solid #ddd;
            border-radius: 25px;
            background-color: #f7f7f7;
            color: #333;
            outline: none;
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder, input[type="email"]::placeholder, input[type="tel"]::placeholder {
            color: #bbb;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            padding: 10px 0; /* Adjusted padding */
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

        .login-link {
            display: block;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function validateForm() {
            var phone = document.getElementById("phone").value;
            var email = document.getElementById("email").value;
            var phonePattern = /^[0-9]{10}$/;
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!phonePattern.test(phone)) {
                alert("Phone number must be exactly 10 digits.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Signup</a>
    </div>

    <div class="container">
        <div class="logo">Signup</div>
        <form action="signup" method="post" onsubmit="return validateForm()">
            <label for="firstname">First Name</label>
            <input type="text" id="firstname" name="firstname" placeholder="First Name" required><br>
            <label for="lastname">Last Name</label>
            <input type="text" id="lastname" name="lastname" placeholder="Last Name" required><br>
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Username" required><br>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Email" required><br>
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" placeholder="Phone" required pattern="[0-9]{10}"><br>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Signup">
        </form>
        <a class="login-link" href="login.jsp">Already have an account? Login here</a>
    </div>
</body>
</html>
