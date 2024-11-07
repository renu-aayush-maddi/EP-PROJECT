package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

@WebServlet("/GenerateTimetableServlet")
public class GenerateTimetableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String daysParam = request.getParameter("days");
        String periodsParam = request.getParameter("periods");
        String[] subjects = request.getParameterValues("selectedSubjects");
        String[] selectedFaculties = request.getParameterValues("selectedFaculties");
        String batchesParam = request.getParameter("batches");
        String[] selectedRooms = request.getParameterValues("selectedRooms");

        int days = Integer.parseInt(daysParam);
        int periods = Integer.parseInt(periodsParam);
        int batches = Integer.parseInt(batchesParam);
        String[] dayNames = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; // Adjust as needed

        List<String[][]> allTimetables = new ArrayList<>();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><style>");
        out.println("body { font-family: 'Nunito', sans-serif; background-color: #f9f9f9; margin: 0; padding: 20px; }");
        out.println("h2 { color: #2980b9; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }");
        out.println("table, th, td { border: 1px solid black; }");
        out.println("th, td { padding: 10px; text-align: center; }");
        out.println("th { background-color: #f2f2f2; }");
        out.println("button { margin: 5px; padding: 10px 20px; background-color: #2980b9; color: white; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease; }");
        out.println("button:hover { background-color: #1f5f89; }");
        out.println("</style>");
        out.println("<script>");
        out.println("function printTimetable() { window.print(); }");
        out.println("</script>");
        out.println("</head><body>");

        for (int b = 1; b <= batches; b++) {
            String[][] timetable = generateTimetable(days, periods, subjects, selectedFaculties, selectedRooms);
            allTimetables.add(timetable);

            out.println("<h2>Cluster " + b + " Timetable</h2>");
            out.println("<table>");
            out.println("<tr><th></th><th>09:00-10:00</th><th>10:00-11:00</th><th>11:00-12:00</th><th>Break</th><th>13:00-14:00</th><th>14:00-15:00</th><th>15:00-16:00</th><th>16:00-17:00</th></tr>");

            for (int i = 0; i < days; i++) {
                out.println("<tr>");
                out.println("<td>" + dayNames[i % dayNames.length] + "</td>");
                for (int j = 0; j < periods; j++) {
                    if (j == 3) {
                        out.println("<td>Break</td>");
                    } else {
                        out.println("<td>" + timetable[i][j] + "</td>");
                    }
                }
                out.println("</tr>");
            }

            out.println("</table>");
        }

        request.getSession().setAttribute("allTimetables", allTimetables);

        out.println("<button onclick=\"printTimetable()\">Print Timetable</button>");
        out.println("<form action=\"SaveTimetableServlet\" method=\"post\">");
        out.println("<button type=\"submit\">Save Timetable</button>");
        out.println("</form>");
        out.println("<form action=\"viewTimetablesForStudent.jsp\" method=\"post\">");
        out.println("<button type=\"submit\">Post</button>");
        out.println("</form>");
        out.println("</body></html>");
    }

    private String[][] generateTimetable(int days, int periods, String[] subjects, String[] faculties, String[] rooms) {
        String[][] timetable = new String[days][periods];

        // Ensure there are enough subjects, faculties, and rooms
        if (subjects.length < periods || faculties.length < periods || rooms.length < periods) {
            throw new IllegalArgumentException("Not enough subjects, faculties, or rooms to fill the timetable.");
        }

        // Map to manage subject to faculty and room assignment
        Map<String, String> subjectFacultyMap = new LinkedHashMap<>();
        Map<String, String> subjectRoomMap = new LinkedHashMap<>();
        List<String> subjectList = new ArrayList<>(Arrays.asList(subjects));
        List<String> facultyList = new ArrayList<>(Arrays.asList(faculties));
        List<String> roomList = new ArrayList<>(Arrays.asList(rooms));

        // Shuffle faculties and rooms for randomness
        Collections.shuffle(facultyList);
        Collections.shuffle(roomList);

        // Assign a unique faculty and room to each subject
        for (int i = 0; i < subjects.length; i++) {
            subjectFacultyMap.put(subjectList.get(i), facultyList.get(i % facultyList.size()));
            subjectRoomMap.put(subjectList.get(i), roomList.get(i % roomList.size()));
        }

        // Generate timetable
        for (int i = 0; i < days; i++) {
            List<String> availableSubjects = new ArrayList<>(subjectList);
            Collections.shuffle(availableSubjects); // Shuffle subjects for randomness

            for (int j = 0; j < periods; j++) {
                if (j == 3) {
                    timetable[i][j] = "Break"; // Skip period for break
                } else {
                    if (availableSubjects.isEmpty()) {
                        timetable[i][j] = "N/A";
                    } else {
                        String subject = availableSubjects.remove(0); // Get unique subject
                        String faculty = subjectFacultyMap.get(subject); // Get assigned faculty
                        String room = subjectRoomMap.get(subject); // Get assigned room
                        timetable[i][j] = subject + "<br>" + faculty + "<br>" + room; // Combine subject, faculty, and room
                    }
                }
            }
        }

        return timetable;
    }
}
