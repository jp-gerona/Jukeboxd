<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MP2_IT114L.Checkout" %>

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
            <asp:HyperLink ID="logo" runat="server" NavigateUrl="./home.html" CssClass="site-logo">
                <asp:Image ID="logoImage" runat="server" ImageUrl="../images/logo/Jukeboxd-full.svg" AlternateText="Jukeboxd Logo" />
            </asp:HyperLink>

            <asp:Panel ID="homeSearchBar" runat="server" CssClass="search-bar">
                <asp:TextBox ID="searchBox" runat="server" TextMode="SingleLine" placeholder="Search for vinyl records"></asp:TextBox>
                <i class="ri-search-line"></i>
            </asp:Panel>

            <div class="customer-links">
                <asp:HyperLink ID="profileLink" runat="server" NavigateUrl="./profile.aspx" CssClass="btn btn-primary">Profile</asp:HyperLink>
                <asp:HyperLink ID="checkoutLink" runat="server" NavigateUrl="./checkout.aspx" CssClass="btn btn-primary">
            <i class="ri-shopping-cart-2-fill"></i><span>0</span>
                </asp:HyperLink>
            </div>
        </nav>

        <nav class="nav-bar-squished">
            <div class="nav-squished-container-1">
                <asp:HyperLink ID="logo2" runat="server" NavigateUrl="./home.aspx" CssClass="site-logo">
                    <asp:Image ID="logoImage2" runat="server" ImageUrl="../images/logo/Jukeboxd-full-dark.svg" AlternateText="Jukeboxd Logo" />
                </asp:HyperLink>
                <div class="customer-links">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./checkout.aspx" CssClass="btn btn-primary">
                <i class="ri-shopping-cart-2-fill"></i><span>0</span>
                    </asp:HyperLink>
                </div>
            </div>

            <div class="nav-squished-container-2">
                <asp:Panel ID="Panel1" runat="server" CssClass="search-bar">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" placeholder="Search for vinyl records"></asp:TextBox>
                    <i class="ri-search-line"></i>
                </asp:Panel>
                <div class="customer-links">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./profile.aspx" CssClass="btn btn-primary">Profile</asp:HyperLink>
                </div>
            </div>
        </nav>

        <main class="main-checkout" id="main1" runat="server">
            <header>
                <h2>Checkout</h2>
                <asp:HyperLink runat="server" CssClass="btn btn-accent" NavigateUrl="./home.aspx">Continue shopping</asp:HyperLink>
            </header>

            <section class="checkout">
                <div class="cart-summary" runat="server" id="cartSummary">
                    <div class="records-summary">

                        <!-- Example of 1 record inside cart summary-->
                        <div class="record-container" runat="server" id="recordContainer1">
                            <div class="cover-container">
                                <asp:Image runat="server" ID="recordImage1" ImageUrl="../images/vinyls/thriller-michaeljackson.png" AlternateText="Album Picture" />
                            </div>
                            <div class="record-details">
                                <div class="record-header">
                                    <div class="record-title-artist">
                                        <h4>Thriller</h4>
                                        <p>Michael Jackson</p>
                                    </div>
                                    <div class="record-summary-price">&#8369; 2,499.00</div>
                                </div>
                                <div class="record-footer">
                                    <p>Qty:<span id="qty1" runat="server">1</span></p>
                                    <p class="link" id="remove1" runat="server">Remove</p>
                                </div>
                            </div>
                        </div>

                        <!-- Other examples to fill -->
                        <div class="record-container" runat="server" id="recordContainer2">
                            <div class="cover-container">
                                <asp:Image runat="server" ID="recordImage2" ImageUrl="../images/vinyls/thriller-michaeljackson.png" AlternateText="Album Picture" />
                            </div>
                            <div class="record-details">
                                <div class="record-header">
                                    <div class="record-title-artist">
                                        <h4>Thriller</h4>
                                        <p>Michael Jackson</p>
                                    </div>
                                    <div class="record-summary-price">&#8369; 2,499.00</div>
                                </div>
                                <div class="record-footer">
                                    <p>Qty:<span id="qty2" runat="server">1</span></p>
                                    <p class="link" id="remove2" runat="server">Remove</p>
                                </div>
                            </div>
                        </div>

                        <div class="record-container" runat="server" id="recordContainer3">
                            <div class="cover-container">
                                <asp:Image runat="server" ID="recordImage3" ImageUrl="../images/vinyls/thriller-michaeljackson.png" AlternateText="Album Picture" />
                            </div>
                            <div class="record-details">
                                <div class="record-header">
                                    <div class="record-title-artist">
                                        <h4>Thriller</h4>
                                        <p>Michael Jackson</p>
                                    </div>
                                    <div class="record-summary-price">&#8369; 2,499.00</div>
                                </div>
                                <div class="record-footer">
                                    <p>Qty:<span id="qty3" runat="server">1</span></p>
                                    <p class="link" id="remove3" runat="server">Remove</p>
                                </div>
                            </div>
                        </div>
                        <!--  End of examples -->
                    </div>

                    <div class="summary-total">
                        <h4>Total:</h4>
                        <h4>&#8369; <span runat="server" id="totalAmount">7,497.00</span></h4>
                    </div>
                </div>

                <div class="billing-address">
                    <h4>Address</h4>
                    <fieldset>
                        <legend>
                            <asp:Label runat="server" AssociatedControlID="address">Shipping Address</asp:Label></legend>
                        <asp:TextBox runat="server" ID="address" placeholder="Your address" Required="true" AutoComplete="street-address"></asp:TextBox>
                    </fieldset>

                    <div class="submit-container">
                        <asp:Button runat="server" ID="checkoutButton" CssClass="btn btn-secondary" Text="Check out" />
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
