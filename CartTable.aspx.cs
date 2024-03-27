using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MP2_IT114L.App_Code.Users;

namespace MP2_IT114L
{
    public partial class CartTable : System.Web.UI.Page
    {

        private readonly string connectionString;

        public CartTable()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["UserID"] != null)
                {
                    string userID = Session["UserID"].ToString();
                    LoadCartData(userID);
                }
                else
                {
                    // Redirect the user to the login page
                    Response.Redirect("~/Client/Login-Client.aspx");
                }
            }
        }


        protected void TruncateCart_Click(object sender, EventArgs e)
        {

            string userID = Session["UserID"] as string;

            CartRepository cartRepo = new CartRepository();

            cartRepo.TruncateCart(userID);
  
            LoadCartData(userID);

        }

        private void LoadCartData(string userID)
        {
            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    using (var command = new SqlCommand("SELECT * FROM Cart WHERE Account_Id = @Account_Id", connection))
                    {
                        command.Parameters.AddWithValue("@Account_Id", userID);
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}