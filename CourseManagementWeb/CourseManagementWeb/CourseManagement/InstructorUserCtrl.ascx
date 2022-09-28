<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstructorUserCtrl.ascx.cs" Inherits="CourseManagementWeb.CourseManagement.InstructorUserCtrl" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="instructorid" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="ge" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="ge" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="instructoridLabel1" runat="server" Text='<%# Eval("instructorid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="istructornameTextBox" ValidationGroup="ge" runat="server" Text='<%# Bind("istructorname") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="istructornameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator CssClass="text-danger err" ControlToValidate="emailTextBox" ValidationGroup="ge" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="text-danger err" ControlToValidate="emailTextBox" ValidationGroup="ge" ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
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
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm"ValidationGroup="gi"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="istructornameTextBox" runat="server" Text='<%# Bind("istructorname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator CssClass="text-danger err" ControlToValidate="emailTextBox" ValidationGroup="gi" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="text-danger err" ControlToValidate="emailTextBox" ValidationGroup="gi" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email Is Required"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                            <asp:RequiredFieldValidator CssClass="text-danger err" ControlToValidate="phoneTextBox" ValidationGroup="gi"  ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm"  ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="instructoridLabel" runat="server" Text='<%# Eval("instructorid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="istructornameLabel" runat="server" Text='<%# Eval("istructorname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">instructorid</th>
                                        <th runat="server">istructorname</th>
                                        <th runat="server">email</th>
                                        <th runat="server">phone</th>
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
                            <asp:Label ID="instructoridLabel" runat="server" Text='<%# Eval("instructorid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="istructornameLabel" runat="server" Text='<%# Eval("istructorname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSubject %>" DeleteCommand="DELETE FROM [instructors] WHERE [instructorid] = @instructorid" InsertCommand="INSERT INTO [instructors] ([istructorname], [email], [phone]) VALUES (@istructorname, @email, @phone)" SelectCommand="SELECT * FROM [instructors]" UpdateCommand="UPDATE [instructors] SET [istructorname] = @istructorname, [email] = @email, [phone] = @phone WHERE [instructorid] = @instructorid">
                <DeleteParameters>
                    <asp:Parameter Name="instructorid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="istructorname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="istructorname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="instructorid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ObjectDataSource ID="instructorid" runat="server" DataObjectTypeName="CourseManagementWeb.Academic.InstructorsDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectCountMethod="InstructorsCount" SelectMethod="GetAll" TypeName="CourseManagementWeb.Academic.InstructorsRepo" UpdateMethod="Update"></asp:ObjectDataSource>
