using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace LogInForm
{
    public partial class LOGIN : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogInButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM signup WHERE username=@user AND password=@pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", UsertextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", PassTextBox.Text.Trim());

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    // Store username in session
                    Session["username"] = UsertextBox.Text.Trim();
                    Response.Redirect("DashBoard.aspx"); // redirect to dashboard
                }
                else
                {
                    // Login failed
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                        "<script>alert('Login failed! Please check username and password.');</script>");
                }
            }
        }
    }
}
