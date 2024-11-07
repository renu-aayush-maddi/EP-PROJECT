<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Explore Your Timetable</title>
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #2980b9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            margin: 5px;
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #1f5f89;
        }
    </style>
</head>
<body>
    <h1>Your Timetable</h1>
    <%
        List<String[][]> allTimetables = (List<String[][]>) session.getAttribute("allTimetables");
        String timetableIndexParam = request.getParameter("timetableIndex");
        if (timetableIndexParam != null) {
            int timetableIndex = Integer.parseInt(timetableIndexParam);
            String[][] selectedTimetable = allTimetables.get(timetableIndex);

            String[] dayNames = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

            out.println("<table>");
            out.println("<tr><th></th><th>09:00-10:00</th><th>10:00-11:00</th><th>11:00-12:00</th><th>Break</th><th>13:00-14:00</th><th>14:00-15:00</th><th>15:00-16:00</th><th>16:00-17:00</th></tr>");
            for (int i = 0; i < selectedTimetable.length; i++) {
                out.println("<tr>");
                out.println("<td>" + dayNames[i % dayNames.length] + "</td>");
                for (int j = 0; j < selectedTimetable[i].length; j++) {
                    out.println("<td>" + selectedTimetable[i][j] + "</td>");
                }
                out.println("</tr>");
            }
            out.println("</table>");
    %>
            <form action="SaveTimetableServlet" method="post">
                <input type="hidden" name="timetableIndex" value="<%= timetableIndex %>">
                <button type="submit">Save Timetable</button>
            </form>
    <%
        } else {
            out.println("<p>No timetable selected.</p>");
        }
    %>
</body>
</html>
