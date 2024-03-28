using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            var OrderRepository = new OrderRepository();
            IEnumerable<Order> dt = OrderRepository.GetAllOrders();

            // Populate the table with data
            PopulateTableOrders(dt);
        }

        private void PopulateTableOrders(IEnumerable<Order> dt)
        {
            foreach (var order in dt)
            {
                // Create a new row
                TableRow row = new TableRow();

                // Add cells to the row
                row.Cells.Add(new TableCell { Text = order.Date.ToString() });

                // For inserting the image and title to the row
                TableCell imageAndTextCell = new TableCell();
                Image imageControl = new Image(); // For the image of the Product
                // If statement to know if record.Record_Image is null or not
                if (order.RecordImage != null && order.RecordImage.All(b => b == 0))
                {
                    imageControl.ImageUrl = "../images/vinyls/default.jpg";
                    imageControl.AlternateText = "default.jpg";
                }
                else
                {
                    byte[] imageData = order.RecordImage;
                    string base64String = Convert.ToBase64String(imageData);
                    imageControl.ImageUrl = "data:image/jpeg;base64," + base64String;
                }
                LiteralControl textLiteral = new LiteralControl(); // For the title of the product
                textLiteral.Text = order.ProductName;
                // Adds both the image and text to the cell
                imageAndTextCell.Controls.Add(imageControl);
                imageAndTextCell.Controls.Add(textLiteral);
                row.Cells.Add(imageAndTextCell);

                row.Cells.Add(new TableCell { Text = order.Account_ID });
                row.Cells.Add(new TableCell { Text = order.Quantity.ToString() });

                // Formats the price
                TableCell priceCell = new TableCell();
                priceCell.CssClass = "amount";
                priceCell.Text = "&#8369; " + order.Subtotal.ToString("N2");
                row.Cells.Add(priceCell);

                // Add the row to the table
                T_Order.Rows.Add(row);
            }
        }
    }
}