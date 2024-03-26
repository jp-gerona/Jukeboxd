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
                        
                    })
                    .ToList();
            }
        }

        //Adds records to the database
        public void AddRecord(string recordName, string recordArtist, string genre, float price, int stock, string description)
        {      
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "INSERT INTO Record (Product_Id, Record_Name, Artist, Genre, Price, Stock, Description) " +
                    "VALUES (@Product_Id, @Record_Name, @Artist, @Genre, @Price, @Stock, @Description)";

                string productId = GenerateProductId();

                command.Parameters.AddWithValue("@Product_Id", productId);
                command.Parameters.AddWithValue("@Record_Name", recordName);
                command.Parameters.AddWithValue("@Artist", recordArtist);
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
        public void DeleteRecord(string recordName)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "DELETE FROM Record " +
                    "WHERE Record_Name = @Record_Name";

                command.Parameters.AddWithValue("@Record_Name", recordName);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}