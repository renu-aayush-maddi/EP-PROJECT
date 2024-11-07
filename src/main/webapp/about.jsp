<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('images/about.png');
            background-size: cover;
            background-position: center;
            filter: blur(4px);
            z-index: -1;
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
            text-align: center;
            padding: 100px;
            color: white;
            z-index: 1;
            position: relative;
        }

        .container h1 {
            font-size: 48px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .container p {
            font-size: 24px;
            margin-bottom: 40px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Signup</a>
    </div>
    <div class="container">
        <h1>About Us</h1>
        <p>Welcome to our Timetable Generator Project! Our mission is to simplify the scheduling process for educational institutions by providing a robust and user-friendly tool for creating and managing timetables. Designed with both educators and students in mind, our application allows for efficient allocation of subjects, periods, and breaks, ensuring a well-organized academic calendar. We aim to enhance productivity and streamline scheduling tasks, making it easier for institutions to focus on delivering quality education. With a focus on customization and ease of use, our timetable generator is the ideal solution for managing academic schedules effectively.

        </p>
    </div>
</body>
</html>
