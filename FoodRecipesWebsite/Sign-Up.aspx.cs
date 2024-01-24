using System;
using System.IO;
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
            EnsureFolderExists(imageFolderPath);

            // Save the uploaded image to the "UserImages" folder
            string imageFileName = SaveImageAndGetFileName(IMAGE);

            XDocument doc = LoadOrCreateXmlFile(filePath);

            // Create a new user and add it to the XML file
            XElement newUser = new XElement("user",
                                new XElement("username", username),
                                new XElement("email", email),
                                new XElement("password", password),
                                new XElement("profileImage", $"UserImages/{imageFileName}"));

            doc.Root?.Add(newUser);
            doc.Save(filePath);
        }

        private void EnsureFolderExists(string folderPath)
        {
            // Create the folder if it doesn't exist
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
        }

        private string SaveImageAndGetFileName(FileUpload fileUpload)
        {
            // Get the FileUpload control
            if (fileUpload.HasFile)
            {
                // Create a unique filename for the image
                return $"{Guid.NewGuid()}_{DateTime.Now:yyyyMMddHHmmssfff}{Path.GetExtension(fileUpload.FileName)}";
            }

            // If no image is uploaded, return an empty string
            return string.Empty;
        }

        private XDocument LoadOrCreateXmlFile(string filePath)
        {
            XDocument doc;

            // Load existing XML file or create a new one if it doesn't exist
            if (File.Exists(filePath))
            {
                doc = XDocument.Load(filePath);
            }
            else
            {
                doc = new XDocument(new XElement("users"));
            }

            return doc;
        }
    }
}
