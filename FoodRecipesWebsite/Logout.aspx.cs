using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodRecipesWebsite
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session variables
            Session["LoggedIn"] = false;
            Session["Username"] = null;

            // Redirect to the home page or a login page
            Response.Redirect("Index.aspx");
        }
    }
}