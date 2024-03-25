<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartTable.aspx.cs" Inherits="MP2_IT114L.CartTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart List</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav>
                <a href="Index.aspx">Back</a>
            </nav>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
            <asp:Button ID="TruncateCart" runat="server" Text="Check Out" OnClick="TruncateCart_Click" />
            <br />

        </div>
    </form>
</body>
</html>