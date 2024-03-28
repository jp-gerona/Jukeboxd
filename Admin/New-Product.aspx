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
            <asp:HyperLink ID="siteLogoLink" runat="server" NavigateUrl="./Dashboard.aspx" CssClass="site-logo">
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
                            <asp:Label AssociatedControlID="TB_RecordName" Text="Title" runat="server" />
                        </legend>
                        <asp:TextBox ID="TB_RecordName" runat="server" placeholder="Name of vinyl record" />
                        <asp:RequiredFieldValidator ID="TB_RecordName_Validator" runat="server"
                            ControlToValidate="TB_RecordName"
                            ErrorMessage="Record name is required!"
                            Text="Record name is required!"
                            ForeColor="Red"
                            Display="Dynamic" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="TB_Artist" Text="Artist" runat="server" />
                        </legend>
                        <asp:TextBox ID="TB_Artist" runat="server" placeholder="Artist of vinyl record" />
                        <asp:RequiredFieldValidator ID="TB_Artist_Validator" runat="server"
                            ControlToValidate="TB_Artist"
                            ErrorMessage="Artist name is required!"
                            Text="Artist name is required!"
                            ForeColor="Red"
                            Display="Dynamic" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="FU_Image" Text="Upload image of Vinyl Record" runat="server" />
                        </legend>
                        <asp:FileUpload ID="FU_Image" CssClass="image-upload" runat="server" Accept=".png,.jpg" />
                    </fieldset>

                    <fieldset class="genre-select">
                        <legend>
                            <asp:Label AssociatedControlID="DDL_Genre" Text="Genre" runat="server" />
                        </legend>
                        <asp:DropDownList ID="DDL_Genre" runat="server">
                            <asp:ListItem Disabled="true" Selected="true" Text="Choose genre of vinyl record" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Rock" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Pop" Value="2"></asp:ListItem>
                            <asp:ListItem Text="RNB" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Jazz" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                        <i class="ri-arrow-drop-down-line"></i>
                        <asp:RequiredFieldValidator ID="DDL_Genre_Validator" runat="server"
                            ControlToValidate="DDL_Genre"
                            InitialValue="-1"
                            ErrorMessage="Genre selection is required!"
                            Text="Genre selection is required!"
                            ForeColor="Red"
                            Display="Dynamic" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="TB_Price" Text="Price" runat="server" />
                        </legend>
                        <asp:TextBox ID="TB_Price" runat="server" placeholder="Price of vinyl record (PHP)" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="TB_Price"
                            ErrorMessage="Price is required!"
                            Text="Price is required!"
                            ForeColor="Red"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="TB_Price_Validator" runat="server"
                            ControlToValidate="TB_Price"
                            ErrorMessage="Please Enter Only Numbers"
                            ValidationExpression="^\d+(\.\d+)?$"
                            ForeColor="Red"
                            Display="Dynamic" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="TB_Stock" Text="Stock" runat="server" />
                        </legend>
                        <asp:TextBox ID="TB_Stock" runat="server" placeholder="Stock of vinyl record" />
                        <asp:RequiredFieldValidator ID="TB_Stock_Validator" runat="server"
                            ControlToValidate="TB_Stock"
                            ErrorMessage="Stock is required!"
                            Text="Stock is required!"
                            ForeColor="Red"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="TB_Stock"
                            ErrorMessage="Please Enter Only Numbers"
                            ValidationExpression="^\d+$"
                            ForeColor="Red"
                            Display="Dynamic" />
                    </fieldset>

                    <fieldset>
                        <legend>
                            <asp:Label AssociatedControlID="TB_Description" Text="Description" runat="server" />
                        </legend>
                        <asp:TextBox ID="TB_Description" runat="server" placeholder="Detailed description of vinyl record, including the media condition, jacket condition and tracklist." TextMode="MultiLine"/>
                    </fieldset>

                    <div class="submit-container">
                        <asp:Button ID="submit_add_product" runat="server" CssClass="btn btn-primary" Text="Create Product" UseSubmitBehavior="true" OnClick="AddRecord_Click" />
                    </div>

                </asp:Panel>

            </section>

            <footer>
                <p>Copyright &copy; <%: DateTime.Now.Year %> Orbit.</p>
                <asp:Button ID="themeButton" runat="server" CssClass="btn btn-accent ri-sun-fill" aria-label="Change to light theme" OnClientClick="return false;" Text="&#xF1BC;" />
            </footer>
        </main>

        <script src="../scripts/admin.js"></script>
        <script src="../scripts/theme.js"></script>
    </form>
</body>
</html>
