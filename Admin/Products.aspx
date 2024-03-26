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
            <form runat="server">
            <div class="actions">
                <asp:Button ID="btnSearch" runat="server" cssclass="btn icon ri-search-line" text="&#xF0D1;"/>
                <asp:HyperLink ID="lnkNewProduct" runat="server" NavigateUrl="~/Products/New.aspx" CssClass="btn btn-accent asp-add-product">
                    New Product
                </asp:HyperLink>
            </div>
            </form>
        </header>
        
        <section class="products-section">
            <div class="table-container">
                <table class="asp-records-table">
                    <thead>
                        <tr>
                            <th>Prod. ID</th>
                            <th>Title</th>
                            <th>Artist</th>
                            <th>Genre</th>
                            <th>Stock</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>
                                <img src="../images/vinyls/thriller-michaeljackson.png">
                                Thriller
                            </td>
                            <td>Michael Jackson</td>
                            <td>Disco</td>
                            <td>23</td>
                            <td class="amount">&#8369; 2,499.00</td>
                            <td class="action">
                                <button class="btn btn-danger asp-delete-button">Delete</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>
                                <img src="../images/vinyls/bad-michaeljackson.png">
                                Bad
                            </td>
                            <td>Michael Jackson</td>
                            <td>Disco</td>
                            <td>12</td>
                            <td class="amount">&#8369; 1,999.00</td>
                            <td class="action">
                                <button class="btn btn-danger asp-delete-button">Delete</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>
                                <img src="../images/vinyls/streettalk-steveperry.jpeg">
                                Street Talk
                            </td>
                            <td>Steve Perry</td>
                            <td>Rock</td>
                            <td>0</td>
                            <td class="amount">&#8369; 1,199.00</td>
                            <td class="action">
                                <button class="btn btn-danger asp-delete-button">Delete</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>
                                <img src="../images/vinyls/raise-earthwindfire.jpeg">
                                Raise!
                            </td>
                            <td>Earth, Wind & Fire</td>
                            <td>Disco</td>
                            <td>33</td>
                            <td class="amount">&#8369; 999.00</td>
                            <td class="action">
                                <button class="btn btn-danger asp-delete-button">Delete</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <button disabled class="btn asp-prev"><i class="ri-arrow-left-s-line"></i>Prev</button>
                <span class="asp-page-info">Page 1 of 10</span>
                <button class="btn asp-next"><i class="ri-arrow-right-s-line"></i>Next</button>
            </div>
        </section>

        <footer>
            <p>Copyright &copy; 2024 Orbit.</p>
            <button class="btn btn-accent light-dark-toggle"><i class="ri-sun-fill"></i></button>
        </footer>
    </main>

    <script src="../scripts/admin.js"></script>
</body>
</html>
