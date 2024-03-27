<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MP2_IT114L.Records" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
    <title>Jukeboxd</title>

    <link rel="stylesheet" type="text/css" href="~/Styles/general.css" />
    <link rel="stylesheet" type="text/css" href="~/Styles/admin.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <nav class="sidebar">
            <asp:HyperLink ID="siteLogoLink" runat="server" NavigateUrl="../customer/index.html" CssClass="site-logo">
                <asp:Image ID="siteLogoImage" runat="server" ImageUrl="../images/logo/Jukeboxd-nav.svg" AlternateText="Sidebar Logo" />
            </asp:HyperLink>
            <div class="nav-links">
                <div>
                    <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="./dashboard.html">
                        <div class="nav-link">
                            <i class="ri-dashboard-2-fill"></i>Dashboard
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="ProductsLink" runat="server" NavigateUrl="./products.html">
                        <div class="nav-link active">
                            <i class="ri-store-2-fill"></i>Products
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="OrdersLink" runat="server" NavigateUrl="./orders.html">
                        <div class="nav-link">
                            <i class="ri-money-dollar-circle-fill"></i>Orders
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="UsersLink" runat="server" NavigateUrl="./users.html">
                        <div class="nav-link">
                            <i class="ri-user-fill"></i>Users
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="AnalyticsLink" runat="server" NavigateUrl="./analytics.html">
                        <div class="nav-link">
                            <i class="ri-bar-chart-fill"></i>Analytics
                        </div>
                    </asp:HyperLink>
                </div>
                <asp:HyperLink ID="LogoutLink" runat="server" NavigateUrl="../index.html">
                    <div class="nav-link">
                        <i class="ri-logout-box-line"></i>Logout
                    </div>
                </asp:HyperLink>
            </div>
        </nav>

        <nav class="topbar">
            <div class="site-logo">
                <asp:Image ID="TopbarLogo" runat="server" ImageUrl="../../images/logo/Jukeboxd-logo.svg" AlternateText="Topbar Logo" />
            </div>

            <h3>Products</h3>

            <div class="hamburger">
                <div class="ham-icon" onclick="toggleMenu()"><i class="ri-menu-fill"></i></div>
                <div class="nav-links">
                    <div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./dashboard.html">
                    <div class="nav-link"><i class="ri-dashboard-2-fill"></i>Dashboard</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./products.html">
                    <div class="nav-link active"><i class="ri-store-2-fill"></i>Products</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./orders.html">
                    <div class="nav-link"><i class="ri-money-dollar-circle-fill"></i>Orders</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users.html">
                    <div class="nav-link"><i class="ri-user-fill"></i>Users</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./analytics.html">
                    <div class="nav-link"><i class="ri-bar-chart-fill"></i>Analytics</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../index.html">
                    <div class="nav-link"><i class="ri-logout-box-line"></i>Logout</div>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <main>

            <header>
                <h3>Products</h3>
                <div class="actions">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn icon ri-search-line" Text="&#xF0D1;" />
                    <asp:HyperLink ID="lnkNewProduct" runat="server" NavigateUrl="~/Products/New.aspx" CssClass="btn btn-accent asp-add-product">
                    New Product
                    </asp:HyperLink>
                </div>
            </header>

            <section class="products-section">
                <div class="table-container">
                    <asp:Table ID="MyTable" runat="server" CssClass="asp-records-table">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>Prod. ID</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Title</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Artist</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Genre</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Stock</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                            <asp:TableHeaderCell></asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </div>

                <div class="pagination">
                    <asp:Button ID="PrevButton" runat="server" CssClass="btn asp-prev ri-arrow-left-s-line" Text='&#xEA64; Prev' Enabled="false" />
                    <span class="asp-page-info" runat="server">Page 1 of 10</span>
                    <asp:Button ID="NextButton" runat="server" CssClass="btn asp-next ri-arrow-right-s-line" Text='&#xEA6E; Next' />
                </div>
            </section>

            <footer>
                <p>Copyright &copy; <%: DateTime.Now.Year %> Orbit.</p>
                <asp:Button ID="ToggleDarkModeButton" runat="server" CssClass="btn btn-accent light-dark-toggle ri-sun-fill" Text='&#xF1BC;' />
            </footer>
        </main>

        <script src="../scripts/admin.js"></script>
    </form>
</body>
</html>
