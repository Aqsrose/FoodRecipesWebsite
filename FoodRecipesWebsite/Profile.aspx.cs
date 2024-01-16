using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FoodRecipesWebsite
{
    public partial class Profile : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Load user data and populate the profile page
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            // Assuming you have stored the user's information in a session after login
            string username = Session["Username"] as string;

            if (!string.IsNullOrEmpty(username))
            {
                // Load user data from XML file
                string filePath = Server.MapPath("TestingFile.xml");
                XDocument doc = XDocument.Load(filePath);

                var user = doc.Descendants("user")
                              .FirstOrDefault(u => (string)u.Element("username") == username);

                if (user != null)
                {
                    // Populate the profile page with user data
                    // Update the key to "profileImage"
                    profileImage.ImageUrl = (string)user.Element("profileImage");
                    usernameLabel.Text = username;

                    // Display the uploaded recipes
                    DisplayUploadedRecipes(username);
                }
            }
        }

        private void DisplayUploadedRecipes(string username)
        {
            // Load recipe data from XML file
            string recipeFilePath = Server.MapPath("Recipes.xml");
            XDocument recipeDoc = XDocument.Load(recipeFilePath);

            // Retrieve the recipes uploaded by the user
            var userRecipes = recipeDoc.Descendants("Recipe")
                                       .Where(r => (string)r.Element("UploaderUsername") == username);

            // Iterate through the user's recipes and display them
            foreach (var recipe in userRecipes)
            {
                // Get recipe details (adjust the element names based on your XML structure)
                string recipeTitle = (string)recipe.Element("Title");
                string recipeCategory = (string)recipe.Element("Category");
                string recipeDescription = (string)recipe.Element("Description");

                // Create a container div for each recipe
                HtmlGenericControl recipeDiv = new HtmlGenericControl("div");
                recipeDiv.Attributes["class"] = "cardRight"; // Apply your CSS class

                // Create an image container div
                HtmlGenericControl imgContainerDiv = new HtmlGenericControl("div");
                imgContainerDiv.Attributes["class"] = "imgContainerRight";

                // Create an Image control for the recipe image
                Image recipeImage = new Image();
                recipeImage.ID = $"recipeImage_{recipeTitle}"; // You may want to set a unique ID
                recipeImage.ImageUrl = (string)recipe.Element("Image"); // Adjust based on your XML structure
                imgContainerDiv.Controls.Add(recipeImage);

                // Create a content container div
                HtmlGenericControl contentDiv = new HtmlGenericControl("div");
                contentDiv.Attributes["class"] = "cardContentRight";

                // Create controls for recipe details
                Label categoryLabel = new Label();
                categoryLabel.ID = $"categoryLabel_{recipeTitle}"; // You may want to set a unique ID
                categoryLabel.Text = recipeCategory;

                Label titleLabel = new Label();
                titleLabel.ID = $"titleLabel_{recipeTitle}"; // You may want to set a unique ID
                titleLabel.Text = recipeTitle;

                // Repeat similar steps for other recipe details (description, etc.)

                // Add controls to the content div
                contentDiv.Controls.Add(categoryLabel);
                contentDiv.Controls.Add(new LiteralControl("<br />")); // Line break for better presentation
                contentDiv.Controls.Add(titleLabel);
                // Add other recipe details controls

                // Create a button for bookmark (adjust as needed)
                Button bookmarkButton = new Button();
                bookmarkButton.ID = $"bookmarkButton_{recipeTitle}"; // You may want to set a unique ID
                bookmarkButton.Text = "Bookmark";
                bookmarkButton.CssClass = "bookmarkBtn"; // Apply your CSS class
                                                         // Add a click event handler if needed

                // Add controls to the recipe div
                recipeDiv.Controls.Add(imgContainerDiv);
                recipeDiv.Controls.Add(contentDiv);
                recipeDiv.Controls.Add(bookmarkButton); // Add the bookmark button

                // Add the recipe div to the main container (recipeContainer)
                recipeContainer.Controls.Add(recipeDiv);

                // Optionally, you can add HTML markup for better presentation
                recipeContainer.Controls.Add(new LiteralControl("<br />"));
            }
        }
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadRecipe.aspx");
        }
    }
}