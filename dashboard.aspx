<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="MP2_IT114L.dashboard" %>

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
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
  <nav class="sidebar">
    <a href="../index.html" class="site-logo">
      <img src="../../images/logo/Jukeboxd-nav.svg" alt="Sidebar Logo">
    </a>
    <div class="nav-links">
      <div>
        <a href="./dashboard.html"><div class="nav-link active"><i class="ri-dashboard-2-fill"></i>Dashboard</div></a>
        <a href="./products.html"><div class="nav-link"><i class="ri-store-2-fill"></i>Products</div></a>
        <a href="./orders.html"><div class="nav-link"><i class="ri-money-dollar-circle-fill"></i>Orders</div></a>
        <a href="./users.html"><div class="nav-link"><i class="ri-user-fill"></i>Users</div></a>
        <a href="./analytics.html"><div class="nav-link"><i class="ri-bar-chart-fill"></i>Analytics</div></a>
      </div>     
      <a href="../index.html"><div class="nav-link"><i class="ri-logout-box-line"></i>Logout</div></a>
    </div>
  </nav>

  <nav class="topbar">
    <div class="site-logo">
      <img src="../../images/logo/Jukeboxd-logo.svg" alt="Topbar Logo">
    </div>

    <h3>Dashboard</h3>

    <div class="hamburger">
      <div class="ham-icon" onclick="toggleMenu()"><i class="ri-menu-fill"></i></div>
      <div class="nav-links">
        <div>
          <a href="./dashboard.html"><div class="nav-link active"><i class="ri-dashboard-2-fill"></i>Dashboard</div></a>
          <a href="./products.html"><div class="nav-link"><i class="ri-store-2-fill"></i>Products</div></a>
          <a href="./orders.html"><div class="nav-link"><i class="ri-money-dollar-circle-fill"></i>Orders</div></a>
          <a href="./users.html"><div class="nav-link"><i class="ri-user-fill"></i>Users</div></a>
          <a href="./analytics.html"><div class="nav-link"><i class="ri-bar-chart-fill"></i>Analytics</div></a>
          <a href="../index.html"><div class="nav-link"><i class="ri-logout-box-line"></i>Logout</div></a>
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
      <button class="btn btn-accent light-dark-toggle"><i class="ri-sun-fill"></i></button>
    </footer>
  </main>
  
  <script src="../scripts/admin.js"></script>
</body>
</html>