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

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String roomNumber = request.getParameter("roomNumber");
        String roomId = request.getParameter("roomId");

        String url = "jdbc:mysql://localhost:3306/userdb";
        String dbUsername = "root";
        String dbPassword = "Nani@2005";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);

            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO rooms (room_number) VALUES (?)");
                ps.setString(1, roomNumber);
                ps.executeUpdate();
            } else if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement("UPDATE rooms SET room_number=? WHERE id=?");
                ps.setString(1, roomNumber);
                ps.setInt(2, Integer.parseInt(roomId));
                ps.executeUpdate();
            } else if ("delete".equals(action)) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM rooms WHERE id=?");
                ps.setInt(1, Integer.parseInt(roomId));
                ps.executeUpdate();
            }

            response.sendRedirect("manageRooms.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
