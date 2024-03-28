using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MP2_IT114L.App_Code.Users
{
    public class UserProfile
    {
        //Replace connectionString according to server            
        private readonly string connectionString;

        public UserProfile()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }

        public List<User> GetAccountsByEmail(string email)
        {
            List<User> accounts = new List<User>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Account WHERE Email = @Email";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            User account = new User
                            {
                                AccountId = Convert.ToString(reader["Account_Id"]),
                                Name = Convert.ToString(reader["Name"]),
                                Email = Convert.ToString(reader["Email"]),
                                Password = Convert.ToString(reader["Password"]),
                                Address = Convert.ToString(reader["Address"]),
                                Type = Convert.ToString(reader["Type"])
                            };
                            accounts.Add(account);
                        }
                    }
                }
            }

            return accounts;
        }

        public void UpdateUserAddress(string email, string newAddress)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Account SET Address = @NewAddress WHERE Email = @Email";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewAddress", newAddress);
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}