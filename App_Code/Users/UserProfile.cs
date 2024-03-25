﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Xml.Linq;
using MP2_IT114L.App_Code.Users;

namespace MP2_IT114L.App_Code.Users
{
    public class UserProfile
    {
        private readonly string connectionString;

        public UserProfile()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }
        public User GetUserProfile(int accountId)
        {
            User userProfile = new User();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Account_Id, Name, Email, Password, Type FROM Account WHERE Account_Id = @Account_Id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Account_Id", accountId);

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userProfile.AccountId = reader["Account_Id"].ToString();
                            userProfile.Name = reader["Name"].ToString();
                            userProfile.Email = reader["Email"].ToString();
                            userProfile.Password = reader["Password"].ToString();
                            userProfile.Type = reader["Type"].ToString();
                        }
                    }
                }
            }

            return userProfile;
        }
    }

}