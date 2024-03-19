<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Course.aspx.cs" Inherits="webform_cw.Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">Manage Courses</h2>
            </div>
        </div>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            COURSE_ID:
            <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
            <br />
            COURSE_TITLE:
            <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' />
            <br />
            INSTRUCTOR_ID:
            <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
<InsertItemTemplate>
    <div class="row">
        <div class="col-sm-3">
            <div class="form-group">
                <label for="COURSE_IDTextBox">Course ID</label>
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' CssClass="form-control" />
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label for="COURSE_TITLETextBox">Course Title</label>
                <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' CssClass="form-control" />
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label for="DropDownList1">Instructor</label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group" style="margin-top:20px;">
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
            </div>
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="COURSE_ID" HeaderText="Course ID" ReadOnly="True" SortExpression="COURSE_ID" />
                        <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" SortExpression="COURSE_TITLE" />
                        <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="Instructor ID" SortExpression="INSTRUCTOR_ID" />
                        <asp:TemplateField HeaderText="Instructor Name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="instructorname" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="instructorname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" >
                <ControlStyle CssClass="btn btn-success btn-sm" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" >
                    <ControlStyle CssClass="btn btn-danger btn-sm" />
                </asp:CommandField>
                    </Columns>
                    <PagerStyle CssClass="pagination" />
                    <HeaderStyle CssClass="thead-dark" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;INSTRUCTOR_ID&quot;) VALUES (:COURSE_ID, :COURSE_TITLE, :INSTRUCTOR_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE, &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
        <DeleteParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSE_ID" Type="String" />
            <asp:Parameter Name="COURSE_TITLE" Type="String" />
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COURSE_TITLE" Type="String" />
            <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            <asp:Parameter Name="COURSE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    
</asp:Content>
