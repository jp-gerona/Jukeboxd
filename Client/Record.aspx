<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Record.aspx.cs" Inherits="MP2_IT114L.Record1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
    <title>Jukeboxd • We sell everything vinyl.</title>

    <link rel="preload" href="../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin />

    <link rel="stylesheet" href="../styles/general.css" />
    <link rel="stylesheet" href="../styles/customer.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <nav class="nav-bar">
            <asp:HyperLink ID="logo" runat="server" CssClass="site-logo" NavigateUrl="./home.aspx">
                <asp:Image ID="logoImage" runat="server" ImageUrl="../images/logo/Jukeboxd-full.svg" AlternateText="Jukeboxd Logo" />
            </asp:HyperLink>

            <asp:Panel runat="server" CssClass="search-bar" ID="homeSearchBar">
                <asp:TextBox runat="server" Placeholder="Search for vinyl records" />
                <i class="ri-search-line"></i>
            </asp:Panel>

            <div class="customer-links">
                <asp:HyperLink ID="profileLink" runat="server" CssClass="btn btn-primary" NavigateUrl="./Profile.aspx">Profile</asp:HyperLink>
                <asp:HyperLink ID="checkoutLink" runat="server" CssClass="btn btn-primary">
            <i class="ri-shopping-cart-2-fill"></i><span>0</span>
                </asp:HyperLink>
            </div>
        </nav>

        <nav class="nav-bar-squished">
            <div class="nav-squished-container-1">
                <asp:HyperLink ID="logo2" runat="server" CssClass="site-logo" NavigateUrl="./home.aspx">
                    <asp:Image ID="logoImage2" runat="server" ImageUrl="../images/logo/Jukeboxd-full.svg" AlternateText="Jukeboxd Logo" />
                </asp:HyperLink>

                <div class="customer-links">
                    <asp:HyperLink ID="checkoutLink2" runat="server" CssClass="btn btn-primary">
                <i class="ri-shopping-cart-2-fill"></i><span>0</span>
                    </asp:HyperLink>
                </div>
            </div>

            <div class="nav-squished-container-2">
                <asp:TextBox ID="searchBox2" runat="server" placeholder="Search for vinyl records"></asp:TextBox>
                <i class="ri-search-line"></i>
                <div class="customer-links">
                    <asp:HyperLink ID="profileLink2" runat="server" CssClass="btn btn-primary" NavigateUrl="./Profile.aspx">Profile</asp:HyperLink>
                </div>
            </div>
        </nav>

        <main id="main-store">
            <section class="record-full-details">
                <div class="record-info">
                    <div class="cover-container">
                        <asp:Image ID="recordImage" runat="server" AlternateText="Album Picture" />
                    </div>
                    <h2 class="recordname" runat="server" id="recordname"></h2>
                    <h3 class="H_artist" runat="server" id="H_artist"></h3>
                    <h4 class="genre" runat="server" id="genre"></h4>
                    <span class="description" runat="server" id="description"></span>
                </div>
                <div class="record-price">
                    <div class="addtocartform">
                        <div class="price-label">
                            <div class="price">
                                <h4 class="totalPrice" runat="server" id="totalPrice">Total Price:</h4>
                                <div class="pricecontainer" id="pricecontainer"></div>
                            </div>
                        </div>
                        <asp:DropDownList ID="quantityDropdown" runat="server">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="addtocartform" runat="server" type="submit" Text="Add to Cart" CssClass="btn btn-primary" />
                    </div>
                </div>
            </section>

            <footer>
                <p>Copyright &copy; 2024 Orbit.</p>
                <button class="btn btn-accent"
                    type="button"
                    aria-label="Change to light theme"
                    id="themeButton">
                    <i class="ri-sun-fill"></i>
                </button>
            </footer>
        </main>
    </form>
    <script src="../scripts/theme.js"></script>
</body>
</html>
