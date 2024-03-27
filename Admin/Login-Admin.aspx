<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login-Admin.aspx.cs" Inherits="MP2_IT114L.Login_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jukeboxd</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="../styles/general.css" />
    <link rel="stylesheet" href="../styles/admin.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="preload" href="../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin />
</head>
<body>
    <form id="form1" runat="server">
        <main id="main-login">
            <a class="site-logo" href="../customer/home.html">
                <img src="../images/logo/Jukeboxd-full.svg" alt="Site Logo" />
            </a>
            <div class="admin-login-container flex-center">
                <a class="link" href="../customer/home.html"><i class="ri-arrow-left-line"></i>Go back</a>
                <div>
                    <h1>Admin Page</h1>
                    <fieldset>
                        <legend>Email</legend>
                        <asp:TextBox ID="TB_email" runat="server" placeholder="Enter email" autocomplete="email"></asp:TextBox> <br />
                    </fieldset>
                    <fieldset>
                        <legend>Password</legend>
                        <asp:TextBox ID="TB_password" TextMode="Password" runat="server" placeholder="Enter password"></asp:TextBox> <br />
                    </fieldset>
                    <div class="submit-container">
                        <asp:Button ID="LogAccount" runat="server" Text="Login" OnClientClick="return validateForm()" OnClick="LogAccount_Click" CssClass="btn btn-primary" /> <br />
                    </div>
                    <a href="../customer/home.html">Go back</a>
                </div>
            </div>
        </main>
    </form>
    <script src="../scripts/admin.js"></script>
</body>
</html>
