using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_controls_testlist : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.PopulateData();
        }

    }

    private void PopulateData()
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
                    lvCustomers.DataSource = dtBrands;
                    lvCustomers.DataBind();
                }

            }
        }
    }
    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.PopulateData();
    }


    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-');
    }  
}