<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Lesson.aspx.cs" Inherits="webform_cw.Lesson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">Manage Lessons</h2>
            </div>
        </div>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
<EditItemTemplate> 
    LESSON_ID:
    <asp:Label ID="LESSON_IDLabel1" runat="server" Text='<%# Eval("LESSON_ID") %>' />
    <br />
    LESSON_NO:
    <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' />
    <br />
    LESSON_TITLE:
    <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
    <br />
    COURSE:
    <asp:DropDownList ID="CourseDropDownList" runat="server" DataSourceID="CourseDataSource" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'></asp:DropDownList>
    <asp:SqlDataSource ID="CourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_ID, COURSE_TITLE FROM COURSE"></asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
</EditItemTemplate>

<InsertItemTemplate>
    <div class="row">
        <div class="col-sm-3">
            <div class="form-group">
                <label for="LESSON_IDTextBox">Lesson ID</label>
                <asp:TextBox ID="LESSON_IDTextBox" runat="server" Text='<%# Bind("LESSON_ID") %>' CssClass="form-control" />
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label for="LESSON_NOTextBox">Lesson Number</label>
                <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' CssClass="form-control" />
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label for="LESSON_TITLETextBox">Lesson Title</label>
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' CssClass="form-control" />
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label for="COURSE_NAMEDropDownList">Course Name</label>
                <asp:DropDownList ID="COURSE_NAMEDropDownList" runat="server" CssClass="form-control" DataSourceID="courseDataSource" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" />
                <asp:SqlDataSource ID="courseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_ID, COURSE_TITLE FROM COURSE"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top:20px;">
        <div class="col-sm-offset-9 col-sm-3">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </div>
</InsertItemTemplate>



        <ItemTemplate>
            <div class="form-group">
                <div style="margin-left: 950px; margin-top: -60px;">
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Create" CssClass="btn btn-info" />
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

        <div class="row mt-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="LESSON_ID" HeaderText="Lesson ID" ReadOnly="True" SortExpression="LESSON_ID" />
                        <asp:BoundField DataField="LESSON_NO" HeaderText="Lesson Number" SortExpression="LESSON_NO" />
                        <asp:BoundField DataField="LESSON_TITLE" HeaderText="Lesson Title" SortExpression="LESSON_TITLE" />
                        <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" SortExpression="COURSE_ID" />
                        <asp:TemplateField HeaderText="Course Name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList1" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Action" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-danger btn-sm" />
                    </Columns>
                    <PagerStyle CssClass="pagination" />
                    <HeaderStyle CssClass="thead-dark" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_ID&quot; = :LESSON_ID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_ID&quot;, &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;, &quot;COURSE_ID&quot;) VALUES (:LESSON_ID, :LESSON_NO, :LESSON_TITLE, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_NO&quot; = :LESSON_NO, &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;LESSON_ID&quot; = :LESSON_ID">
        <DeleteParameters>
            <asp:Parameter Name="LESSON_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LESSON_ID" Type="String" />
            <asp:Parameter Name="LESSON_NO" Type="Decimal" />
            <asp:Parameter Name="LESSON_TITLE" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSON_NO" Type="Decimal" />
            <asp:Parameter Name="LESSON_TITLE" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="LESSON_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:content>
