using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace MP2_IT114L
{
    public class OrderRepository
    {
        private readonly string connectionString;
        public OrderRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }

        public void AddOrder()
        {

        }

        public IEnumerable<Order> GetAllOrders()
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText =
                    "SELECT Date_Ordered, Account_Id, Quantity, Subtotal, p.Record_Image, p.Record_Name " +
                    "FROM OrderLog o " +
                    "INNER JOIN Record p ON o.Product_Id = p.Product_Id " +
                    "ORDER BY Date_Ordered ASC";
                return command
                    .ExecuteReader()
                    .Cast<IDataRecord>()
                    .Select(row => new Order()
                    {
                        Date = (DateTime)row["Date_Ordered"],
                        RecordImage = row["Record_Image"] != DBNull.Value ? (byte[])row["Record_Image"] : new byte[] { 0 },
                        ProductName = (string)row["Record_Name"],
                        Account_ID = (string)row["Account_Id"],
                        Quantity = (int)row["Quantity"],
                        Subtotal = (decimal)row["Subtotal"]
                    })
                    .ToList();
            }
        }
    }
}