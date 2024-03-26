using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;
using System.Web.Services.Description;

namespace MP2_IT114L
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public void AddRecord_Click(object sender, EventArgs e)
        {
            string recordName = TB_RecordName.Text;
            string recordArtist = TB_RecordArtist.Text;
            string genre = DL_Genre.SelectedItem.Text;
            float price = int.Parse(TB_Price.Text);
            int stock = int.Parse(TB_Stock.Text);
            string description = TB_Description.Text;

            var RecordRepository = new RecordRepository();
            RecordRepository.AddRecord(recordName, recordArtist, genre, price, stock, description);
        }

        public void DeleteRecord_Click(Object sender, EventArgs e)
        {
            string recordName = TB_DEL_RecordName.Text;

            var RecordRepository = new RecordRepository();
            RecordRepository.DeleteRecord(recordName);
        }

        public void AddToCart_Click(Object sender, EventArgs e)
        {
            string productId = TB_ProductId.Text;
            int quantity = int.Parse(TB_Quantity.Text);

            var CartRepository = new CartRepository();
            CartRepository.AddToCart(productId, quantity);
        }

        public IEnumerable<Record> recordRepository = new List<Record>();

        protected void Page_Load(object sender, EventArgs e)
        {
            var RecordRepository = new RecordRepository();
            recordRepository = RecordRepository.GetAllProductId();
            //PostRepeater.DataSource = posts;
            //PostRepeater.DataBind();
            LB_Username.Text = Session["username"].ToString();
        }

        public void AddImage_Click(Object sender, EventArgs e)
        {
            string productId = img_RecordId.Text;

            HttpPostedFile uploadedFile = imageRecord.PostedFile;
            byte[] image = new byte[uploadedFile.ContentLength];
            uploadedFile.InputStream.Read(image, 0, uploadedFile.ContentLength);

            var imageRepository = new ImageRepository();
            imageRepository.AddImage(image, productId);
        }

        public void DisplayImage_Click(object sender, EventArgs e)
        {
            string productId = displayRecord.Text;

            var imageRepository = new ImageRepository();
            byte[] imageData = imageRepository.GetImage(productId);


            string base64Image = imageRepository.ConvertImageToBase64(imageData);

            if (!string.IsNullOrEmpty(base64Image))
            {
                productImage.ImageUrl = "data:image/jpeg;base64," + base64Image;
            }
        }
    }

    public class ImageRepository
    {
        private readonly string connectionString;

        public ImageRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }

        public void AddImage(byte[] Record_Image, string productId)
        {
            bool productExists = false;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "SELECT Record_Image FROM Record WHERE Product_Id = @Product_Id ";
                command.Parameters.AddWithValue("@Product_Id", productId);

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        productExists = true;
                    }
                }

                if (productExists)
                {
                    UpdateImage(Record_Image, productId);
                }
                else
                {
                    InsertImage(Record_Image, productId);
                }
                connection.Close();
            }
        }

        private void UpdateImage(byte[] Record_Image, string productId)
        {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "UPDATE Record SET Record_Image = @Record_Image WHERE Product_Id = @Product_Id";
                command.Parameters.AddWithValue("@Record_Image", Record_Image);
                command.Parameters.AddWithValue("@Product_Id", productId);

                command.ExecuteNonQuery();
            }
        }

        private void InsertImage(byte[] Record_Image, string productId)
        {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "INSERT INTO Record (Record_Image, Product_Id) " +
                                      "VALUES (@Record_Image, @Product_Id)";
                command.Parameters.AddWithValue("@Record_Image", Record_Image);
                command.Parameters.AddWithValue("@Product_Id", productId);

                command.ExecuteNonQuery();
            }
        }

        public byte[] GetImage(string productId)
        {
            byte[] imageData = null;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "SELECT Record_Image FROM Record WHERE Product_Id = @Product_Id";
                command.Parameters.AddWithValue("@Product_Id", productId);

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        imageData = (byte[])reader["Record_Image"];
                    }
                }
            }

            return imageData;
        }

        public string ConvertImageToBase64(byte[] imageData)
        {
            if (imageData != null && imageData.Length > 0)
            {
                return Convert.ToBase64String(imageData);
            }
            else
            {
                return null;
            }
        }


    }

}