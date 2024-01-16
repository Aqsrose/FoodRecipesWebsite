using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodRecipesWebsite
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                // User is logged in
                signupLink.Visible = false;
                loginLink.Visible = false;
                logoutLink.Visible = true;
                profileLink.Visible = true;
            }
            else
            {
                // User is not logged in
                signupLink.Visible = true;
                loginLink.Visible = true;
                logoutLink.Visible = false;
                profileLink.Visible = false;

            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void Menu1_MenuItemClick1(object sender, MenuEventArgs e)
        {

        }
    }
}