using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FoodRecipesWebsite
{
    public partial class Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = Username.Text;
                string email = Email.Text;
                string password = Password.Text;

                // Save user data to XML file
                SaveUserData(username, email, password);

                // Redirect to sign-in page
                Response.Redirect("Login.aspx");
            }
        }

        private void SaveUserData(string username, string email, string password)
        {
            string filePath = Server.MapPath("TestingFile.xml");
            string imageFolderPath = Server.MapPath("UserImages");

            // Create the "UserImages" folder if it doesn't exist
            if (!Directory.Exists(imageFolderPath))
            {
                Directory.CreateDirectory(imageFolderPath);
            }

            // Generate a unique filename for the image
            string imageFileName = $"{Guid.NewGuid()}.jpg";
            string imagePath = Path.Combine(imageFolderPath, imageFileName);

            // Save the uploaded image to the "UserImages" folder
            IMAGE.SaveAs(imagePath);

            XDocument doc;
            if (File.Exists(filePath))
            {
                // Load existing XML file
                doc = XDocument.Load(filePath);
            }
            else
            {
                // Create a new XML file if it doesn't exist
                doc = new XDocument(new XElement("users"));
            }

            // Check if "users" element exists; if not, create it
            if (doc.Root == null)
            {
                doc.Add(new XElement("users"));
            }

            // Create a new user and add it to the XML file
            XElement newUser = new XElement("user",
                                new XElement("username", username),
                                new XElement("email", email),
                                new XElement("password", password),
                                new XElement("profileImage", $"UserImages/{imageFileName}")); // Update the key to "profileImage"

            doc.Root.Add(newUser);
            doc.Save(filePath);
        }

        private string SaveImageAndGetPath(string userId)
        {
            // Specify the folder where images will be stored
            string imageFolderPath = Server.MapPath("UserImages");

            // Create the folder if it doesn't exist
            if (!Directory.Exists(imageFolderPath))
            {
                Directory.CreateDirectory(imageFolderPath);
            }

            // Get the FileUpload control
            FileUpload fileUpload = IMAGE;

            // Check if a file is uploaded
            if (fileUpload.HasFile)
            {
                // Create a unique filename for the image
                string imageName = $"{userId}_{DateTime.Now:yyyyMMddHHmmssfff}{Path.GetExtension(fileUpload.FileName)}";

                // Save the image to the folder
                string imagePath = Path.Combine(imageFolderPath, imageName);
                fileUpload.SaveAs(imagePath);

                // Return the image path
                return imagePath;
            }

            // If no image is uploaded, return an empty string
            return string.Empty;
        }
    }
}
