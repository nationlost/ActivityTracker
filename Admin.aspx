<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ActivityTracker.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Button ID="btnSendWeeklyEmails" runat="server" Text="Send Weekly Emails" OnClick="btnSendWeeklyEmails_Click" />
    <br />
    <br />
    <asp:Label ID="lblEmailResult" runat="server">Emails sent to: </asp:Label>
    <br />
    <br />
    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
