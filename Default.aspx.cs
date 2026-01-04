using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //BindCategories();
    }


    //public void BindCategories()
    //{
    //    String CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(CS))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
    //        {
    //            cmd.CommandType = CommandType.Text;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dtBrands = new DataTable();
    //                sda.Fill(dtBrands);
    //                rptCategory.DataSource = dtBrands;
    //                rptCategory.DataBind();
    //            }

    //        }
    //    }
    //}

    //protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
    //        Repeater rptSubCategories = e.Item.FindControl("rptSubCategories") as Repeater;

    //        String CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
    //        using (SqlConnection con = new SqlConnection(CS))
    //        {
    //            using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblSubCategories WHERE MainCatID='{0}'", catId), con))
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                {
    //                    DataTable dtBrands = new DataTable();
    //                    sda.Fill(dtBrands);
    //                    rptSubCategories.DataSource = dtBrands;
    //                    rptSubCategories.DataBind();
    //                }

    //            }
    //        }
    //    }
    //}
}