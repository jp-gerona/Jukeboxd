<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MP2_IT114L.Client.Profile" %>

<!DOCTYPE html>

<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" href="../images/logo/Jukeboxd-favicon.png" type="image/x-icon" />
  <title>Jukeboxd • We sell everything vinyl.</title>

  <link rel="preload" href="../fonts/clash-display/WEB/fonts/ClashDisplay-Variable.woff2" as="font" type="font/woff2" crossorigin="crossorigin" />

  <link rel="stylesheet" href="../styles/general.css" />
  <link rel="stylesheet" href="../styles/customer.css" />
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
  <form runat="server">
    <nav class="nav-bar">
      <a href="home.aspx" class="site-logo" id="logo">
        <img src="../images/logo/Jukeboxd-full-dark.svg" alt="Jukeboxd Logo" />
      </a>

      <asp:Panel runat="server" CssClass="search-bar" ID="homeSearchBar">
        <asp:TextBox runat="server" Placeholder="Search for vinyl records" />
        <i class="ri-search-line"></i>
      </asp:Panel>

      <div class="customer-links">
        <a href="./profile.aspx" class="btn btn-primary">Profile</a>
        <a href="../CartTable.aspx" class="btn btn-primary"><i class="ri-shopping-cart-2-fill"></i><span>0</span></a>
      </div>
    </nav>

    <nav class="nav-bar-squished">
      <div class="nav-squished-container-1">
        <a href="./home.aspx" class="site-logo" id="logo2">
          <img src="../images/logo/Jukeboxd-full-dark.svg" alt="Jukeboxd Logo" />
        </a>

        <div class="customer-links"><a href="./checkout.html" class="btn btn-primary"><i class="ri-shopping-cart-2-fill"></i><span>0</span></a></div>
      </div>

      <div class="nav-squished-container-2">
        <asp:Panel runat="server" CssClass="search-bar" ID="searchBarSquished">
          <asp:TextBox runat="server" Placeholder="Search for vinyl records" />
          <i class="ri-search-line"></i>
        </asp:Panel>
        <div class="customer-links">
          <a href="./Profile.aspx" class="btn btn-primary">Profile</a>
        </div>
      </div>
    </nav>

    <main id="main-store">
      <section class="profile">
        <div class="profile-grid">

          <div class="profile-info">
            <h2>Profile</h2>
              <div class="profile-details">
                <h3 id="account_name">Juan Dela Cruz</h3>
                <span id="account_id">Account ID: CUS00001</span>
                <span id="email">juandelacruz@gmail.com</span>
              </div>
          </div>


          <div class="order-history">
            <h2>Order History</h2>
            <div class="table-container">
              <table class="asp-records-table">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Qty.</th>
                    <th>Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>March 26, 2024</td>
                    <td>
                      <img src="../images/vinyls/thriller-michaeljackson.png" />
                      Thriller
                    </td>
                    <td>2</td>
                    <td class="amount">&#8369; 4998.00</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>

      <footer>
        <button class="btn btn-accent"
  type="button"
  aria-label="Change to light theme"
  ID="themeButton">
  <i class="ri-sun-fill"></i>
</button>
      </footer>
    </main>
  </form>
  <script src="../scripts/customer.js"></script>
  <script src="../scripts/theme.js"></script>
</body>
</html>