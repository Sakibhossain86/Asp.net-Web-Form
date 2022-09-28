<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="CourseManagementWeb.CourseManagement.Subjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-12 border-bottom mb-3">
            <h2 class="display-6" style="background-color:IndianRed; color: white; text-align: center; border: outset;">Subjects</h2>
        </div>
        <div class="col-6">
            <h3 class="display-6" style="background-color:CadetBlue; color: white; text-align: center;">Edit/Delete</h3>
            <asp:GridView CssClass="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="subjectid" DataSourceID="dsSubject" OnPreRender="GridView1_PreRender" OnRowDataBound="GridView1_RowDataBound">
                <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:TemplateField HeaderText="Subject Id" InsertVisible="False"  >
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("subjectid") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("subjectid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject" >
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("technology") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="gv-ed" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Subject Name Is Required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("technology") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="gv-ed" ID="LinkButton1" runat="server" CssClass="btn btn-success btn-sm rounded-circle" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-secondary btn-sm rounded-circle" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:dbSubject %>" DeleteCommand="DELETE FROM [techsubjects] WHERE [subjectid] = @subjectid" InsertCommand="INSERT INTO [techsubjects] ([technology]) VALUES (@technology)" SelectCommand="SELECT * FROM [techsubjects]" UpdateCommand="UPDATE [techsubjects] SET [technology] = @technology WHERE [subjectid] = @subjectid">
                <DeleteParameters>
                    <asp:Parameter Name="subjectid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="technology" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="technology" Type="String" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-6 border">
            <h3 class="display-6" style="background-color:CadetBlue; color: white; text-align: center;">Add New</h3>
            <asp:FormView Width="100%" ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="subjectid" DataSourceID="dsSubject">
                <EditItemTemplate>
                    subjectid:
                    <asp:Label ID="subjectidLabel1" runat="server" Text='<%# Eval("subjectid") %>' />
                    <br />
                    technology:
                    <asp:TextBox ID="technologyTextBox" runat="server" Text='<%# Bind("technology") %>' />
                    <%--<asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="technologyTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Is Required"></asp:RequiredFieldValidator>--%>
                    
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                       <label class="col-form-label col-form-label-sm col-2">Subject Name</label>
                   <div class="col-12">
                        <asp:TextBox ValidationGroup="gi" ID="technologyTextBox" runat="server" Text='<%# Bind("technology") %>' />
                       <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="gi" ControlToValidate="technologyTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject Name Is Required"></asp:RequiredFieldValidator>
                   </div>
                    <br />
                    </div>
                    <asp:LinkButton CssClass="btn btn-success btn-sm" ID="InsertButton" ValidationGroup="gi" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i>Insert</asp:LinkButton>
                    &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" ValidationGroup="gi" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x">Cancel</i></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    Subject Id:
                    <asp:Label ID="subjectidLabel" runat="server" Text='<%# Eval("subjectid") %>' />
                    <br />
                    technology:
                    <asp:Label ID="technologyLabel" runat="server" Text='<%# Bind("technology") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>
