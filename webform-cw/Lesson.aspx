<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Lesson.aspx.cs" Inherits="webform_cw.Lesson" %>

<asp:Content ID="bodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center mb-4">Manage Lesson</h2>
                </div>
            </div>
       
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1">
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
                <label for="LESSON_NOTextBox">Lesson No</label>
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
                <label for="DropDownList1">Course ID</label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top:20px; margin-bottom:10px; margin-right:750px;">
        <div class="col-sm-10 offset-sm-2">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </div>
</InsertItemTemplate>


                    <ItemTemplate>
                        <div style="margin-left: 950px; margin-top: -60px;">
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Create" CssClass="btn btn-info" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
           
        </div>
        <div class="row">
            <div class="col">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" Height="315px" Width="1072px" style="margin-top: 7px">
                    <Columns>
                        <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID" />
                        <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" SortExpression="LESSON_NO" />
                        <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                        <asp:TemplateField HeaderText="Course Title">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                      
            <ItemTemplate>
                 <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Edit" />
                  <asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                      </ItemTemplate>
                         <EditItemTemplate>
                             <asp:LinkButton ID="UpdateButton" runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update" />
                                 <asp:LinkButton ID="CancelButton" runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" />
                                          </asp:TemplateField>
                   </Columns>
                </asp:GridView>
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
       
            </div>
        </div>
      
            </div>
       
    
</asp:Content>
