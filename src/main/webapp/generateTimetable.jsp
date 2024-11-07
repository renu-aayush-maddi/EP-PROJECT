<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Timetable</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background-image: url('images/about.png');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            width: 70%;
            max-width: 800px;
            max-height: 90vh;
            overflow-y: auto;
            text-align: left;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 2rem;
        }

        form {
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .checkbox-group label {
            flex: 1 1 30%;
            margin-bottom: 10px;
        }

        .section-title {
            margin-top: 20px;
            font-size: 1.2rem;
            color: #333;
            text-align: center;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Generate Timetable</h2>
        <form action="GenerateTimetableServlet" method="post">
            <label for="days">Number of Days:</label>
            <input type="text" id="days" name="days" required>
            
            <label for="periods">Number of Periods per Day:</label>
            <input type="text" id="periods" name="periods" required>
            
            <div class="section-title">Subjects</div>
            <div class="checkbox-group">
                <%
                    String url = "jdbc:mysql://localhost:3306/userdb";
                    String dbUsername = "root";
                    String dbPassword = "Nani@2005";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                        PreparedStatement ps = con.prepareStatement("SELECT name FROM subjects");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String subjectName = rs.getString("name");
                            out.println("<label><input type=\"checkbox\" name=\"selectedSubjects\" value=\"" + subjectName + "\"> " + subjectName + "</label>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            
            <div class="section-title">Faculty</div>
            <div class="checkbox-group">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                        PreparedStatement ps = con.prepareStatement("SELECT name FROM faculty");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String facultyName = rs.getString("name");
                            out.println("<label><input type=\"checkbox\" name=\"selectedFaculties\" value=\"" + facultyName + "\"> " + facultyName + "</label>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            
            <div class="section-title">Rooms</div>
            <div class="checkbox-group">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                        PreparedStatement ps = con.prepareStatement("SELECT room_number FROM rooms");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String roomNumber = rs.getString("room_number");
                            out.println("<label><input type=\"checkbox\" name=\"selectedRooms\" value=\"" + roomNumber + "\"> " + roomNumber + "</label>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            
            <label for="batches">Number of Batches:</label>
            <input type="text" id="batches" name="batches" required>
            
            <input type="submit" value="Generate Timetable">
        </form>
    </div>
</body>
</html>
