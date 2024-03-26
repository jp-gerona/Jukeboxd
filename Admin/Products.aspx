<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MP2_IT114L.Records" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" href="~/Styles/general.css" />
    <link rel="stylesheet" type="text/css" href="~/Styles/admin.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <nav class="sidebar">
            <a href="../index.html" class="site-logo">
                <h2>Jukeboxd</h2>
            </a>
            <div class="nav-links">
                <div>
                    <asp:HyperLink ID="lnkDashboard" runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="nav-link">
                    <i class="ri-dashboard-2-fill"></i>Dashboard
                    </asp:HyperLink>
                    <asp:HyperLink ID="lnkProducts" runat="server" NavigateUrl="~/Products.aspx" CssClass="nav-link active">
                    <i class="ri-store-2-fill"></i>Products
                    </asp:HyperLink>
                    <asp:HyperLink ID="lnkOrders" runat="server" NavigateUrl="~/Orders.aspx" CssClass="nav-link">
                    <i class="ri-money-dollar-circle-fill"></i>Orders
                    </asp:HyperLink>
                    <asp:HyperLink ID="lnkUsers" runat="server" NavigateUrl="~/Users.aspx" CssClass="nav-link">
                    <i class="ri-user-fill"></i>Users
                    </asp:HyperLink>
                    <asp:HyperLink ID="lnkAnalytics" runat="server" NavigateUrl="~/Analytics.aspx" CssClass="nav-link">
                    <i class="ri-bar-chart-fill"></i>Analytics
                    </asp:HyperLink>
                </div>
                <asp:HyperLink ID="lnkLogout" runat="server" NavigateUrl="~/Index.aspx" CssClass="nav-link">
        <i class="ri-logout-box-line"></i>Logout
                </asp:HyperLink>
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

                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">1</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Image ID="Image1" runat="server" ImageUrl="../images/vinyls/thriller-michaeljackson.png" />
                                Thriller
                            </asp:TableCell>
                            <asp:TableCell runat="server">Michael Jackson</asp:TableCell>
                            <asp:TableCell runat="server">Disco</asp:TableCell>
                            <asp:TableCell runat="server">23</asp:TableCell>
                            <asp:TableCell runat="server" CssClass="amount">&#8369; 2,499.00</asp:TableCell>
                            <asp:TableCell runat="server" CssClass="action">
                                <asp:Button ID="Button1" runat="server" Text="Delete" CssClass="btn btn-danger asp-delete-button" />
                            </asp:TableCell>
                        </asp:TableRow>


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
            <%--<footer>
                <p>Copyright &copy; 2024 Orbit.</p>
                <button class="btn btn-accent light-dark-toggle"><i class="ri-sun-fill"></i></button>
            </footer>--%>
        </main>

        <script src="../scripts/admin.js"></script>
    </form>
</body>
</html>
