using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                LoadCartData();
            }
        }

        protected void TruncateCart_Click(object sender, EventArgs e)
        {


            CartRepository cartRepo = new CartRepository();

            cartRepo.TruncateCart();
  
            LoadCartData();

        }

        private void LoadCartData()
        {
            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    using (var command = new SqlCommand("SELECT * FROM Cart", connection))
                    {
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