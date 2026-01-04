using System;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class admin_loginn : System.Web.UI.Page
{
    protected void ValidateUser(object sender, EventArgs e)
    {
        int AdminId = 0;
        string spName = "Validate_Admin";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(spName, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Aminname", userLogin.UserName);
                cmd.Parameters.AddWithValue("@Password", userLogin.Password);
                con.Open();
                AdminId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            switch (AdminId)
            {
                case -1:
                    userLogin.FailureText = "Username and/or password is incorrect.";
                    break;
                case -2:
                    userLogin.FailureText = "Account has not been activated.";
                    break;
                default:
                    FormsAuthentication.RedirectFromLoginPage(userLogin.UserName, userLogin.RememberMeSet);
                    break;
            }
        }
    }
    //protected void ButLogin_Click1(object sender, EventArgs e)
    //{
    //    if (TxtAdminLogin.Text == "admin" && TxtPassword.Text == "pass")
    //    {
    //        Response.Redirect("~/admin/panel.aspx");
    //    }
    //    else
    //    {
    //        Response.Redirect("~/admin/loginn.aspx");
    //    }
    //}
}