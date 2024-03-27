<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MP2_IT114L.dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../images/logo/Jukeboxd-favicon.png" type="image/x-icon">
    <title>Jukeboxd</title>

    <link rel="preload" href="../../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin>

    <link rel="stylesheet" href="../../styles/general.css">
    <link rel="stylesheet" href="../../styles/admin.css">
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
                <div class="nav-link active">
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
                <div class="nav-link">
                    <i class="ri-user-fill"></i>Users
                </div>
                    </asp:HyperLink>
                    <asp:HyperLink ID="AnalyticsLink" runat="server" NavigateUrl="./analytics.aspx">
                <div class="nav-link">
                    <i class="ri-bar-chart-fill"></i>Analytics
                </div>
                    </asp:HyperLink>
                </div>
                <asp:HyperLink ID="LogoutLink" runat="server" NavigateUrl="../index.aspx">
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
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./dashboard.aspx">
            <div class="nav-link"><i class="ri-dashboard-2-fill"></i>Dashboard</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./products.aspx">
            <div class="nav-link active"><i class="ri-store-2-fill"></i>Products</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./orders.aspx">
            <div class="nav-link"><i class="ri-money-dollar-circle-fill"></i>Orders</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users.aspx">
            <div class="nav-link"><i class="ri-user-fill"></i>Users</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./analytics.aspx">
            <div class="nav-link"><i class="ri-bar-chart-fill"></i>Analytics</div>
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../index.aspx">
            <div class="nav-link"><i class="ri-logout-box-line"></i>Logout</div>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <header>
                <h3>Dashboard</h3>
            </header>

            <section class="dashboard-section">
                <h1>Welcome back!</h1>
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
