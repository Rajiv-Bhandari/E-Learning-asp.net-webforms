<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Top3Course-enrolled-stnd.aspx.cs" Inherits="webform_cw.Top3Course_enrolled_stnd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="container">
        <h1 class="mt-2">Top 3 Courses Enrolled by Students</h1>
        
        <div class="row mt-4">
            <div class="col-md-6">
                <label for="DropDownList1" class="form-label">Year:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" AutoPostBack="True" DataSourceID="year" DataTextField="YEAR" DataValueField="YEAR"></asp:DropDownList>
                <asp:SqlDataSource ID="year" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT TO_CHAR(enroll_data, 'YYYY') AS YEAR FROM student_enrollment"></asp:SqlDataSource>
            </div>
            <div class="col-md-6">
                <label for="DropDownList2" class="form-label">Month:</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" AutoPostBack="True" DataSourceID="month" DataTextField="MONTH" DataValueField="MONTH"></asp:DropDownList>
                <asp:SqlDataSource ID="month" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT TO_CHAR(enroll_data, 'Month') AS MONTH FROM student_enrollment"></asp:SqlDataSource>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE" />
                        <asp:BoundField DataField="ENROLL_COUNT" HeaderText="Enrollment Count" SortExpression="ENROLL_COUNT" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (SELECT c.COURSE_TITLE, COUNT(*) AS enroll_count FROM STUDENT_ENROLLMENT e JOIN COURSE c ON e.COURSE_ID = c.COURSE_ID WHERE TO_CHAR(e.ENROLL_DATA, 'YYYY') = :year AND TO_CHAR(e.ENROLL_DATA, 'Month') = :month GROUP BY c.COURSE_TITLE ORDER BY enroll_count DESC) WHERE ROWNUM &lt;= 3">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="month" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
