package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/FacultyServlet")
public class FacultyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String facultyName = request.getParameter("facultyName");
        String facultyId = request.getParameter("facultyId");

        String url = "jdbc:mysql://localhost:3306/userdb";
        String dbUsername = "root";
        String dbPassword = "Nani@2005";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);

            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO faculty (name) VALUES (?)");
                ps.setString(1, facultyName);
                ps.executeUpdate();
            } else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement("UPDATE faculty SET name=? WHERE id=?");
                ps.setString(1, facultyName);
                ps.setInt(2, Integer.parseInt(facultyId));
                ps.executeUpdate();
            } else if ("delete".equals(action)) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM faculty WHERE id=?");
                ps.setInt(1, Integer.parseInt(facultyId));
                ps.executeUpdate();
            }

            response.sendRedirect("manageFaculty.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
