<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentEnrollment.aspx.cs" Inherits="webform_cw.StudentEnrollment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <div class="container">
        <h1 class="mt-2">Student Enrollment Details</h1>
        <div class="row mt-3">
            <div class="col-md-6">
                <label for="ddlStudent">Student:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;EMAIL_ADDRESS&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="ENROLL_ID,STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ENROLL_ID" HeaderText="Enroll ID" ReadOnly="True" SortExpression="ENROLL_ID" />
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                        <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student Name" SortExpression="STUDENT_NAME" />
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                        <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" />
                        <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="Email Address" SortExpression="EMAIL_ADDRESS" />
                        <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE" />
                        <asp:BoundField DataField="COUNTRY" HeaderText="Country" SortExpression="COUNTRY" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT se.enroll_id, s.student_id, s.student_name, s.contact, TO_CHAR(s.dob, 'YYYY-MM-DD') AS dob, s.email_address, c.course_id, c.course_title, s.country
    FROM student_enrollment se
    JOIN student s ON se.student_id = s.student_id
    JOIN course c ON se.course_id = c.course_id
    WHERE s.student_id = :student">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="student" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
