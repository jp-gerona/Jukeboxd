using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MP2_IT114L.Client
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            var RecordRepository = new RecordRepository();
            IEnumerable<Record> records = RecordRepository.GetAllProducts();

            // Populate the records grid with record data
            PopulateRecordsGrid(records);

        }

        private void PopulateRecordsGrid(IEnumerable<Record> records)
        {
            foreach (var record in records)
            {
                // Create a new record card
                var recordCard = new HtmlGenericControl("a");
                recordCard.Attributes["class"] = "record-card";
                string recordUrl = $"./Record.aspx?title={Server.UrlEncode(record.ProductName)}&artist={Server.UrlEncode(record.Artist)}&price={Server.UrlEncode(record.Price.ToString())}";

                recordCard.Attributes["href"] = recordUrl;
                // Create image element
                var img = new HtmlGenericControl("img");

                if(record.RecordImage.ToString() == null)
                {
                    img.Attributes["src"] = "../images/vinyls/default.jpg";
                }
                else
                {
                    byte[] imageData = record.RecordImage;
                    string base64String = Convert.ToBase64String(imageData);
                    img.Attributes["src"] = "data:image/jpeg;base64," + base64String;
                }

                // Create record card content div
                var recordCardContent = new HtmlGenericControl("div");
                recordCardContent.Attributes["class"] = "record-card-content";

                // Create cover heading
                var coverHeading = new HtmlGenericControl("h3");
                coverHeading.Attributes["class"] = "cover";
                coverHeading.InnerText = record.ProductName;

                // Create artist span
                var artistSpan = new HtmlGenericControl("span");
                artistSpan.Attributes["class"] = "artist";
                artistSpan.InnerText = record.Artist;

                // Create price span
                var priceSpan = new HtmlGenericControl("span");
                priceSpan.Attributes["class"] = "price";

                // Create price container div
                var priceContainerDiv = new HtmlGenericControl("div");
                priceContainerDiv.Attributes["class"] = "price-container";
                priceContainerDiv.InnerHtml = "&#8369; " + record.Price;

                // Append elements to record card content
                priceSpan.Controls.Add(priceContainerDiv);
                recordCardContent.Controls.Add(coverHeading);
                recordCardContent.Controls.Add(artistSpan);
                recordCardContent.Controls.Add(priceSpan);

                // Append elements to record card
                recordCard.Controls.Add(img);
                recordCard.Controls.Add(recordCardContent);

                // Append record card to recordsgrid
                recordsgrid.Controls.Add(recordCard);
            }
        }
    }
}