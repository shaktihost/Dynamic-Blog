using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_controls_recentpost : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindProductRepeater();
        lvProducts.DataSource = new int[] { 1, 2, 3 };
    }

    private void BindProductRepeater()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        Int64 CatId = Request.QueryString["cat"] == null ? 0 : Convert.ToInt64(Request.QueryString["cat"]);
        Int64 SubCatId = Request.QueryString["subcat"] == null ? 0 : Convert.ToInt64(Request.QueryString["subcat"]);

        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (CatId > 0)
                {
                    cmd.Parameters.AddWithValue("@PCategoryID", CatId);
                }
                if (SubCatId > 0)
                {
                    cmd.Parameters.AddWithValue("@PSubCatID", SubCatId);
                }
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    lvProducts.DataSource = dtBrands;
                    lvProducts.DataBind();
                }

            }
        }
    }

    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-');
    }

    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lvProducts.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindProductRepeater();
    }


    //protected string GetTitle(object obj)
    //{
    //    return obj.ToString().Replace(' ', '-');
    //}  
}