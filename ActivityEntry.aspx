<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ActivityEntry.aspx.cs" Inherits="ActivityTracker.ActivityEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

        <div>
            <table>
                <tr>
                    <td><asp:Label runat="server" ID="lblUser" Text="Who Did It:"></asp:Label></td><td><asp:DropDownList runat="server" ID="ddlUsers" AutoPostBack="True" AppendDataBoundItems="True" CausesValidation="True">
                        <asp:ListItem Selected="True" Value="-99">-- Select Person --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvUser" runat="server" Display="Dynamic" ErrorMessage="* Please select a person." Font-Bold="True" ForeColor="#990000" SetFocusOnError="True" ControlToValidate="ddlUsers" InitialValue="-99"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" ID="lblActivity" Text="What Did They Do:"></asp:Label></td><td><asp:TextBox runat="server" ID="txtActivity" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="txtActivity" Display="Dynamic" ErrorMessage="* Please enter an activity." Font-Bold="True" ForeColor="#990000" SetFocusOnError="True" Visible="True"></asp:RequiredFieldValidator>
                                                                                                             </td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" ID="lblActivityDate" Text="What Day Did They Do It:"></asp:Label></td><td><asp:TextBox runat="server" ID="txtActivityDate" TextMode="Date" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvActivityDate" runat="server" ControlToValidate="txtActivityDate" Display="Dynamic" ErrorMessage="* Please select a date." Font-Bold="True" ForeColor="#990000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" ID="lblActivityMinutes" Text="How Long Did They Do It (in minutes):"></asp:Label></td><td><asp:TextBox runat="server" ID="txtActivityMinutes" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvActivityMinutes" runat="server" ControlToValidate="txtActivityMinutes" Display="Dynamic" ErrorMessage="* Please enter the number of minutes." Font-Bold="True" ForeColor="#990000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvActivityMinutes" runat="server" ControlToValidate="txtActivityMinutes" Display="Dynamic" ErrorMessage="* Please enter a valid number." Font-Bold="True" ForeColor="#990000" SetFocusOnError="True" MaximumValue="9999" MinimumValue="1" Visible="True" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left;"><asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" /></td>
                </tr>
                </table>

            <br />
            <br />

            <asp:Label ID="lblLastTenEntries" runat="server"></asp:Label>
            <br />
            <br />

            <asp:GridView ID="gvLastTenEntries" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

            <br />
            <br />
            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        </div>

</asp:Content>
