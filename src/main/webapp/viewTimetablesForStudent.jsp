<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Timetable</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');
        body {
            font-family: 'Nunito', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px 0;
        }
        .header h1 {
            margin: 0;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1px;
        }
        .content {
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #2980b9;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        select {
            width: 200px;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        select:focus {
            border-color: #2980b9;
            outline: none;
        }
        button {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #1f5f89;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Select Timetable</h1>
    </div>
    <div class="content">
        <h1>Select a Timetable to Explore</h1>
        <form action="exploreYourTimetable.jsp" method="post">
            <select name="timetableIndex">
                <% 
                    List<String[][]> allTimetables = (List<String[][]>) session.getAttribute("allTimetables");
                    if (allTimetables != null) {
                        for (int i = 0; i < allTimetables.size(); i++) {
                            out.println("<option value=\"" + i + "\">Cluster " + (i + 1) + "</option>");
                        }
                    } else {
                        out.println("<option value=\"0\">No Timetables Available</option>");
                    }
                %>
            </select>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
