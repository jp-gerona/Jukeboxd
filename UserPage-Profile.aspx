<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage-Profile.aspx.cs" Inherits="MP2_IT114L.UserPage_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>User Profile</h1>
            <div>
                <asp:Label ID="lblAccountInfo" runat="server" Text=""></asp:Label>
                <br />
                <asp:TextBox ID="TxtNewAddress" runat="server" placeholder="Enter new address"></asp:TextBox>
                <br />
                <asp:Button ID="BtnChangeAddress" runat="server" Text="Change Address" OnClick="BtnChangeAddress_Click" />
                <br />
                <asp:Button ID="BtnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
