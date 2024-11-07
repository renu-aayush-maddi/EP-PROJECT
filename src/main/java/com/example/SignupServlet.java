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

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/userdb";
        String dbUsername = "root";
        String dbPassword = "Nani@2005";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
            PreparedStatement ps = con.prepareStatement("INSERT INTO users1 (firstname, lastname, username, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, password);

            int result = ps.executeUpdate();
            if (result > 0) {
                out.print("You are successfully registered!");
                response.sendRedirect("login.jsp");
            } else {
                out.print("Registration failed, please try again.");
                request.getRequestDispatcher("signup.jsp").include(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
