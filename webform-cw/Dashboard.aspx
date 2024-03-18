<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="webform_cw.Dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-6">
            <h2>Students Enrolled in Course</h2>
            <div class="chart-container">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="studentenrollment">
                    <Series>
                        <asp:Series ChartType="Line" Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="ENROLL_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Course"></AxisX>
                            <AxisY Title="Number of Students Enrolled"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="studentenrollment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT C.COURSE_TITLE, COUNT(SE.STUDENT_ID) AS ENROLL_COUNT FROM STUDENT_ENROLLMENT SE JOIN COURSE C ON SE.COURSE_ID = C.COURSE_ID GROUP BY C.COURSE_TITLE"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-6">
            <h2>Student Progress Status</h2>
            <div class="chart-container">
                <asp:Chart ID="Chart2" runat="server" DataSourceID="lessonstatus">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="LESSON_STATUS" YValueMembers="STUDENT_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Lesson Status"></AxisX>
                            <AxisY Title="Number of Students"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="lessonstatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT LESSON_STATUS, COUNT(STUDENT_ID) AS STUDENT_COUNT FROM STUDENT_PROGRESS GROUP BY LESSON_STATUS"></asp:SqlDataSource>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <h2>Instructor Course Count</h2>
            <div class="chart-container">
                <asp:Chart ID="Chart3" runat="server" DataSourceID="courseinstructor">
                    <Series>
                        <asp:Series ChartType="Area" Name="Series1" XValueMember="INSTRUCTOR_NAME" YValueMembers="COURSE_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Instructor"></AxisX>
                            <AxisY Title="Number of Course Instructor teaches"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="courseinstructor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT I.INSTRUCTOR_NAME, COUNT(C.COURSE_ID) AS COURSE_COUNT FROM INSTRUCTOR I LEFT JOIN COURSE C ON I.INSTRUCTOR_ID = C.INSTRUCTOR_ID GROUP BY I.INSTRUCTOR_NAME"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-6">
            <h2>Instructor contribution</h2>
            <div class="chart-container">
                <asp:Chart ID="Chart4" runat="server" DataSourceID="query">
                    <Series>
                        <asp:Series ChartType="Point" Name="Series1" XValueMember="INSTRUCTOR_NAME" YValueMembers="QUERY_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Instructor"></AxisX>
                            <AxisY Title="Number of Questions Answered"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="query" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT I.INSTRUCTOR_NAME, COUNT(Q.QUERY_ID) AS QUERY_COUNT FROM INSTRUCTOR I LEFT JOIN QUERY Q ON I.INSTRUCTOR_ID = Q.INSTRUCTOR_ID GROUP BY I.INSTRUCTOR_NAME"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <style>
        .chart-container {
            margin-bottom: 30px;
            text-align: center;
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }
    </style>

</asp:Content>
