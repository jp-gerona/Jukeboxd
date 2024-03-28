using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L
{
    public partial class Records : System.Web.UI.Page
    {
        private const int PageSize = 10;
        private int currentPage = 1;
        private HiddenField hiddenCurrentPage; // Hidden field to store current page

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            hiddenCurrentPage = (HiddenField)FindControl("hiddenCurrentPage");

            // Retrieve current page number from hidden field (or session if preferred)
            if (!IsPostBack)
            {
                currentPage = 1; // Set default page on initial load
            }
            else
            {
                // Check if hiddenCurrentPage is found before accessing its Value property
                if (hiddenCurrentPage != null)
                {
                    int.TryParse(hiddenCurrentPage.Value, out currentPage);
                }
            }


            // Fetch data from the database for the current page
            var RecordRepository = new RecordRepository();
            IEnumerable<Record> dt = RecordRepository.GetAllProducts();

            // Populate the table with data
            PopulateTableProducts(dt);
        }


        private void PopulateTableProducts(IEnumerable<Record> dt)
        {
            // Skip records for previous pages
            int skip = (currentPage - 1) * PageSize;

            // Take only the required number of records for this page
            var recordsForPage = dt.Skip(skip).Take(PageSize);

            // Clear the table before populating with new data
            for (int i = T_Products.Rows.Count - 1; i > 0; i--)
            {
                T_Products.Rows.RemoveAt(i);
            }
            foreach (var record in recordsForPage)
            {
                // Create a new row
                TableRow row = new TableRow();

                // Add cells to the row
                row.Cells.Add(new TableCell { Text = record.ProductId });

                // For inserting the image and title to the row
                TableCell imageAndTextCell = new TableCell();
                Image imageControl = new Image(); // For the image of the Product
                // If statement to know if record.Record_Image is null or not
                if (record.RecordImage != null && record.RecordImage.All(b => b == 0))
                {
                    imageControl.ImageUrl = "../images/vinyls/default.jpg";
                    imageControl.AlternateText = "default.jpg";
                }
                else
                {
                    byte[] imageData = record.RecordImage;
                    string base64String = Convert.ToBase64String(imageData);
                    imageControl.ImageUrl = "data:image/jpeg;base64," + base64String;
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
                    var recordId = record.ProductId.ToString();
                    var RecordRepository = new RecordRepository();
                    RecordRepository.DeleteRecord(recordId);
                    Response.Redirect(Request.RawUrl);
                };
                var buttonCell = new TableCell();
                buttonCell.Controls.Add(deleteButton);
                row.Cells.Add(buttonCell);

                // Add the row to the table
                T_Products.Rows.Add(row);
            }
        }

        protected void NextProd_Click(object sender, EventArgs e)
        {
            currentPage++; // Update current page for next set of records

            // Check if hiddenCurrentPage is found before accessing its Value property
            if (hiddenCurrentPage != null)
            {
                hiddenCurrentPage.Value = currentPage.ToString();
            }


            var RecordRepository = new RecordRepository();
            IEnumerable<Record> dt = RecordRepository.GetAllProducts();
            // Clear the table before fetching data for the next page
            PopulateTableProducts(dt);
            ProdInfoSpan.InnerText = $"Page {currentPage} of 10";

            // No need to redirect, data is fetched based on updated currentPage
        }

        protected void PreviousProd_Click(object sender, EventArgs e)
        {
            if (currentPage > 1) // Prevent going below page 1
            {
                currentPage--;

                // Update hidden field value (or session variable)
                hiddenCurrentPage.Value = currentPage.ToString();

                // No need to redirect, data is fetched based on updated currentPage
            }
            var RecordRepository = new RecordRepository();
            IEnumerable<Record> dt = RecordRepository.GetAllProducts();
            // Clear the table before fetching data for the next page
            PopulateTableProducts(dt);
            ProdInfoSpan.InnerText = $"Page {currentPage} of 10";

        }


    }
}