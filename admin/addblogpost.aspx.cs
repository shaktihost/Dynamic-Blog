using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


public partial class admin_addblogpost : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
           
            BindMainCategory();
            BlogPDate.Text = DateTime.Now.ToString();
            this.BindGrid();

        }
    }

    private void BindGrid()
    {
        string sql = "SELECT PID, PName, PDescription, PURL FROM tblProductss_New";
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

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvCategory.PageIndex = e.NewPageIndex;
        this.BindGrid();

    }

    private void BindMainCategory()
    {
        
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from tblCategories", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                CatDropList.DataSource = dt;
                CatDropList.DataTextField = "CatName";
                CatDropList.DataValueField = "CatID";
                CatDropList.DataBind();
                CatDropList.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void CatDropList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCategoryID = Convert.ToInt32(CatDropList.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(CS))
        {
            //SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + CatDropList.SelectedItem.Value + "'", con);
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubCategories WHERE MainCatID = @MainCatID", con);
            cmd.Parameters.AddWithValue("@MainCatID", CatDropList.SelectedItem.Value);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                SubCatDropList.DataSource = dt;
                SubCatDropList.DataTextField = "SubCatName";
                SubCatDropList.DataValueField = "SubCatID";
                SubCatDropList.DataBind();
                SubCatDropList.Items.Insert(0, new ListItem("-Select-", "0"));
                SubCatDropList.Enabled = true;
            }
        }
    }


    protected void BlogPost_Click(object sender, EventArgs e)
    {


        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("procInsertProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PName", txtblogtitle.Text);
            cmd.Parameters.AddWithValue("@PDescription", txtblogdesc.Text);
            cmd.Parameters.AddWithValue("@PCategoryID", CatDropList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubCatID", SubCatDropList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PURL", txtblogUrl.Text);
            cmd.Parameters.AddWithValue("@PDateTime", BlogPDate.Text);
            cmd.Parameters.AddWithValue("@PshortDesc", txtMtSDes.Text);
            try
            {
                con.Open();
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                //Insert and upload Images
                if (fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtblogtitle.Text.ToString().Trim() + "01" + Extention);

                    //SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtblogtitle.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                    //cmd3.ExecuteNonQuery();
                    SqlCommand cmd3 = new SqlCommand("INSERT INTO tblProductImages_NEW (PID, Name, Extention) VALUES (@PID, @Name, @Extention)", con);
                    cmd3.Parameters.AddWithValue("@PID", PID);
                    cmd3.Parameters.AddWithValue("@Name", txtblogtitle.Text.ToString().Trim() + "01");
                    cmd3.Parameters.AddWithValue("@Extention", Extention);
                    cmd3.ExecuteNonQuery();

                }

                Catmess.Text = "Add new Blog Post Succesfully..";
                Catmess.ForeColor = System.Drawing.Color.Green;
                txtblogtitle.Text = "";
                txtblogdesc.Text = "";
                CatDropList.ClearSelection();
                SubCatDropList.Items.Clear();
                SubCatDropList.Enabled = false;
                txtblogUrl.Text = "";
                txtMtSDes.Text = "";
                this.BindGrid();
            }
            
            catch (Exception ex)
            {
                Catmess.Text = "Error: " + ex.Message;
                Catmess.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

        }
    }



    protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int pid = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);

        string sql = "DELETE FROM tblProductss_New WHERE PID=@PID";
        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@PID", pid);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        
        lbldeletegrid.Text = "Subcategory deleted successfully.";
        this.BindGrid();
    }

    protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCategory.EditIndex = e.NewEditIndex;
        this.BindGrid(); // Call your method to rebind the data
    }


    protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCategory.EditIndex = -1;
        this.BindGrid();
    }


    protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCategory.Rows[e.RowIndex];
        int INtCatID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values[0]);
        string INTCatName = (row.FindControl("txtCat") as TextBox).Text;
        string INTurl = (row.FindControl("txtURL") as TextBox).Text;
        string Intshort = (row.FindControl("txtDes") as TextBox).Text;
        //DropDownList ddlMainCat = row.FindControl("ddlEditMainCat") as DropDownList;
        //int mainCatID = Convert.ToInt32(ddlMainCat.SelectedValue);

        string sql = "UPDATE tblProductss_New SET PName=@PName, PURL=@PURL,PshortDesc=@PshortDesc WHERE PID=@PID";
        //string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@PID", INtCatID);
                cmd.Parameters.AddWithValue("@PName", INTCatName);
                cmd.Parameters.AddWithValue("@PURL", INTurl);
                cmd.Parameters.AddWithValue("@PshortDesc", Intshort);
                //cmd.Parameters.AddWithValue("@MainCatID", mainCatID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        gvCategory.EditIndex = -1;
        this.BindGrid();
        lbludategrid.Text = "Subcategory updated successfully.";
        
    }

  
}
