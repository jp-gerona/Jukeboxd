using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MP2_IT114L
{
    public partial class Record1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUserEmail"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            string title = Request.QueryString["title"];
            string artist = Request.QueryString["artist"];
            string price = Request.QueryString["price"];

            // Set the ImageUrl property of the recordImage control
            // Set the values to the respective ASP.NET server controls
            recordname.InnerText = title;
            H_artist.InnerText = artist;
            totalPrice.InnerText = price;

            // Assuming you have a function to retrieve genre and description from your database based on the title and artist
            //var genreAndDescription = GetGenreAndDescription(title, artist);
            //genre.InnerText = genreAndDescription.Item1;
            //description.InnerText = genreAndDescription.Item2;

            //// Set the price container value
            //pricecontainer.InnerText = "&#8369; " + price;
        }
    }
}