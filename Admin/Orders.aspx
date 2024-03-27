<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="MP2_IT114L.Admin.Orders" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon">
  <title>Jukeboxd</title>

  <link rel="preload" href="../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin>

  <link rel="stylesheet" href="../styles/general.css">
  <link rel="stylesheet" href="../styles/admin.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
    <form runat="server">
        <nav class="sidebar">
            <a href="../index.html" class="site-logo">
                <h2>Jukeboxd</h2>
            </a>
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
                        <div class="nav-link active">
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

            <h3>Orders</h3>

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
        <h3>Orders</h3>
        <div class="actions">
          <button class="btn asp-search-popover"><i class="ri-search-line"></i></button>
        </div>
      </header>
      <section class="products-section">
        <div class="table-container">
          <asp:Table ID="AspNetTable" CssClass="asp-records-table" runat="server">
            <asp:TableHeaderRow>
              <asp:TableHeaderCell>Date</asp:TableHeaderCell>
              <asp:TableHeaderCell>Product</asp:TableHeaderCell>
              <asp:TableHeaderCell>Acct. ID</asp:TableHeaderCell>
              <asp:TableHeaderCell>Qty.</asp:TableHeaderCell>
              <asp:TableHeaderCell>Subtotal</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
              <asp:TableCell>March 26, 2024</asp:TableCell>
              <asp:TableCell>
                <asp:Image ID="ProductImage" runat="server" ImageUrl="../images/vinyls/thriller-michaeljackson.png" />
                Thriller
              </asp:TableCell>
              <asp:TableCell>C00000001</asp:TableCell>
              <asp:TableCell>2</asp:TableCell>
              <asp:TableCell CssClass="amount">&#8369; 4998.00</asp:TableCell>
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
