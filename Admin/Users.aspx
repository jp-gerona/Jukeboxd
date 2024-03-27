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
            <asp:HyperLink ID="siteLogoLink" runat="server" NavigateUrl="../customer/index.html" CssClass="site-logo">
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

            <h3>Users</h3>

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
            <header class="header">
                <h3>Users</h3>
                <div class="actions">
                    <button class="btn asp-search-popover"><i class="ri-search-line"></i></button>
                </div>
            </header>
            <section class="products-section">
                <div class="table-container">
                    <asp:Table ID="AspNetTable" CssClass="asp-records-table" runat="server">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>Acct. ID</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Username</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Address</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell>C00000001</asp:TableCell>
                            <asp:TableCell>Lebron_James</asp:TableCell>
                            <asp:TableCell>lebronjames@gmail.com</asp:TableCell>
                            <asp:TableCell>Los Angeles, CA</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>


                <div class="pagination">
                    <button disabled class="btn asp-prev"><i class="ri-arrow-left-s-line"></i>Prev</button>
                    <span class="asp-page-info">Page 1 of 1</span>
                    <button disabled class="btn asp-next"><i class="ri-arrow-right-s-line"></i>Next</button>
                </div>
            </section>

            <footer>
                <p>Copyright &copy; 2024 Orbit.</p>
                <button class="btn btn-accent light-dark-toggle"><i class="ri-sun-fill"></i></button>
            </footer>
        </main>
    </form>

    <script src="../scripts/admin.js"></script>
</body>
</html>
