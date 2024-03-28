using MP2_IT114L.App_Code.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        private const int UserPageSize = 10; // Constant for number of users per page
        private int UsercurrentPage = 1; // Current page number for user data
        private HiddenField UserhiddenCurrentPage; // Hidden field to store current user page

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            UserhiddenCurrentPage = (HiddenField)FindControl("hiddenCurrentPage");

            // Retrieve current page number from hidden field (or session if preferred)
            if (!IsPostBack)
            {
                UsercurrentPage = 1; // Set default page on initial load
            }
            else
            {
                // Check if hiddenCurrentPage is found before accessing its Value property
                if (UserhiddenCurrentPage != null)
                {
                    int.TryParse(UserhiddenCurrentPage.Value, out UsercurrentPage);
                }
            }

            // Fetch data from the database for the current page
            var UserRepository = new UserRepository();
            IEnumerable<User> dt = UserRepository.GetAllUsers();

            // Populate the table with user data
            PopulateTableUsers(dt, UsercurrentPage);
        }

        private void PopulateTableUsers(IEnumerable<User> dt, int currentPage = 1)
        {
            // Constants for page size and number of records to skip
            const int PageSize = UserPageSize;
            int skip = (currentPage - 1) * PageSize;

            // Take only the required number of records for this page
            var usersForPage = dt.Skip(skip).Take(PageSize);

            // Clear existing data rows (optional)
            for (int i = T_Users.Rows.Count - 1; i > 0; i--)
            {
                T_Users.Rows.RemoveAt(i);
            }

            foreach (var user in usersForPage)
            {
                // Create a new row
                TableRow row = new TableRow();

                // Add cells to the row
                row.Cells.Add(new TableCell { Text = user.AccountId });
                row.Cells.Add(new TableCell { Text = user.Name });
                row.Cells.Add(new TableCell { Text = user.Email });
                row.Cells.Add(new TableCell { Text = user.Address });

                // Add the row to the table
                T_Users.Rows.Add(row);
            }

            // Update label to indicate current page (optional)
            UserInfoSpan.InnerText = $"Page {currentPage} of 10";
        }

        protected void NextUser_Click(object sender, EventArgs e)
        {
            if (UsercurrentPage < UserPageSize) // Check if not exceeding total pages
            {
                UsercurrentPage++; // Update current page

                // Update hidden field value
                if (UserhiddenCurrentPage != null)
                {
                    UserhiddenCurrentPage.Value = UsercurrentPage.ToString();
                }

                // Fetch data and populate table for the new page
                var UserRepository = new UserRepository();
                IEnumerable<User> dt = UserRepository.GetAllUsers();
                PopulateTableUsers(dt, UsercurrentPage);
            }

            // Update label to indicate current page (optional)
            UserInfoSpan.InnerText = $"Page {UsercurrentPage} of 10";
        }

        protected void PreviousUser_Click(object sender, EventArgs e)
        {
            if (UsercurrentPage > 1) // Prevent going below page 1
            {
                UsercurrentPage--;

                // Update hidden field value
                if (UserhiddenCurrentPage != null)
                {
                    UserhiddenCurrentPage.Value = UsercurrentPage.ToString();
                }

                // Fetch data and populate table for the new page
                var UserRepository = new UserRepository();
                IEnumerable<User> dt = UserRepository.GetAllUsers();
                PopulateTableUsers(dt, UsercurrentPage);
            }

            // Update label to indicate current page (optional)
            UserInfoSpan.InnerText = $"Page {UsercurrentPage} of 10";
        }
    }
}
