using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L.Client
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            email.Text = Session["LoggedInUserEmail"].ToString();
            string email2 = email.Text;
            var RecordRepository = new RecordRepository();
            List<string>  profileData = RecordRepository.ProfileEmail(email2);
            account_id.Text = $"Account ID: {profileData[0]}";
            account_name.Text = profileData[1];
        }

        protected void logOut_Click(object sender, EventArgs e)
        {
            Session["LoggedInUserEmail"] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}