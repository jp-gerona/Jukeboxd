<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="MP2_IT114L.Admin.Users" %>

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
            <asp:HyperLink ID="siteLogoLink" runat="server" NavigateUrl="./Dashboard.aspx" CssClass="site-logo">
                <asp:Image ID="siteLogoImage" runat="server" ImageUrl="../images/logo/Jukeboxd-nav.svg" AlternateText="Sidebar Logo" />
            </asp:HyperLink>
            <div class="nav-links">
                <div>
                    <asp:HyperLink ID="DashboardLink" runat="server" NavigateUrl="./dashboard.aspx">
                        <div class="nav-link">
                            <i class="ri-dashboard-2-fill"></i>Dashboard
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="ProductsLink" runat="server" NavigateUrl="./products.aspx">
                        <div class="nav-link">
                            <i class="ri-store-2-fill"></i>Products
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="OrdersLink" runat="server" NavigateUrl="./orders.aspx">
                        <div class="nav-link">
                            <i class="ri-money-dollar-circle-fill"></i>Orders
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="UsersLink" runat="server" NavigateUrl="./users.aspx">
                        <div class="nav-link active">
                            <i class="ri-user-fill"></i>Users
                        </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="AnalyticsLink" runat="server" NavigateUrl="./analytics.aspx">
                        <div class="nav-link">
                            <i class="ri-bar-chart-fill"></i>Analytics
                        </div>
                    </asp:HyperLink>
                </div>
                <asp:HyperLink ID="LogoutLink" runat="server" NavigateUrl="../Login.aspx">
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

            <h3>Users</h3>

            <div class="hamburger">
                <div class="ham-icon" onclick="toggleMenu()"><i class="ri-menu-fill"></i></div>
                <div class="nav-links">
                    <div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./dashboard.aspx">
                    <div class="nav-link"><i class="ri-dashboard-2-fill"></i>Dashboard</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./products.aspx">
                    <div class="nav-link"><i class="ri-store-2-fill"></i>Products</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./orders.aspx">
                    <div class="nav-link"><i class="ri-money-dollar-circle-fill"></i>Orders</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users.aspx">
                    <div class="nav-link active"><i class="ri-user-fill"></i>Users</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./analytics.aspx">
                    <div class="nav-link"><i class="ri-bar-chart-fill"></i>Analytics</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../Login.aspx">
                    <div class="nav-link"><i class="ri-logout-box-line"></i>Logout</div>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <header class="header">
                <h3>Users</h3>
                <div class="actions">
                    <button class="btn asp-search-popover"><i class="ri-search-line"></i></button>
                </div>
            </header>
            <section class="products-section">
                <div class="table-container">
                    <asp:Table ID="T_Users" CssClass="asp-records-table" runat="server">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>Acct. ID</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Username</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Address</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </div>


                <div class="pagination">
                    <asp:Button ID="PrevButton" runat="server" CssClass="btn asp-prev ri-arrow-left-s-line" Text='&#xEA64; Prev' OnClick="PreviousUser_Click" />
                    <span class="asp-page-info" runat="server" id="UserInfoSpan">Page 1 of 10</span>
                    <asp:Button ID="NextButton" runat="server" CssClass="btn asp-next ri-arrow-right-s-line" Text='&#xEA6E; Next' OnClick="NextUser_Click"/>
                </div>
            </section>

            <footer>
                <p>Copyright &copy; 2024 Orbit.</p>
                <asp:Button ID="themeButton" runat="server" CssClass="btn btn-accent ri-sun-fill" ClientIDMode="Static" type="button" aria-label="Change to light theme" OnClientClick="return false;" Text="&#xF1BC;" />
            </footer>
        </main>

        <script src="../scripts/admin.js"></script>
        <script src="../scripts/theme.js"></script>
    </form>
</body>
</html>
