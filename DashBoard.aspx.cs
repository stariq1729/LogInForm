using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace LogInForm
{
    public partial class DashBoard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                if (Session["username"] == null)
                {
                    Response.Redirect("LOGIN.aspx");
                }
                else
                {
                    LoadUserData(Session["username"].ToString());
                }
            }
        }

        private void LoadUserData(string username)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT * FROM signup WHERE username=@username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", username);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblUser.Text = reader["fname"].ToString();
                    lblFirstName.Text = reader["fname"].ToString();
                    lblLastName.Text = reader["lname"].ToString();
                    lblEmail.Text = reader["email"].ToString();
                    lblContact.Text = reader["contact"].ToString();
                    lblAddress.Text = reader["address"].ToString();
                    lblGender.Text = reader["gender"].ToString();
                    lblUsername.Text = reader["username"].ToString();

                    string photoPath = reader["PhotoPath"].ToString();
                    if (!string.IsNullOrEmpty(photoPath))
                    {
                        imgPhoto.ImageUrl = photoPath;
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Clear session
            Response.Redirect("LOGIN.aspx"); // Redirect to login page
        }
    }
}
