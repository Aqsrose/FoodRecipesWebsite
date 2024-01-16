using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FoodRecipesWebsite
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the current user data for editing
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
                    // Display the current username in the TextBox for editing
                    NewUsernameTextBox.Text = username;
                }
            }
        }

        protected void UpdateProfileButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string oldUsername = Session["Username"] as string;

                if (!string.IsNullOrEmpty(oldUsername))
                {
                    // Load user data from XML file
                    string filePath = Server.MapPath("TestingFile.xml");
                    XDocument doc = XDocument.Load(filePath);

                    var user = doc.Descendants("user")
                                  .FirstOrDefault(u => (string)u.Element("username") == oldUsername);

                    if (user != null)
                    {
                        // Update the user's profile data
                        UpdateProfileData(user);

                        // Save changes to the XML file
                        doc.Save(filePath);

                        // Update the session variable with the new username
                        Session["Username"] = NewUsernameTextBox.Text;

                        // Redirect to the profile page after updating
                        Response.Redirect("Profile.aspx");
                    }
                }
            }
        }

        private void UpdateProfileData(XElement user)
        {
            // Update profile data based on user input

            // Update username
            string newUsername = NewUsernameTextBox.Text;
            user.Element("username").Value = newUsername;

            // Check if a new profile image is uploaded
            if (ProfileImageUpload.HasFile)
            {
                // Generate a unique filename for the new image
                string newImageFileName = $"{Guid.NewGuid()}.jpg";
                string newImagePath = Path.Combine(Server.MapPath("UserImages"), newImageFileName);

                // Save the new image to the "UserImages" folder
                ProfileImageUpload.SaveAs(newImagePath);

                // Update the profile image path in the XML
                user.Element("profileImage").Value = $"UserImages/{newImageFileName}";
            }
        }
    }
}