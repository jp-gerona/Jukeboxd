<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login-Client.aspx.cs" Inherits="MP2_IT114L.Login_Client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jukeboxd</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
    <link rel="preload" href="../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin />
    <link rel="stylesheet" href="../styles/general.css" />
    <link rel="stylesheet" href="../styles/customer.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <main id="main-login">
            <div class="login-container">
                <header>
                    <a class="site-logo" href="./home.html">
                        <img src="../images/logo/Jukeboxd-full.svg" alt="Jukeboxd Logo" />
                    </a>
                    <a class="link" href="../Client/Signup-Client.aspx">Sign up</a>
                </header>
                <h2>Log in</h2>
                <div>
                    <fieldset>
                        <legend><label for="TB_email">Email</label></legend>
                        <asp:TextBox ID="TB_email" runat="server" placeholder="Enter email" Required="true" AutoCompleteType="Email" CssClass="input-field" /> 
                    </fieldset>
                    <fieldset>
                        <legend><label for="TB_password">Password</label></legend>
                        <asp:TextBox ID="TB_password" runat="server" TextMode="Password" placeholder="Enter password" Required="true" CssClass="input-field" /> 
                    </fieldset>  
                    <fieldset>
                        <asp:Button ID="LogAccount" runat="server" Text="Login" OnClientClick="return validateForm()" OnClick="LogAccount_Click" CssClass="btn btn-primary" /> 
                    </fieldset>                    
                    <a href="./home.html"><i class="ri-arrow-left-line"></i>Go back to homepage</a>
                </div>
            </div>
            <div class="login-background-container"></div>
        </main>
    </form>
</body>
</html>
