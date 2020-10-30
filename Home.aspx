<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ActivityTracker.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <br />
    <br />
    <asp:Label ID="lblWeeklyTopPerformer" runat="server" Text="This week's top performer: " Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblMonthlyTopPerformer" runat="server" Text="This month's top performer: " Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:HyperLink ID="lnkActivityEntry" runat="server" NavigateUrl="~/ActivityEntry.aspx" Text="Enter Activities"></asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="lnkReports" runat="server" NavigateUrl="~/Reports.aspx" Text="View Reports"></asp:HyperLink>
    <br />
    <br />
    <hr style="background-color: firebrick; height: 10px;"/>

    <br />
    <br />
    <table style="width:80%;">
        <tr>
            <td style="width: 50%;">
                <asp:GridView ID="gvWeekRanking" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" Caption="Weekly Ranking" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Club Member" />
                        <asp:BoundField DataField="ActivityMinutes" HeaderText="Total Minutes" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
            <td style="width: 50%;">
                <asp:GridView ID="gvMonthRanking" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Monthly Ranking" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Club Member" />
                        <asp:BoundField DataField="ActivityMinutes" HeaderText="Total Minutes" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
        </tr>
    </table>

    <br />
    <br />
    <hr style="background-color: firebrick; height: 10px;"/>
    
    <table style="width: 100%;">
        <tr>
            <td style="width: 33%;"><asp:Image runat="server" ID="imgPush" ImageUrl="~/Images/pushyourself.jpg" Width="307px" /></td>
            <td style="width: 33%;"><asp:Label runat="server" ID="lblQuote" Font-Bold="True" Font-Italic="True"></asp:Label></td>
            <td style="width: 33%;"><asp:Image runat="server" ID="imgExcuses" ImageUrl="~/Images/excuses.jpg" /></td>
        </tr>
    </table>
</asp:Content>

