<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="CourseManagementWeb.CourseManagement.Students" %>
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
            <h2 class="display-6" style="background-color:IndianRed; color: white; text-align: center; border: outset;">Students</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="studentid" DataSourceID="dsStudent" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="studentidLabel1" runat="server" Text='<%# Eval("studentid") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control"  ID="studentnameTextBox" runat="server" Text='<%# Bind("studentname") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="pictureTextBox" runat="server" Text='<%# Bind("picture") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="batchidTextBox" runat="server" Text='<%# Bind("batchid") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton"  runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ValidationGroup="gi" ID="studentnameTextBox" runat="server" Text='<%# Bind("studentname") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="studentnameTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name Is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="gi" ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="phoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Is Required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                           
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField  ID="pictureTextBox" runat="server" Value='<%# Bind("picture") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="batchidTextBox" runat="server" Text='<%# Bind("batchid") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button  CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="studentidLabel" runat="server" Text='<%# Eval("studentid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="studentnameLabel" runat="server" Text='<%# Eval("studentname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        <td>
                             <img src='<%# Eval("picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                        </td>
                        <td>
                            <asp:Label ID="batchidLabel" runat="server" Text='<%# Eval("batchid") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered"  id="itemPlaceholderContainer" runat="server" border="0" style="text-align:center">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">studentid</th>
                                        <th runat="server">studentname</th>
                                        <th runat="server">phone</th>
                                        <th runat="server">picture</th>
                                        <th runat="server">batchid</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="studentidLabel" runat="server" Text='<%# Eval("studentid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="studentnameLabel" runat="server" Text='<%# Eval("studentname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="pictureLabel" runat="server" Text='<%# Eval("picture") %>' />
                        </td>
                        <td>
                            <asp:Label ID="batchidLabel" runat="server" Text='<%# Eval("batchid") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsStudent" runat="server" ConnectionString="<%$ ConnectionStrings:dbSubject %>" DeleteCommand="DELETE FROM [students] WHERE [studentid] = @studentid" InsertCommand="INSERT INTO [students] ([studentname], [phone], [picture], [batchid]) VALUES (@studentname, @phone, @picture, @batchid)" SelectCommand="SELECT * FROM [students]" UpdateCommand="UPDATE [students] SET [studentname] = @studentname, [phone] = @phone, [picture] = @picture, [batchid] = @batchid WHERE [studentid] = @studentid">
                <DeleteParameters>
                    <asp:Parameter Name="studentid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="studentname" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="picture" Type="String" />
                    <asp:Parameter Name="batchid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="studentname" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="picture" Type="String" />
                    <asp:Parameter Name="batchid" Type="Int32" />
                    <asp:Parameter Name="studentid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
