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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("./Login-Admin.aspx");
            }

            var UserRepository = new UserRepository();
            IEnumerable<User> dt = UserRepository.GetAllUsers();

            // Populate the table with data
            PopulateTableUsers(dt);
        }

        private void PopulateTableUsers(IEnumerable<User> dt)
        {
            foreach (var account in dt)
            {
                // Create a new row
                TableRow row = new TableRow();

                // Add cells to the row
                row.Cells.Add(new TableCell { Text = account.AccountId });
                row.Cells.Add(new TableCell { Text = account.Name });
                row.Cells.Add(new TableCell { Text = account.Email });
                row.Cells.Add(new TableCell { Text = account.Address });

                T_Users.Rows.Add(row);
            }
        }
    }
}