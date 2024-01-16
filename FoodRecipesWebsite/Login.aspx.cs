using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FoodRecipesWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                string username = Username.Text;
                string password = Password.Text;

                // Validate the user credentials
                if (ValidateUser(username, password))
                {
                    // Successful login
                    // Store user information in session variables
                    Session["LoggedIn"] = true;
                    Session["Username"] = username; // Store the actual username

                    // Redirect to a secured page (e.g., home page)
                    Response.Redirect("Index.aspx");
                }
            }
        }

        private bool ValidateUser(string username, string enteredPassword)
        {
            string filePath = Server.MapPath("TestingFile.xml");
            if (File.Exists(filePath))
            {
                XDocument doc = XDocument.Load(filePath);

                var user = doc.Descendants("user")
                              .FirstOrDefault(u => (string)u.Element("username") == username);

                if (user != null)
                {
                    string storedPassword = (string)user.Element("password");

                    // Logging for troubleshooting
                    Console.WriteLine($"Entered Username: {username}");
                    Console.WriteLine($"Entered Password: {enteredPassword}");
                    Console.WriteLine($"Stored Password: {storedPassword}");

                    // Compare plain text passwords
                    return enteredPassword.Equals(storedPassword, StringComparison.OrdinalIgnoreCase);
                }
            }

            return false;
        }
    }
}
