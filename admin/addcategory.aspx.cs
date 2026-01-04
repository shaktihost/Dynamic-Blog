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
            
        }
       
        lbludategrid.Text = "";
        lbldeletegrid.Text = "";
        Catmess.Text = "";
        
    }

    private void BindGrid()
    {
        string sql = "SELECT CatID, CatName, CatDesc FROM tblCategories";
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
        string category = (row.FindControl("txtCat") as TextBox).Text;
        string description = (row.FindControl("txtDes") as TextBox).Text;
        string sql = "UPDATE tblCategories SET CatName=@CatName, CatDesc=@CatDesc WHERE CatID=@CatID";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@CatID", catid);
                cmd.Parameters.AddWithValue("@CatName", category);
                cmd.Parameters.AddWithValue("@CatDesc", description);
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
        int CatID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);
        string sql = "DELETE FROM tblCategories WHERE CatID=@CatID";
        string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@CatID", CatID);
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
        string catName = TxtAddCat.Text.Trim();
        string catDesc = TxtDesc.Text.Trim();

        string connectionString = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Step 1: Generate new unique CatID
            SqlCommand getMaxIdCmd = new SqlCommand("SELECT ISNULL(MAX(CatID), 0) + 1 FROM tblCategories", conn);
            int newCatID = Convert.ToInt32(getMaxIdCmd.ExecuteScalar());


            // Step 2: Insert new category with generated CatID
            string insertQuery = "INSERT INTO tblCategories (CatID, CatName, CatDesc) VALUES (@CatID, @CatName, @CatDesc)";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
            insertCmd.Parameters.AddWithValue("@CatID", newCatID);
            insertCmd.Parameters.AddWithValue("@CatName", catName);
            insertCmd.Parameters.AddWithValue("@CatDesc", catDesc);

            try
            {
                insertCmd.ExecuteNonQuery();
                Catmess.Text = "Category added successfully!";
                Catmess.ForeColor = System.Drawing.Color.Green;
                TxtAddCat.Text = "";
                TxtDesc.Text = "";
                BindGrid();
            }
            catch (Exception ex)
            {
                Catmess.Text = "Error: " + ex.Message;
                Catmess.ForeColor = System.Drawing.Color.Red;
            }
        }
    }


    //protected void SubmitCat_Click(object sender, EventArgs e)
    //{
    //    string catName = TxtAddCat.Text.Trim();
    //    string catDesc = TxtDesc.Text.Trim();

    //    string connectionString = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;

    //    using (SqlConnection conn = new SqlConnection(connectionString))
    //    {
    //        string query = "INSERT INTO tblCategories (CatName, CatDesc) VALUES (@CatName, @CatDesc)";
    //        SqlCommand cmd = new SqlCommand(query, conn);

    //        cmd.Parameters.AddWithValue("@CatName", catName);
    //        cmd.Parameters.AddWithValue("@CatDesc", catDesc);

    //        try
    //        {
    //            conn.Open();
    //            cmd.ExecuteNonQuery();
    //            Catmess.Text = "Category added successfully!";
    //            Catmess.ForeColor = System.Drawing.Color.Green;
    //        }
    //        catch (Exception ex)
    //        {
    //            Catmess.Text = "Error: " + ex.Message;
    //            Catmess.ForeColor = System.Drawing.Color.Red;
    //        }
    //    }
    //}

//    protected void SubmitCat_Click(object sender, EventArgs e)
//    {
//        String CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
//        using (SqlConnection con = new SqlConnection(CS))
//        {
//            SqlCommand cmd = new SqlCommand("insert into tblCategories values('" + TxtAddCat.Text + "','" + TxtDesc.Text + "')", con);

//            try
//            {

//                con.Open();
//                cmd.ExecuteNonQuery();
//                Catmess.Text = "Add new category Succesfully..";
//                TxtAddCat.Text = "";
//                TxtDesc.Text = "";
//            }
//            catch
//            {
//                Catmess.Text = "Not add new category.?";
//                Catmess.ForeColor = System.Drawing.Color.Red;
//            }
//            finally
//            {
//                con.Close();
//                con.Dispose();
//                this.BindGrid();
//            }
//        }
      
//    //string mainconn = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
//    //SqlConnection con = new SqlConnection(mainconn);  
//    //SqlCommand cmd = new SqlCommand();  
//    //cmd.CommandType = CommandType.StoredProcedure;   
//    //cmd.CommandText = "sp_addcategory";  
//    //cmd.Parameters.Add("@catname", SqlDbType.NVarChar, 150).Value = TxtAddCat.Text.Trim();  
//    //cmd.Parameters.Add("@catdesc", SqlDbType.NVarChar, 150).Value = TxtDesc.Text.Trim();  
    
//    //cmd.Connection = con;
//    //try   
//    //{  
//    //    con.Open();  
//    //    cmd.ExecuteNonQuery();
//    //    Catmess.Text="Add new category Succesfully..";
//    //    TxtAddCat.Text = "";
//    //    TxtDesc.Text = "";
        
//    //} catch {  
//    //    Catmess.Text="Not add new category.?";
//    //    Catmess.ForeColor = System.Drawing.Color.Red;
//    //} finally {  
//    //    con.Close();  
//    //    con.Dispose();
//    //    this.BindGrid();
        
//    //}  
//}

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gvCategory.EditIndex)
        {
            (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }


        //string mainconn = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        //SqlConnection sqlconn = new SqlConnection(mainconn);
        //string sqlquery = "insert into [dbo].[addcategory] (catname,catdesc) values (@catname,@catdesc)";
            
        //sqlconn.Open();
        //SqlCommand sqlconn = new SqlCommand(sqlquery, sqlconn);
        //sqlconn.Parameters.AddWithValue("@catname", TxtAddCat.Text);
        //sqlconn.Parameters.AddWithValue("@catdesc", TxtDesc.Text);
        //int i = sqlconn.ExecuteNonQuery();
        //sqlconn.Close();


}