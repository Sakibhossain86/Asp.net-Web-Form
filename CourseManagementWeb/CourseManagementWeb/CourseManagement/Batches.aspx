<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Batches.aspx.cs" Inherits="CourseManagementWeb.CourseManagement.Batches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
<script src="../Scripts/jquery-3.6.0.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <link href="~/Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />  
    <script>
        $(() => {
            $('.date').datepicker({
                format: "yyyy-mm-dd"
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h2 class="display-6" style="background-color:IndianRed; color: white; text-align: center; border: outset;">Batches</h2>
        </div>
         <div class="col-6" >
            <h3 class="display-6" style="background-color:CadetBlue; color: white; text-align: center;">Edit/Delete</h3>
             <asp:GridView CssClass="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="batchid" DataSourceID="dsBatches">
                 <HeaderStyle CssClass="table-light" />
                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                             &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                             &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="batchid" InsertVisible="False">
                         <EditItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("batchid") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("batchid") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="startdate">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("startdate") %>'></asp:TextBox>
                             <%--<asp:RequiredFieldValidator CssClass="text-danger" ControlToValidat="TextBox1"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("startdate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="courseid">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("courseid") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("courseid") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="dsBatches" runat="server" ConnectionString="<%$ ConnectionStrings:dbSubject %>" DeleteCommand="DELETE FROM [batches] WHERE [batchid] = @batchid" InsertCommand="INSERT INTO [batches] ([startdate], [courseid]) VALUES (@startdate, @courseid)" SelectCommand="SELECT * FROM [batches]" UpdateCommand="UPDATE [batches] SET [startdate] = @startdate, [courseid] = @courseid WHERE [batchid] = @batchid">
                 <DeleteParameters>
                     <asp:Parameter Name="batchid" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter DbType="Date" Name="startdate" />
                     <asp:Parameter Name="courseid" Type="Int32" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter DbType="Date" Name="startdate" />
                     <asp:Parameter Name="courseid" Type="Int32" />
                     <asp:Parameter Name="batchid" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
         <div class="col-6">
            <h3 class="display-6" style="background-color:CadetBlue; color: white; text-align: center;">Add New</h3>
             <asp:FormView ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="batchid" DataSourceID="dsBatches">
                 <EditItemTemplate>
                     batchid:
                     <asp:Label ID="batchidLabel1" runat="server" Text='<%# Eval("batchid") %>' />
                     <br />
                     startdate:
                     <asp:TextBox ValidationGroup="ge" ID="startdateTextBox" runat="server" Text='<%# Bind("startdate") %>' />
                     <asp:RequiredFieldValidator ValidationGroup="ge" CssClass="text-danger" ControlToValidate="startdateTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                     <br />
                     courseid:
                     <asp:TextBox ID="courseidTextBox" runat="server" Text='<%# Bind("courseid") %>' />
                     <br />
                     <asp:LinkButton CssClass="btn btn-primary btn-sm"  ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                     &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     startdate:
                     <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="startdateTextBox" runat="server" Text='<%# Bind("startdate") %>' />
                     <asp:RequiredFieldValidator CssClass="text-danger" ControlToValidate="startdateTextBox" ValidationGroup="gi" ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                     <br />
                     courseid:
                     <asp:TextBox CssClass="form-control" ID="courseidTextBox" runat="server" Text='<%# Bind("courseid") %>' />
                     <br />
                     <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="InsertButton" ValidationGroup="gi" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                     &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" ValidationGroup="gi" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     batchid:
                     <asp:Label ID="batchidLabel" runat="server" Text='<%# Eval("batchid") %>' />
                     <br />
                     startdate:
                     <asp:Label ID="startdateLabel" runat="server" Text='<%# Bind("startdate") %>' />
                     <br />
                     courseid:
                     <asp:Label ID="courseidLabel" runat="server" Text='<%# Bind("courseid") %>' />
                     <br />
                     <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                     &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                 </ItemTemplate>
             </asp:FormView>
        </div>
    </div>
</asp:Content>
