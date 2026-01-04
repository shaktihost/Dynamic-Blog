using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




public partial class admin_addcategory : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindSubCategoryGrid();
            BindMainCategoryDropdown();
        }

        lbludategrid.Text = "";
        lbldeletegrid.Text = "";
        Catmess.Text = "";
    }

    private void BindMainCategoryDropdown()
    {
        string sql = "SELECT CatID, CatName FROM tblCategories";
        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                con.Open();
                CatDropList.DataSource = cmd.ExecuteReader();
                CatDropList.DataTextField = "CatName";
                CatDropList.DataValueField = "CatID";
                CatDropList.DataBind();
            }
        }

        CatDropList.Items.Insert(0, new ListItem("--Select Category--", "0"));
    }

    private void BindSubCategoryGrid()
    {
        string sql = @"SELECT sc.SubCatID, sc.SubCatName, sc.SubDesc, sc.MainCatID, c.CatName 
                   FROM tblSubCategories sc 
                   INNER JOIN tblCategories c ON sc.MainCatID = c.CatID";

        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
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

    protected void SubmitCat_Click(object sender, EventArgs e)
    {
        string subCatName = SubcatTxt.Text.Trim();
        string subDesc = SubDescTxt.Text.Trim();
        string mainCatID = CatDropList.SelectedItem.Value;

        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(constr))
        {
            conn.Open();

            SqlCommand getMaxIdCmd = new SqlCommand("SELECT ISNULL(MAX(SubCatID), 0) + 1 FROM tblSubCategories", conn);
            int newSubCatID = Convert.ToInt32(getMaxIdCmd.ExecuteScalar());

            string insertQuery = "INSERT INTO tblSubCategories (SubCatID, SubCatName, MainCatID, SubDesc) VALUES (@SubCatID, @SubCatName, @MainCatID, @SubDesc)";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
            insertCmd.Parameters.AddWithValue("@SubCatID", newSubCatID);
            insertCmd.Parameters.AddWithValue("@SubCatName", subCatName);
            insertCmd.Parameters.AddWithValue("@MainCatID", mainCatID);
            insertCmd.Parameters.AddWithValue("@SubDesc", subDesc);

            try
            {
                insertCmd.ExecuteNonQuery();
                Catmess.Text = "Subcategory added successfully!";
                Catmess.ForeColor = System.Drawing.Color.Green;
                SubcatTxt.Text = "";
                SubDescTxt.Text = "";
                CatDropList.ClearSelection();
                CatDropList.Items.FindByValue("0").Selected = true;
                BindSubCategoryGrid();
            }
            catch (Exception ex)
            {
                Catmess.Text = "Error: " + ex.Message;
                Catmess.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

  
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvCategory.PageIndex = e.NewPageIndex;
        this.BindSubCategoryGrid();

    }

   
    protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int subCatID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);

        string sql = "DELETE FROM tblSubCategories WHERE SubCatID=@SubCatID";
        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@SubCatID", subCatID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        BindSubCategoryGrid();
        lbldeletegrid.Text = "Subcategory deleted successfully.";
    }

    protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCategory.EditIndex = e.NewEditIndex;
        BindSubCategoryGrid(); // Call your method to rebind the data
    }

    protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCategory.EditIndex = -1;
        BindSubCategoryGrid();
    }

   
    protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCategory.Rows[e.RowIndex];
        int subCatID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);
        string subCatName = (row.FindControl("txtCat") as TextBox).Text;
        string subDesc = (row.FindControl("txtDes") as TextBox).Text;
        //DropDownList ddlMainCat = row.FindControl("ddlEditMainCat") as DropDownList;
        //int mainCatID = Convert.ToInt32(ddlMainCat.SelectedValue);

        string sql = "UPDATE tblSubCategories SET SubCatName=@SubCatName, SubDesc=@SubDesc WHERE SubCatID=@SubCatID";
        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@SubCatID", subCatID);
                cmd.Parameters.AddWithValue("@SubCatName", subCatName);
                cmd.Parameters.AddWithValue("@SubDesc", subDesc);
                //cmd.Parameters.AddWithValue("@MainCatID", mainCatID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        gvCategory.EditIndex = -1;
        BindSubCategoryGrid();
        lbludategrid.Text = "Subcategory updated successfully.";
    }


}