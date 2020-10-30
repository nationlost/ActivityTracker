<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ActivityTracker.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblActivityReport" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="Black" Font-Size="X-Large">Activity Report</asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="ddlActivityReportUsers" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlActivityReportUsers_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="-99">-- Select Person --</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="ddlActivityReportMonths" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
        <asp:ListItem Selected="True" Value="202001">-- Select Month --</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnActivityReportSubmit" runat="server" Text="View Report" OnClick="btnActivityReportSubmit_Click" />
    <br />
    <br />
    <asp:GridView ID="gvActivityReport" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" Width="695px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="ActivityDate" DataFormatString="{0:d}" HeaderText="Activity Date" />
            <asp:BoundField DataField="Activity" HeaderText="Activity" />
            <asp:BoundField DataField="ActivityMinutes" HeaderText="Minutes" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <br />
    <br />
    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
</asp:Content>
