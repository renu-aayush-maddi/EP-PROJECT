package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (DatabaseUtil.validateUser(username, password)) {
            request.getSession().setAttribute("username", username);

            if (DatabaseUtil.isAdmin(username)) {
                request.getSession().setAttribute("role", "admin");
                response.sendRedirect("welcome.jsp");
            } else if (DatabaseUtil.isFaculty(username)) {
                request.getSession().setAttribute("role", "faculty");
                response.sendRedirect("faculty.jsp");
            } else {
                request.getSession().setAttribute("role", "student");
                response.sendRedirect("student.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }

    }


}