using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FoodRecipesWebsite
{
    public partial class UploadRecipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load user data and populate the profile page
            LoadUserData();
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
                }
            }
        }

        protected void SubmitRecipeButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string uploaderUsername = Session["Username"] as string;

                if (!string.IsNullOrEmpty(uploaderUsername))
                {
                    string imageFileName = UploadImage();

                    if (!string.IsNullOrEmpty(imageFileName))
                    {
                        // Add the recipe to the XML file
                        if (AddRecipeToXml(uploaderUsername, imageFileName))
                        {
                            StatusLabel.Text = "Recipe submitted successfully.";
                            StatusLabel.CssClass = "successLabel";
                            Response.Redirect("Profile.aspx");
                        }
                        else
                        {
                            StatusLabel.Text = "Failed to submit recipe. Please try again.";
                            StatusLabel.CssClass = "errorLabel";
                        }
                    }
                    else
                    {
                        StatusLabel.Text = "Failed to upload recipe image. Please try again.";
                        StatusLabel.CssClass = "errorLabel";
                    }
                }
            }
        }

        private string UploadImage()
        {
            try
            {
                if (ImageUpload.HasFile)
                {
                    // Generate a unique filename for the image
                    string imageFileName = $"{Guid.NewGuid()}.jpg";
                    string imagePath = Path.Combine(Server.MapPath("UserImages"), imageFileName);

                    // Save the image to the "RecipeImages" folder
                    ImageUpload.SaveAs(imagePath);

                    return imageFileName;
                }

                return null;
            }
            catch (Exception ex)
            {
                // Handle exceptions (log, show error message, etc.)
                return null;
            }
        }

        private bool AddRecipeToXml(string uploaderUsername, string imageFileName)
        {
            try
            {
                string filePath = Server.MapPath("Recipes.xml");
                XDocument doc = XDocument.Load(filePath);

                int newRecipeId = GetNextRecipeId(doc);

                // Create a new recipe element
                XElement newRecipe = new XElement("Recipe",
                    new XElement("RecipeId", newRecipeId),
                    new XElement("UploaderUsername", uploaderUsername),
                    new XElement("Image", $"UserImages/{imageFileName}"),
                    new XElement("Title", TitleTextBox.Text.Trim()),
                    new XElement("Category", CategoryTextBox.Text.Trim()),
                    new XElement("Description", DescriptionTextBox.Text.Trim())
                );

                // Add the new recipe to the XML file
                doc.Root.Add(newRecipe);
                doc.Save(filePath);

                return true;
            }
            catch (Exception ex)
            {
                // Handle exceptions (log, show error message, etc.)
                return false;
            }
        }

        private int GetNextRecipeId(XDocument doc)
        {
            // Calculate the next recipe id based on existing recipes
            var recipeIds = doc.Descendants("Recipe").Select(r => (int)r.Element("RecipeId"));
            return recipeIds.Any() ? recipeIds.Max() + 1 : 1;
        }
    }
}
