using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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
                        RecordImage = row["Record_Image"] != DBNull.Value ? (byte[])row["Record_Image"] : new byte[] { 0 }
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

        public void DeleteRecord(string recordId)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                // Order of deletion should be OrderLog -> Cart -> Record because of the key constraints
                // Deletes from OrderLog
                command.CommandText = "DELETE FROM OrderLog WHERE Product_Id = @Product_Id";
                command.Parameters.AddWithValue("@Product_Id", recordId);
                command.ExecuteNonQuery();

                // Deletes from Cart
                command.CommandText = "DELETE FROM Cart WHERE Product_Id = @Product_Id";
                command.ExecuteNonQuery();

                // Deletes from Record
                command.CommandText = "DELETE FROM Record WHERE Product_Id = @Product_Id";
                command.ExecuteNonQuery();

                connection.Close();
            }

        }
        public List<string> ProfileEmail(string email)
        {
            List<string> profileList = new List<string>();

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "SELECT * FROM Account WHERE Email = @Email";
                command.Parameters.AddWithValue("@Email", email);

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        profileList.Add(reader["Account_Id"].ToString());
                        profileList.Add(reader["Name"].ToString());
                    }

                    connection.Close();
                }
                return profileList;
            }
        }
    }
}