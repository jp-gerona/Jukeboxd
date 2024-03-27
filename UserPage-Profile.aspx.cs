using MP2_IT114L.App_Code.Users;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace MP2_IT114L
{
    public partial class UserPage_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUserEmail"] as string;

            if (!string.IsNullOrEmpty(userEmail))
            {
                UserProfile userProfile = new UserProfile();
                List<User> userAccounts = userProfile.GetAccountsByEmail(userEmail);
                DisplayProfileAndAccounts(userAccounts);
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }

        private void DisplayProfileAndAccounts(List<User> userAccounts)
        {
            foreach (User account in userAccounts)
            {
                lblAccountInfo.Text += $"Name: {account.Name} <br/> Email: {account.Email} <br/> Address: {account.Address} <br/>";
            }
        }

        protected void BtnChangeAddress_Click(object sender, EventArgs e)
        {
            string newAddress = TxtNewAddress.Text.Trim();
            UpdateUserAddress(newAddress);
        }

        private void UpdateUserAddress(string newAddress)
        {
            UserProfile userProfile = new UserProfile();
            userProfile.UpdateUserAddress(Session["LoggedInUserEmail"].ToString(), newAddress);
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            string userType = Session["UserType"] as string;
            Session.Clear();
            if (userType == "Admin")
            {
                Response.Redirect("Admin/Login-Admin.aspx");
            }
            else if (userType == "Customer")
            {
                Response.Redirect("Client/Login-Client.aspx");
            }
        }

    }
}
