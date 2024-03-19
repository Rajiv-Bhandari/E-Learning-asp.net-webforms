<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="webform_cw.Instructor" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">Instructor Details</h2>
            </div>
        </div>
        
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" CssClass="form-horizontal">
        <InsertItemTemplate>
            <div class="row" style="margin-bottom:20px;">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="INSTRUCTOR_IDTextBox">Instructor ID</label>
                        <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="INSTRUCTOR_NAMETextBox">Instructor Name</label>
                        <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="INSTRUCTOR_NAMETextBox" ErrorMessage="*" CssClass="text-danger" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="CONTACTTextBox">Contact</label>
                        <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CONTACTTextBox" ErrorMessage="*" CssClass="text-danger" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group" style="margin-top:20px;">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" OnClientClick="return ValidateForm();" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
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

<script type="text/javascript">
    function ValidateForm() {
        var instructorNameTextBox = document.getElementById('<%= FormView1.FindControl("INSTRUCTOR_NAMETextBox")?.ClientID %>');
        var contactTextBox = document.getElementById('<%= FormView1.FindControl("CONTACTTextBox")?.ClientID %>');

        if (!instructorNameTextBox || !contactTextBox) {
            alert('Form controls not found.');
            return false;
        }

        var instructorName = instructorNameTextBox.value.trim();
        var contact = contactTextBox.value.trim();

        if (instructorName === '' || contact === '') {
            alert('Please enter all required fields.');
            return false;
        }
        return true;
    }
</script>



        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                            <asp:CommandField ShowEditButton="True" >
                <ControlStyle CssClass="btn btn-success btn-sm" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" >
                    <ControlStyle CssClass="btn btn-danger btn-sm" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;CONTACT&quot; = :CONTACT WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
            <DeleteParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
