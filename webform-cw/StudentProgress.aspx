<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentProgress.aspx.cs" Inherits="webform_cw.StudentProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">Student Progress</h2>
            </div>
        </div>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROGRESS_ID" DataSourceID="SqlDataSource1" CssClass="mt-3">
        <EditItemTemplate>
            PROGRESS_ID:
            <asp:Label ID="PROGRESS_IDLabel1" runat="server" Text='<%# Eval("PROGRESS_ID") %>' />
            <br />
            LESSON_STATUS:
            <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' CssClass="form-control" />
            <br />
            LAST_ACCESSED_DATE:
            <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' CssClass="form-control" />
            <br />
            LESSON_ID:
            <asp:TextBox ID="LESSON_IDTextBox" runat="server" Text='<%# Bind("LESSON_ID") %>' CssClass="form-control" />
            <br />
            STUDENT_ID:
            <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="PROGRESS_IDTextBox">Progress ID</label>
                        <asp:TextBox ID="PROGRESS_IDTextBox" runat="server" Text='<%# Bind("PROGRESS_ID") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="LESSON_STATUSTextBox">Lesson Status</label>
                        <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="LAST_ACCESSED_DATETextBox">Last Accessed Date</label>
                        <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="LessonDropDownList">Lesson</label>
                        <asp:DropDownList ID="LessonDropDownList" runat="server" DataSourceID="LessonDataSource" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>' CssClass="form-control"></asp:DropDownList>
                        <asp:SqlDataSource ID="LessonDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT LESSON_ID, LESSON_TITLE FROM LESSON"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="StudentDropDownList">Student</label>
                        <asp:DropDownList ID="StudentDropDownList" runat="server" DataSourceID="StudentDataSource" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-control"></asp:DropDownList>
                        <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STUDENT_ID, STUDENT_NAME FROM STUDENT"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-sm-offset-9 col-sm-3" style="margin-top:20px;">
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
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="PROGRESS_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="PROGRESS_ID" HeaderText="Progress ID" ReadOnly="True" SortExpression="PROGRESS_ID" />
                        <asp:BoundField DataField="LESSON_STATUS" HeaderText="Lesson Status" SortExpression="LESSON_STATUS" />
                        <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="Last Accessed Date" SortExpression="LAST_ACCESSED_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="LESSON_ID" HeaderText="Lesson ID" SortExpression="LESSON_ID" />
                        <asp:TemplateField HeaderText="Lesson Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" Enabled="false" runat="server" DataSourceID="lesson" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>' CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="lesson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" SortExpression="STUDENT_ID" />
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList4" Enabled="false" runat="server" DataSourceID="st" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="st" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_PROGRESS&quot; WHERE &quot;PROGRESS_ID&quot; = :PROGRESS_ID" InsertCommand="INSERT INTO &quot;STUDENT_PROGRESS&quot; (&quot;PROGRESS_ID&quot;, &quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;LESSON_ID&quot;, &quot;STUDENT_ID&quot;) VALUES (:PROGRESS_ID, :LESSON_STATUS, :LAST_ACCESSED_DATE, :LESSON_ID, :STUDENT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT_PROGRESS&quot;" UpdateCommand="UPDATE &quot;STUDENT_PROGRESS&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE, &quot;LESSON_ID&quot; = :LESSON_ID, &quot;STUDENT_ID&quot; = :STUDENT_ID WHERE &quot;PROGRESS_ID&quot; = :PROGRESS_ID">
        <DeleteParameters>
            <asp:Parameter Name="PROGRESS_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PROGRESS_ID" Type="String" />
            <asp:Parameter Name="LESSON_STATUS" Type="String" />
            <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
            <asp:Parameter Name="LESSON_ID" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSON_STATUS" Type="String" />
            <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
            <asp:Parameter Name="LESSON_ID" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="PROGRESS_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
