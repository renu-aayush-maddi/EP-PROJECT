<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Subjects</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');
        body {
            font-family: 'Nunito', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f9f9f9;
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
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #1f5f89;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Subjects List</h1>
    </div>
    <div class="content">
        <table>
            <thead>
                <tr>
                    <th>Subject ID</th>
                    <th>Subject Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    String url = "jdbc:mysql://localhost:3306/userdb";
                    String dbUsername = "root";
                    String dbPassword = "Nani@2005";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, dbUsername, dbPassword);
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM subjects");

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
        <a class="back-button" href="student.jsp">Back to Student Portal</a>
    </div>
</body>
</html>