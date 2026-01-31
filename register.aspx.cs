using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace LogInForm
{
    public partial class register : System.Web.UI.Page
    {
        // Connection string from web.config
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No special code needed on Page_Load
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // STEP 1: CHECK IF EMAIL ALREADY EXISTS
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                string checkQuery = "SELECT COUNT(*) FROM signup WHERE email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Email", EmailTextBox.Text.Trim());

                int exists = (int)checkCmd.ExecuteScalar();
                if (exists > 0)
                {
                    EmailErrorLabel.Text = "This email is already registered. Please use a different one.";
                    return;
                }
                else
                {
                    EmailErrorLabel.Text = ""; // Clear error
                }
            }

            // STEP 2: UPLOAD PHOTO (IF ANY)
            string photoPath = null;
            if (FileUploadPhoto.HasFile)
            {
                string folderPath = Server.MapPath("~/UserPhotos/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(FileUploadPhoto.FileName);
                string filePath = folderPath + fileName;
                FileUploadPhoto.SaveAs(filePath);

                // Just save the path; no image preview
                photoPath = "~/UserPhotos/" + fileName;
            }

            // STEP 3: INSERT USER DATA INTO DATABASE
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = @"INSERT INTO signup 
                                (fname, lname, gender, contact, email, address, username, password, PhotoPath)
                                VALUES (@fname, @lname, @gender, @contact, @Email, @address, @username, @password, @PhotoPath)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@fname", FirstNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", SecondNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@contact", Contact.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@username", UserNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password", PassTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@PhotoPath", (object)photoPath ?? DBNull.Value);

                conn.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    // SHOW ALERT POPUP AND REDIRECT TO LOGIN PAGE
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Signup successful!'); window.location='LOGIN.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Signup failed. Try again.');", true);
                }
            }
        }

        // CLEAR ALL CONTROLS (not really needed since redirect happens)
        void ClearControls()
        {
            //FirstNameTextBox.Text = "";
            //SecondNameTextBox.Text = "";
            //Contact.Text = "";
            //EmailTextBox.Text = "";
            //AddressTextBox.Text = "";
            //UserNameTextBox.Text = "";
            //PassTextBox.Text = "";
            //ConfirmPassTextBox.Text = "";
            //DropDownList1.ClearSelection();
            //EmailErrorLabel.Text = "";

            // No image to clear since preview removed
        }
    }
}
