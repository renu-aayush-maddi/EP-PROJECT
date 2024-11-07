<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Timetable Generator - Student Portal</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-image: url('images/about.png'); /* Update this with your background image */
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            background-color: rgba(44, 62, 80, 0.8); /* Semi-transparent background */
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            position: relative;
            width: 100%;
            z-index: 1;
        }
        .header h1 {
            margin: 0;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1px;
        }
        .logout-section {
            position: absolute;
            right: 10px;
            top: 20px;
        }
        .logout-section a {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
            font-size: 16px;
            background-color: #ecf0f1;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .logout-section a:hover {
            background-color: #e74c3c;
            color: #fff;
        }
        .content {
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            width: 300px; /* Adjusted size */
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }
        .card h2 {
            color: #2980b9;
            margin-top: 0;
            font-size: 22px;
            font-weight: bold;
        }
        .card a {
            text-decoration: none;
            color: #2980b9;
            display: inline-block;
            margin: 10px 0;
            font-weight: bold;
            padding: 10px 15px;
            border: 1px solid #2980b9;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .card a:hover {
            background-color: #2980b9;
            color: #fff;
        }
        .card p {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to the Student Portal, ${sessionScope.username}!</h1>
        <div class="logout-section">
            <a href="index.jsp">Logout</a>
        </div>
    </div>
    <div class="content">
        <div class="card">
            <h2>View Clusters</h2>
            <p>View your class Clusters.</p>
            <a href="viewTimetablesForStudent.jsp">View Clusters</a>
        </div>
        <div class="card">
            <h2>View Subjects List</h2>
            <p>View the list of subjects.</p>
            <a href="viewSubjects.jsp">View Subjects</a>
        </div>
        <div class="card">
            <h2>View Faculty List</h2>
            <p>View the list of faculty members.</p>
            <a href="viewFaculty.jsp">View Faculty</a>
        </div>
         <div class="card">
            <h2>View Timetable</h2>
            <p>View the Selected TimeTable.</p>
            <a href="viewTimetables.jsp">View TimeTable</a>
        </div>
    </div>
</body>
</html>