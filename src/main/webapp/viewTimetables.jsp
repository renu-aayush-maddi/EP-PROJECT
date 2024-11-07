<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Timetables</title>
</head>
<body>
    <h1>Saved Timetable</h1>
    <%
        String[][] savedTimetable = (String[][]) session.getAttribute("savedTimetable");
        if (savedTimetable != null) {
            String[] dayNames = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

            out.println("<table border='1'>");
            out.println("<tr><th></th><th>09:00-10:00</th><th>10:00-11:00</th><th>11:00-12:00</th><th>Break</th><th>13:00-14:00</th><th>14:00-15:00</th><th>15:00-16:00</th><th>16:00-17:00</th></tr>");
            for (int i = 0; i < savedTimetable.length; i++) {
                out.println("<tr>");
                out.println("<td>" + dayNames[i % dayNames.length] + "</td>");
                for (int j = 0; j < savedTimetable[i].length; j++) {
                    out.println("<td>" + savedTimetable[i][j] + "</td>");
                }
                out.println("</tr>");
            }
            out.println("</table>");
        } else {
            out.println("<p>No timetable saved.</p>");
        }
    %>
</body>
</html>
