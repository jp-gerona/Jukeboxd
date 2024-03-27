using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L
{
    public partial class Records : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                // Fetch data from the database for the current page
                var RecordRepository = new RecordRepository();
                IEnumerable<Record> dt = RecordRepository.GetAllProducts();

                // Populate the table with data
                PopulateTable(dt);


        }

        private void PopulateTable(IEnumerable<Record> dt)
        {
            foreach (var record in dt)
            {
                // Create a new row
                TableRow row = new TableRow();

                // Add cells to the row
                row.Cells.Add(new TableCell { Text = record.ProductId });

                // For inserting the image and title to the row
                TableCell imageAndTextCell = new TableCell();
                Image imageControl = new Image(); // For the image of the Product
                // If statement to know if record.Record_Image is null or not
                if (record.Record_Image != null && record.Record_Image.All(b => b == 0))
                {
                    imageControl.ImageUrl = "../images/vinyls/default.jpg";
                    imageControl.AlternateText = "default.jpg";
                }
                else
                {
                    byte[] imageData = record.Record_Image;
                    string base64String = Convert.ToBase64String(imageData);
                    imageControl.ImageUrl = "data:image/jpeg;base64," + base64String;
                    //string imageString = record.Record_Image;
                    //byte[] imageData = Convert.FromBase64String(imageString);
                    //string base64String = Convert.ToBase64String(imageData);
                    //imageControl.ImageUrl = "data:image/jpeg;base64," + base64String;
                    //imageControl.AlternateText = record.Record_Image + ".jpg";
                }
                LiteralControl textLiteral = new LiteralControl(); // For the title of the product
                textLiteral.Text = record.ProductName;
                // Adds both the image and text to the cell
                imageAndTextCell.Controls.Add(imageControl);
                imageAndTextCell.Controls.Add(textLiteral);
                row.Cells.Add(imageAndTextCell);

                row.Cells.Add(new TableCell { Text = record.Artist});
                row.Cells.Add(new TableCell { Text = record.Genre });
                row.Cells.Add(new TableCell { Text = record.Stock.ToString() });

                // Formats the price
                TableCell priceCell = new TableCell();
                priceCell.CssClass = "amount";
                priceCell.Text = "&#8369; " + record.Price.ToString("N2");
                row.Cells.Add(priceCell);

                var deleteButton = new Button();
                deleteButton.Text = "Delete";
                deleteButton.CssClass = "btn btn-danger asp-delete-button";
                deleteButton.Click += (sender, e) => {
                    // Handle button click event (e.g., delete the record)
                    // You can access the record associated with this button using 'record' variable
                };
                var buttonCell = new TableCell();
                buttonCell.Controls.Add(deleteButton);
                row.Cells.Add(buttonCell);

                // Add the row to the table
                MyTable.Rows.Add(row);
            }
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Handle the delete button click event
            Button deleteButton = (Button)sender;
            string productId = deleteButton.ID.Split('_')[1];

            // Perform deletion operation or any other action based on productId
        }
    }
}