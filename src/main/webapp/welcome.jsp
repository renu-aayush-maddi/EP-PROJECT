<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Timetable Generator - Welcome</title>
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
            justify-content: space-between;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 20px;
            margin: 10px; /* Adjusted margin */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            flex: 1 1 calc(25% - 40px); /* Adjusted size to fit four cards in a row */
            box-sizing: border-box;
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
        @media (max-width: 1200px) {
            .card {
                flex: 1 1 calc(33.33% - 40px); /* Three cards in a row for medium screens */
            }
        }
        @media (max-width: 768px) {
            .card {
                flex: 1 1 calc(50% - 40px); /* Two cards in a row for small screens */
            }
        }
        @media (max-width: 480px) {
            .card {
                flex: 1 1 calc(100% - 40px); /* One card in a row for very small screens */
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to the College Timetable Generator, ${sessionScope.username}!</h1>
        <div class="logout-section">
            <a href="index.jsp">Logout</a>
        </div>
    </div>
    <div class="content">
        <div class="card">
            <h2>Generate Timetable</h2>
            <p>Click the link below to generate a new timetable.</p>
            <a href="generateTimetable.jsp">Generate Timetable</a>
        </div>
        <div class="card">
            <h2>View Timetables</h2>
            <p>View the existing timetables for your classes.</p>
            <a href="viewTimetables.jsp">View Timetables</a>
        </div>
        <div class="card">
            <h2>Manage Subjects</h2>
            <p>Add, update, or delete subjects for the timetable.</p>
            <a href="manageSubjects.jsp">Manage Subjects</a>
        </div>
        <div class="card">
            <h2>Manage Faculty</h2>
            <p>Add, update, or delete faculty members.</p>
            <a href="manageFaculty.jsp">Manage Faculty</a>
        </div>
        <div class="card">
            <h2>Manage Rooms</h2>
            <p>Add, update, or delete Rooms.</p>
            <a href="manageRooms.jsp">Manage Rooms</a>
        </div>
    </div>
</body>
</html>
