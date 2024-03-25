using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MP2_IT114L
{
    public class CartRepository
    {
        private readonly string connectionString;

        public CartRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }
        public void AddToCart(string productId, int quantity)
        {

            // Check if the product ID already exists in the cart
            bool productExists = false;
            int existingQuantity = 0;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "SELECT Quantity FROM Cart WHERE Product_Id = @Product_Id";
                command.Parameters.AddWithValue("@Product_Id", productId);

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        productExists = true;
                        existingQuantity = reader.GetInt32(0);
                    }
                }
            }

            // If the product exists, update the quantity; otherwise, insert a new record
            if (productExists)
            {
                int newQuantity = existingQuantity + quantity;
                UpdateCart(productId, newQuantity);
            }
            else
            {
                InsertIntoCart(productId, quantity);
            }
        }

        // Method to update the quantity in the cart
        private void UpdateCart(string productId, int quantity)
        {
            
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "UPDATE Cart SET Quantity = @Quantity WHERE Product_Id = @Product_Id";
                command.Parameters.AddWithValue("@Quantity", quantity);
                command.Parameters.AddWithValue("@Product_Id", productId);

                command.ExecuteNonQuery();
            }
        }

        // Method to insert a new record into the cart
        private void InsertIntoCart(string productId, int quantity)
        {
            
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "INSERT INTO Cart (Cart_Id, Date_Added, Quantity, Product_Id) " +
                                      "VALUES (@Cart_Id, @Date_Added, @Quantity, @Product_Id)";
                string cartId = GenerateCartId();
                command.Parameters.AddWithValue("@Cart_Id", cartId);
                command.Parameters.AddWithValue("@Date_Added", DateTime.Now);
                command.Parameters.AddWithValue("@Quantity", quantity);
                command.Parameters.AddWithValue("@Product_Id", productId);

                command.ExecuteNonQuery();
            }
        }


        private string GenerateCartId()
        {
            int latestCartId = GetLatestCartId();
            int newCartId = latestCartId + 1;
            string cartIdString = newCartId.ToString("D7");

            return cartIdString;
        }

        private int GetLatestCartId()
        {
            int latestCartId = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MAX(Cart_Id) FROM Cart";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        string cartId = result.ToString();
                        string numericPart = cartId.Substring(2);
                        latestCartId = int.Parse(numericPart);
                    }
                }
            }

            return latestCartId;
        }

        public void TruncateCart()
        {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "TRUNCATE TABLE Cart";
                command.ExecuteNonQuery();
            }
        }
    }
}