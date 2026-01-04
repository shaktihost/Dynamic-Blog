using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_controls_categorydynamic : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategories();
        }
    }


    public void BindCategories()
    {
        string CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptCategory.DataSource = dtBrands;
                    rptCategory.DataBind();
                }

            }
        }
    }

    protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
            Repeater rptSubCategories = e.Item.FindControl("rptSubCategories") as Repeater;

            string CS = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblSubCategories WHERE MainCatID='{0}'", catId), con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rptSubCategories.DataSource = dtBrands;
                        rptSubCategories.DataBind();
                    }

                }
            }
        }
    }

   

    //private void BindCategories()
    //{
    //    // Load categories from the database
    //    string query = "SELECT CatID, CatName, CatDesc FROM tblCategories";
    //    DataTable dtCategories = GetData(query);

    //    rptCategory.DataSource = dtCategories;
    //    rptCategory.DataBind();
    //}

    //protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        HiddenField hfCatId = (HiddenField)e.Item.FindControl("hfCatId");
    //        Repeater rptSub = (Repeater)e.Item.FindControl("rptSubCategories");

    //        if (hfCatId != null && rptSub != null)
    //        {
    //            string catId = hfCatId.Value;
    //            string query = "SELECT SubCatID, SubCatName FROM tblSubCategories WHERE MainCatID = @CatID";

    //            SqlParameter[] parameters = {
    //            new SqlParameter("@CatID", catId)
    //        };

    //            DataTable dtSubCategories = GetData(query, parameters);
    //            rptSub.DataSource = dtSubCategories;
    //            rptSub.DataBind();
    //        }
    //    }
    //}

    //// Utility method to fetch data
    //private DataTable GetData(string query, SqlParameter[] parameters = null)
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(query, con))
    //        {
    //            if (parameters != null)
    //            {
    //                cmd.Parameters.AddRange(parameters);
    //            }

    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                return dt;
    //            }
    //        }
    //    }
    //}


}