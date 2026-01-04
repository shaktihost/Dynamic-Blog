using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;





public partial class admin_addcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();
            adminPDate.Text = DateTime.Now.ToString();
        }
       
        lbludategrid.Text = "";
        lbldeletegrid.Text = "";
        Catmess.Text = "";
        
    }

    private void BindGrid()
    {
        string sql = "SELECT AdminId, Aminname, Email, Password FROM Admin";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    gvCategory.DataSource = dt;
                    gvCategory.DataBind();
                }
            }
        }
    }

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCategory.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCategory.Rows[e.RowIndex];
        int catid = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);
        string name = (row.FindControl("txtname") as TextBox).Text;
        string email = (row.FindControl("txtemail") as TextBox).Text;
        string password = (row.FindControl("txtpass") as TextBox).Text;
        string sql = "UPDATE Admin SET Aminname=@Aminname, Email=@Email, Password=@Password WHERE AdminId=@AdminId";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@AdminId", catid);
                cmd.Parameters.AddWithValue("@Aminname", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        gvCategory.EditIndex = -1;
        this.BindGrid();
        lbludategrid.Text = "Record Update Succesfully..";
        lbldeletegrid.Text = "";
    }


    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvCategory.PageIndex = e.NewPageIndex;
        this.BindGrid();
        
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        gvCategory.EditIndex = -1;
        this.BindGrid();
    }

    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int adminID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);
        string sql = "DELETE FROM Admin WHERE AdminId=@AdminId";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@AdminId", adminID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
        }

        this.BindGrid();
        lbldeletegrid.Text = "Recod Delete Succesfully..";
        lbludategrid.Text = "";
    }
    
    protected void SubmitCat_Click(object sender, EventArgs e)
    {
       
        string adminname = TxtAddname.Text.Trim();
        string adminpass = Txtpass.Text.Trim();
        string adminemail = TextEmail.Text.Trim();
        string adminDTime = adminPDate.Text.Trim();

        string connectionString = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Step 1: Generate new unique CatID
            SqlCommand getMaxIdCmd = new SqlCommand("SELECT ISNULL(MAX(AdminId), 0) + 1 FROM Admin", conn);
            int newCatID = Convert.ToInt32(getMaxIdCmd.ExecuteScalar());


            // Step 2: Insert new category with generated CatID
            string insertQuery = "INSERT INTO Admin (AdminId, Aminname, Password,Email,CreatedDate) VALUES (@AdminId, @Aminname, @Password,@Email,@CreatedDate)";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
            insertCmd.Parameters.AddWithValue("@AdminId", newCatID);
            insertCmd.Parameters.AddWithValue("@Aminname", adminname);
            insertCmd.Parameters.AddWithValue("@Password", adminpass);
            insertCmd.Parameters.AddWithValue("@Email", adminemail);
            insertCmd.Parameters.AddWithValue("@CreatedDate", adminDTime);

            try
            {
                insertCmd.ExecuteNonQuery();
                Catmess.Text = "Admin added successfully!";
                Catmess.ForeColor = System.Drawing.Color.Green;
                TxtAddname.Text = "";
                Txtpass.Text = "";
                TextEmail.Text = "";
                adminPDate.Text = "";
                BindGrid();
            }
            catch (Exception ex)
            {
                Catmess.Text = "Error: " + ex.Message;
                Catmess.ForeColor = System.Drawing.Color.Red;
            }
        }


}

}