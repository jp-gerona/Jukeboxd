using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace MP2_IT114L
{
    public class RecordRepository
    {
        private readonly string connectionString;

        public RecordRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }
        //Gets all the productId in the database
        public IEnumerable<Record> GetAllProducts()
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "SELECT * " +
                    "FROM Record " +
                    "ORDER BY Product_Id ASC";
                return command
                    .ExecuteReader()
                    .Cast<IDataRecord>()
                    .Select(row => new Record()
                    {
                        ProductName = (string)row["Record_Name"],
                        ProductId = (string)row["Product_Id"],
                        Artist = (string)row["Artist"],
                        Genre = (string)row["Genre"],
                        Price = (decimal)row["Price"],
                        Stock = (int)row["Stock"],
                        Description = (string)row["Description"],
                        Record_Image = row["Record_Image"] != DBNull.Value ? (byte[])row["Record_Image"] : new byte[] { 0 }
            })
                    .ToList();
            }
        }

        //Adds records to the database
        public void AddRecord(string recordName, string recordArtist, byte[] recordImage, string genre, float price, int stock, string description)
        {      
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "INSERT INTO Record (Product_Id, Record_Name, Artist, Record_Image, Genre, Price, Stock, Description) " +
                    "VALUES (@Product_Id, @Record_Name, @Artist, @Record_Image, @Genre, @Price, @Stock, @Description)";

                string productId = GenerateProductId();

                command.Parameters.AddWithValue("@Product_Id", productId);
                command.Parameters.AddWithValue("@Record_Name", recordName);
                command.Parameters.AddWithValue("@Artist", recordArtist);
                command.Parameters.AddWithValue("@Record_Image", recordImage);
                command.Parameters.AddWithValue("@Genre", genre);
                command.Parameters.AddWithValue("@Price", price);
                command.Parameters.AddWithValue("@Stock", stock);
                command.Parameters.AddWithValue("@Description", description);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        //Generates a productId
        private string GenerateProductId()
        {
            int latestProductId = GetLatestProductId();
            int newProductId = latestProductId + 1;
            string productIdString = "R" + newProductId.ToString("D8");

            return productIdString;
        }

        //Gets the highest productId in the database
        private int GetLatestProductId()
        {
            int latestProductId = 0;
 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MAX(Product_Id) FROM Record";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        string productId = result.ToString();
                        string numericPart = productId.Substring(1);
                        latestProductId = int.Parse(numericPart);
                    }
                }
            }

            return latestProductId;
        }

        //Deletes a record in the database
        //public void DeleteRecord(string recordId)
        //{
        //    using (var connection = new SqlConnection(connectionString))
        //    using (var command = connection.CreateCommand())
        //    {
        //        connection.Open();
        //        command.CommandText =
        //            "DELETE FROM Record " +
        //            "WHERE Product_Id = @Product_Id";

        //        command.Parameters.AddWithValue("@Product_Id", recordId);

        //        command.ExecuteNonQuery();
        //        connection.Close();
        //    }
        //}

        public void DeleteRecord(string recordId)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if the record ID is associated with any cart items
                bool recordInCart = false;
                using (var commandCheckCart = connection.CreateCommand())
                {
                    commandCheckCart.CommandText = "SELECT COUNT(*) FROM Cart WHERE Product_Id = @Product_Id";
                    commandCheckCart.Parameters.AddWithValue("@Product_Id", recordId);

                    int cartItemCount = (int)commandCheckCart.ExecuteScalar();
                    if (cartItemCount > 0)
                    {
                        recordInCart = true;

                        // If record is in cart, delete it from the cart first
                        using (var commandDeleteFromCart = connection.CreateCommand())
                        {
                            commandDeleteFromCart.CommandText = "DELETE FROM Cart WHERE Product_Id = @Product_Id";
                            commandDeleteFromCart.Parameters.AddWithValue("@Product_Id", recordId);
                            commandDeleteFromCart.ExecuteNonQuery();
                        }
                    }
                }

                // If the record is not in the cart or if it was successfully removed from the cart, delete the record
                if (!recordInCart)
                {
                    using (var commandDeleteRecord = connection.CreateCommand())
                    {
                        commandDeleteRecord.CommandText = "DELETE FROM Record WHERE Product_Id = @Product_Id";
                        commandDeleteRecord.Parameters.AddWithValue("@Product_Id", recordId);
                        commandDeleteRecord.ExecuteNonQuery();
                    }
                }

                connection.Close();
            }
        }
    }
}