package com.example;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SaveTimetableServlet")
public class SaveTimetableServletForStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int timetableIndex = Integer.parseInt(request.getParameter("timetableIndex"));
        HttpSession session = request.getSession();
        List<String[][]> allTimetables = (List<String[][]>) session.getAttribute("allTimetables");
        
        if (allTimetables != null && timetableIndex >= 0 && timetableIndex < allTimetables.size()) {
            String[][] selectedTimetable = allTimetables.get(timetableIndex);
            session.setAttribute("savedTimetable", selectedTimetable);
        }
        
        response.sendRedirect("exploreYourTimetable.jsp");
    }
}
