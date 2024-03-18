<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="webform_cw.Student" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h2 class="text-center mb-4">Student Details</h2>
        </div>
    </div>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="form-horizontal">
        <InsertItemTemplate>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="STUDENT_IDTextBox">Student ID</label>
                        <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="STUDENT_NAMETextBox">Student Name</label>
                        <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="EMAIL_ADDRESSTextBox">Email Address</label>
                        <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="CONTACTTextBox">Contact</label>
                        <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="DOBTextBox">DOB</label>
                        <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="COUNTRYTextBox">Country</label>
                        <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group" style="margin-top:20px;">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
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


    <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT ID" ReadOnly="True" SortExpression="STUDENT_ID" />
            <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT NAME" SortExpression="STUDENT_NAME" />
            <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL ADDRESS" SortExpression="EMAIL_ADDRESS" />
            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" HeaderText="ACTION" ItemStyle-HorizontalAlign="Center" ControlStyle-CssClass="btn btn-outline-danger btn-sm" DeleteText="Delete" EditText="Edit" />
        </Columns>
        <RowStyle CssClass="align-middle" />
        <HeaderStyle CssClass="thead-dark" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" 
        InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot;) 
            VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :DOB, :EMAIL_ADDRESS, :COUNTRY)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot; 
            FROM &quot;STUDENT&quot;" 
        UpdateCommand="UPDATE &quot;STUDENT&quot; 
            SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COUNTRY&quot; = :COUNTRY 
            WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
