<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="CourseManagementWeb.CourseManagement.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
     <style>
        
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12"></div>
        <h2 class="display-6" style="background-color:IndianRed; color: white; text-align: center; border: outset;">Courses</h2>
    </div>
    <div class="row">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="text-center">
                    <div class="spinner-border" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-12">
                    <asp:ListView  ID="ListView1" runat="server" DataKeyNames="courseid" DataSourceID="odsCourse" InsertItemPosition="LastItem">

                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button CssClass="btn btn-primary btn-sm rounded-circle"  ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm rounded-circle" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="courseidLabel1" runat="server" Text='<%# Eval("courseid") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="totalclassTextBox" runat="server" Text='<%# Bind("totalclass") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="weeklyclassTextBox" runat="server" Text='<%# Bind("weeklyclass") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="classdurationTextBox" runat="server" Text='<%# Bind("classduration") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="availableCheckBox" runat="server" Checked='<%# Bind("available") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="instructoridTextBox" runat="server" Text='<%# Bind("instructorid") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" class="table table-bordered">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button CssClass="btn btn-secondary btn-sm rounded-circle" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button CssClass="btn btn-danger btn-sm rounded-circle" ValidationGroup="gi" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox  CssClass="form-control form-control-sm" ValidationGroup="gi" ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="titleTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox  CssClass="form-control form-control-sm" ID="totalclassTextBox" runat="server" Text='<%# Bind("totalclass") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="totalclassTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Total Class Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox  CssClass="form-control form-control-sm" ID="weeklyclassTextBox" runat="server" Text='<%# Bind("weeklyclass") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="weeklyclassTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Weekly Class Required"></asp:RequiredFieldValidator>

                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control form-control-sm" ID="classdurationTextBox" runat="server" Text='<%# Bind("classduration") %>' />
                                </td>
                                <td>
                                    <asp:TextBox  CssClass="form-control form-control-sm" ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="feeTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fee Is Required"></asp:RequiredFieldValidator>

                                </td>
                                <td>
                                    <asp:CheckBox ID="availableCheckBox" runat="server" Checked='<%# Bind("available") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList ID="instructoridTextBox" DataSourceID="odsIns" AppendDataBoundItems="true" runat="server" Text='<%# Bind("instructorid") %>' DataTextField="istructorname" DataValueField="instructorid">
                                        <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button CssClass="btn btn-danger btn-sm rounded-circle" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm rounded-circle" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="courseidLabel" runat="server" Text='<%# Eval("courseid") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="totalclassLabel" runat="server" Text='<%# Eval("totalclass") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="weeklyclassLabel" runat="server" Text='<%# Eval("weeklyclass") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="classdurationLabel" runat="server" Text='<%# Eval("classduration") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="feeLabel" runat="server" Text='<%# Eval("fee") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="availableCheckBox" runat="server" Checked='<%# Eval("available") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="instructoridLabel" runat="server" Text='<%# Eval("instructorid") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" class="table">
                                <tr runat="server">
                                    <td runat="server">
                                        <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align:center">
                                            <tr runat="server" style="">
                                                <th runat="server"></th>
                                                <th runat="server">courseid</th>
                                                <th runat="server">title</th>
                                                <th runat="server">totalclass</th>
                                                <th runat="server">weeklyclass</th>
                                                <th runat="server">classduration</th>
                                                <th runat="server">fee</th>
                                                <th runat="server">available</th>
                                                <th runat="server">instructorid</th>
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

                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCourse" runat="server" DataObjectTypeName="CourseManagementWeb.Academic.CoursesDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="CourseManagementWeb.Academic.CourseManager" UpdateMethod="Update"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsIns" runat="server" SelectMethod="InstructorDropItems" TypeName="CourseManagementWeb.Academic.CourseManager"></asp:ObjectDataSource>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
