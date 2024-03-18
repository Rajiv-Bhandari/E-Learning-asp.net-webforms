<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CourseInstructor.aspx.cs" Inherits="webform_cw.CourseInstructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="container">
        <h1 class="mt-2">Courses with Instructors</h1>
        <div class="row mt-3">
            <div class="col-md-6">
                <label for="ddlCourse">Course:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE" />
                        <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="Instructor ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                        <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="Instructor Name" SortExpression="INSTRUCTOR_NAME" />
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    c.course_id,
    c.course_title,
    i.instructor_id,
    i.instructor_name,
    i.contact
FROM 
    course c
JOIN 
    instructor i ON c.instructor_id = i.instructor_id
WHERE 
    i.instructor_id IN (
        SELECT 
            instructor_id
        FROM 
            course
        GROUP BY 
            instructor_id
        HAVING 
            COUNT(*) &gt;= 2
    )
AND
    c.course_id = :course_id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="course_id" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
