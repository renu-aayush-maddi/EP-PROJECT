package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/SaveTimetableServlet")
public class SaveTimetableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String[][]> allTimetables = (List<String[][]>) session.getAttribute("allTimetables");
        String timetableIndexParam = request.getParameter("timetableIndex");

        if (timetableIndexParam != null && allTimetables != null) {
            int timetableIndex = Integer.parseInt(timetableIndexParam);
            String[][] selectedTimetable = allTimetables.get(timetableIndex);
            session.setAttribute("savedTimetable", selectedTimetable);
        }

        response.sendRedirect("viewTimetables.jsp");
    }
}
