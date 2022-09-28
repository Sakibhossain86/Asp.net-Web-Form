<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructors.aspx.cs" Inherits="CourseManagementWeb.CourseManagement.Instructors" %>

<%@ Register Src="~/CourseManagement/InstructorUserCtrl.ascx" TagPrefix="uc1" TagName="InstructorUserCtrl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h2 class="display-6" style="background-color:IndianRed; color: white; text-align: center; border: outset;">Instructors</h2>
            <uc1:InstructorUserCtrl runat="server" id="InstructorUserCtrl" />
        </div>
    </div>
</asp:Content>
