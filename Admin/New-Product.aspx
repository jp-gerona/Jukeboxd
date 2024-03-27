<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New-Product.aspx.cs" Inherits="MP2_IT114L.New_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

            <h3>Add new product</h3>

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
                <h3>Add new product</h3>
                <div class="actions">
                    <div class="actions">
                        <asp:HyperLink ID="cancelLink" runat="server" NavigateUrl="./Products.aspx" CssClass="btn asp-search-popover">
                            <i class="ri-close-circle-line"></i>Cancel
                        </asp:HyperLink>
                    </div>
                </div>
            </header>

            <section class="new-product-section">

                <asp:Panel ID="form_add_product" runat="server">
                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="txtRecordName" Text="Title" runat="server" />
                        </legend>
                        <asp:TextBox ID="txtRecordName" runat="server" />
                        <%--<input type="text" placeholder="Name of vinyl record" id="record_name" />--%>
                    </fieldset>

                    <fieldset>
                        <legend>
                            <label for="Artist">Artist</label></legend>
                        <input type="text" placeholder="Artist of vinyl record" id="Artist" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <label for="imageUpload">Upload image of Vinyl Record</label></legend>
                        <input class="image-upload" type="file" id="imageUpload" name="imageUpload" accept="image/*" />
                    </fieldset>

                    <fieldset class="genre-select">
                        <legend>
                            <label for="Genre">Genre</label></legend>
                        <select id="Genre">
                            <option value="" selected>Choose genre of vinyl record</option>
                            <option value="Disco">Disco</option>
                            <option value="Hip-hop">Hip-hop</option>
                            <option value="Pop">Pop</option>
                            <option value="RnB">RnB</option>
                            <option value="Rock">Rock</option>
                            <option value="Jazz">Jazz</option>
                        </select>
                        <i class="ri-arrow-drop-down-line"></i>
                    </fieldset>

                    <fieldset>
                        <legend>
                            <label for="Price">Price</label></legend>
                        <input type="text" placeholder="Price of vinyl record (PHP)" id="Price" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <label for="Stock">Stock</label></legend>
                        <input type="text" placeholder="Stock of vinyl record" id="Stock" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <label for="Description">Description</label></legend>
                        <textarea type="text" placeholder="Detailed description of vinyl record, including the media condition, jacket condition and tracklist." id="Description"></textarea>
                    </fieldset>

                    <div class="submit-container">
                        <button type="submit" class="btn btn-primary" id="submit_add_product">Create Product</button>
                    </div>

                </asp:Panel>

            </section>

            <footer>
                <p>Copyright &copy; <%: DateTime.Now.Year %> Orbit.</p>
                <asp:Button ID="themeButton" runat="server" CssClass="btn btn-accent ri-sun-fill" ClientIDMode="Static" type="button" aria-label="Change to light theme" OnClientClick="return false;" Text="&#xF1BC;" />
            </footer>
        </main>

        <script src="../scripts/admin.js"></script>
        <script src="../scripts/theme.js"></script>
    </form>
</body>
</html>
