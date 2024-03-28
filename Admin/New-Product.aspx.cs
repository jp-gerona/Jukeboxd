using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L
{
    public partial class New_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        public void AddRecord_Click(object sender, EventArgs e)
        {
            string recordName = TB_RecordName.Text;
            string recordArtist = TB_Artist.Text;
            byte[] recordImage = new byte[FU_Image.PostedFile.ContentLength];
            FU_Image.PostedFile.InputStream.Read(recordImage, 0, FU_Image.PostedFile.ContentLength);
            string genre = DDL_Genre.SelectedItem.Text;
            float price = float.Parse(TB_Price.Text);
            int stock = int.Parse(TB_Stock.Text);
            string description = TB_Description.Text;

            var RecordRepository = new RecordRepository();
            RecordRepository.AddRecord(recordName, recordArtist, recordImage, genre, price, stock, description);

            TB_RecordName.Text = "";
            TB_Artist.Text = "";
            TB_Price.Text = "";
            TB_Stock.Text = "";
            TB_Description.Text = "";

            DDL_Genre.SelectedIndex = 0;
            FU_Image.Attributes.Clear();
        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            // Clear the session variable
            Session.Remove("YourSessionVariableName");

            // or set it to null
            Session["YourSessionVariableName"] = null;

            // Redirect to the logout page or any other page
            Response.Redirect("../index.html");
        }
    }
}