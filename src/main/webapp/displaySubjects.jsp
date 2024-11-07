<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Subjects</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background: url('images/about.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            width: 600px;
            text-align: center;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            max-height: 80vh;
            overflow-y: auto;
        }

        .container:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
        }

        h1 {
            color: #3498db;
            margin-bottom: 20px;
            font-size: 1.8rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        th {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .back-button {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            margin: 20px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.3s ease;
            text-decoration: none;
        }

        .back-button:hover {
            background: linear-gradient(135deg, #9b59b6, #3498db);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Subjects</h1>
        <table>
            <thead>
                <tr>
                    <th>Subject ID</th>
                    <th>Subject Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/userdb";
                    String user = "root";
                    String password = "Nani@2005";
                    String query = "SELECT * FROM subjects";
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(url, user, password);
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            String subjectId = rs.getString("subjectId");
                            String subjectName = rs.getString("subjectName");
                %>
                <tr>
                    <td><%= subjectId %></td>
                    <td><%= subjectName %></td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="manageSubjects.jsp" class="back-button">Back to Manage Subjects</a>
    </div>
</body>
</html>
