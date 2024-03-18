<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="webform_cw.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: flex;">
            <div style="width: 200px; background-color: #f0f0f0;">
                <ul style="list-style-type: none; padding: 0;">
                    <li><a href="Student.aspx">Student</a></li>
                    <li><a href="Instructor.aspx">Instructor</a></li>
                    <li><a href="Course.aspx">Course</a></li>
                    <li><a href="Lesson.aspx">Lesson</a></li>
                    <li><a href="StudentProgress.aspx">Student Progress</a></li>
                </ul>
            </div>
            <div>
                <!-- Content of the selected page will be loaded here -->
            </div>
        </div>
    </form>
</body>
</html>
