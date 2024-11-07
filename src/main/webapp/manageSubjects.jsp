<!DOCTYPE html>
<html>
<head>
    <title>Manage Subjects</title>
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
            width: 350px;
            text-align: center;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            max-height: 600px;
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

        .button-group {
            display: flex;
            justify-content: center;
            flex-wrap: wrap; /* Added to wrap buttons in smaller screens */
            margin-bottom: 20px;
        }

        .button-group button {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            margin: 10px; /* Adjusted margin */
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .button-group button:hover {
            background: linear-gradient(135deg, #9b59b6, #3498db);
            transform: translateY(-2px);
        }

        .form-section {
            display: none;
            margin-bottom: 20px;
            text-align: left;
        }

        .form-section.active {
            display: block;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            text-align: left;
        }

        input[type="text"], input[type="submit"] {
            width: 90%;
            padding: 10px 14px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 30px;
            background-color: #f7f7f7;
            color: #333;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]::placeholder {
            color: #bbb;
        }

        input[type="text"]:focus {
            border-color: #3498db;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            padding: 10px 0;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
            font-size: 14px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #9b59b6, #3498db);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Subjects</h1>
        
        <!-- Button group -->
        <div class="button-group">
            <button onclick="showForm('addForm')">Add Subject</button>
            <button onclick="showForm('updateForm')">Update Subject</button>
            <button onclick="showForm('deleteForm')">Delete Subject</button>
            <button onclick="location.href='viewSubjects.jsp'">Display Available Subjects</button> <!-- New button -->
        </div>
        
        <!-- Form to add a new subject -->
        <div id="addForm" class="form-section">
            <form action="SubjectServlet" method="post">
                <input type="hidden" name="action" value="add">
                <label for="addSubjectId">Subject ID</label>
                <input type="text" id="addSubjectId" name="subjectId" placeholder="Subject ID" required><br>
                <label for="addSubjectName">Subject Name</label>
                <input type="text" id="addSubjectName" name="subjectName" placeholder="Subject Name" required><br>
                <input type="submit" value="Add Subject">
            </form>
        </div>
        
        <!-- Form to update a subject -->
        <div id="updateForm" class="form-section">
            <form action="SubjectServlet" method="post">
                <input type="hidden" name="action" value="update">
                <label for="updateSubjectId">Subject ID</label>
                <input type="text" id="updateSubjectId" name="subjectId" placeholder="Subject ID" required><br>
                <label for="updateSubjectName">New Subject Name</label>
                <input type="text" id="updateSubjectName" name="subjectName" placeholder="New Subject Name" required><br>
                <input type="submit" value="Update Subject">
            </form>
        </div>
        
        <!-- Form to delete a subject -->
        <div id="deleteForm" class="form-section">
            <form action="SubjectServlet" method="post">
                <input type="hidden" name="action" value="delete">
                <label for="deleteSubjectId">Subject ID</label>
                <input type="text" id="deleteSubjectId" name="subjectId" placeholder="Subject ID" required><br>
                <input type="submit" value="Delete Subject">
            </form>
        </div>
    </div>

    <script>
        function showForm(formId) {
            // Hide all forms
            const forms = document.querySelectorAll('.form-section');
            forms.forEach(form => form.classList.remove('active'));

            // Show the selected form
            const activeForm = document.getElementById(formId);
            if (activeForm) {
                activeForm.classList.add('active');
            }
        }
    </script>
</body>
</html>
