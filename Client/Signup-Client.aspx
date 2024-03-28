<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup-Client.aspx.cs" Inherits="MP2_IT114L.Signup_Client2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jukeboxd</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
    <script src="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.js"></script>
    <link rel="stylesheet" href="../styles/general.css" />
    <link rel="stylesheet" href="../styles/customer.css" />
    <script>
        function validateForm() {
            var username = document.getElementById('<%= TB_username.ClientID %>').value.trim();
            var email = document.getElementById('<%= TB_email.ClientID %>').value.trim();
            var password = document.getElementById('<%= TB_password.ClientID %>').value.trim();
            var password2 = document.getElementById('<%= TB_password2.ClientID %>').value.trim();

            document.getElementById('errorUsername').innerText = '';
            document.getElementById('errorEmail').innerText = '';
            document.getElementById('errorPassword').innerText = '';
            document.getElementById('errorPassword2').innerText = '';

            if (username === '') {
                document.getElementById('errorUsername').innerText = 'Username is required.';
                return false;
            }
            if (email === '') {
                document.getElementById('errorEmail').innerText = 'Email is required.';
                return false;
            }
            if (password === '') {
                document.getElementById('errorPassword').innerText = 'Password is required.';
                return false;
            }
            if (password2 === '') {
                document.getElementById('errorPassword2').innerText = 'Please re-enter your password.';
                return false;
            }

            if (email.indexOf('@') === -1) {
                document.getElementById('errorEmail').innerText = 'Invalid email format.';
                return false;
            }

            if (password !== password2) {
                document.getElementById('errorPassword2').innerText = 'Passwords do not match.';
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <main id="main-signup">
            <div class="signup-container">
                <header>
                    <a class="site-logo" href="./home.aspx">
                        <img src="../images/logo/Jukeboxd-full.svg" alt="Jukeboxd Logo" />
                    </a>
                    <a class="link" href="../Login.aspx">Log in</a>
                </header>
                <h2>Join now to buy vinyl records!</h2>
                <fieldset>
                    <legend><label for="TB_username">Name (e.g. Juan Dela Cruz)</label></legend>
                    <asp:TextBox ID="TB_username" runat="server" placeholder="Enter username"></asp:TextBox>
                    <span id="errorUsername"></span>
                </fieldset>     
                <fieldset>
                    <asp:TextBox ID="TB_email" runat="server" placeholder="Enter email"></asp:TextBox>
                    <legend><label for="email">Email</label></legend>
                    <span id="errorEmail"></span>
                </fieldset>                
                <fieldset>
                    <legend><label for="password">Password</label></legend>
                    <asp:TextBox ID="TB_password" TextMode="Password" runat="server" placeholder="Enter password"></asp:TextBox>
                    <span id="errorPassword"></span>
                </fieldset>              
                <fieldset>
                    <legend><label for="address">Confirm Password</label></legend>
                    <asp:TextBox ID="TB_password2" TextMode="Password" runat="server" placeholder="Re-enter password"></asp:TextBox>
                    <span id="errorPassword2"></span>
                </fieldset>               
                <fieldset>
                    <asp:Button ID="CreateAccount" runat="server" Text="Create Account" OnClientClick="return validateForm()" OnClick="CreateAccount_Click" CssClass="btn btn-primary"/>
                </fieldset>                
                <asp:Label ID="LblAccountId" runat="server" Text=""></asp:Label>
                <a href="../Login.aspx">Back to Login</a>
            </div>
            <div class="signup-background-container"></div>
        </main>
    </form>
</body>
</html>
