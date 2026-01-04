using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //if (!IsPostBack)
        //{
        //    string pid = Page.RouteData.Values["PID"] as string;
        //    if (!string.IsNullOrEmpty(pid))
        //    {
        //        BindListView(pid);
        //    }
        //}

        if (!IsPostBack)
        {
            string pid = Page.RouteData.Values["PID"] as string;

            if (!string.IsNullOrEmpty(pid))
            {
                DataTable dt = BindListView(pid);


            //string pname = Page.RouteData.Values["PName"] as string;
            //if (!string.IsNullOrEmpty(pname))
            //{
            //    DataTable dt = BindListView(pname);
                if (dt.Rows.Count > 0)
                {
                    string title = dt.Rows[0]["PName"].ToString();
                    string description = dt.Rows[0]["PshortDesc"].ToString();
                    string keyword = dt.Rows[0]["PURL"].ToString();

                    // Set page title
                    Page.Title = title;

                    // Meta description
                    HtmlMeta metaDescription = new HtmlMeta();
                    metaDescription.Name = "description";
                    metaDescription.Content = description;
                    Page.Header.Controls.Add(metaDescription);

                    // Meta keywords (you could generate keywords based on product name, etc.)
                    HtmlMeta metaKeywords = new HtmlMeta();
                    metaKeywords.Name = "keywords";
                    metaKeywords.Content = keyword; // basic keyword generation
                    Page.Header.Controls.Add(metaKeywords);
                }
            }
        }

    }

    private DataTable BindListView(string pid)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
        string query = @"
        SELECT 
            p.PID,
            p.PName,
            p.PDescription,
            p.PURL,
            p.PDateTime,
            PshortDesc,
            i.Name AS ImageName,
            i.Extention AS ImageExt
        FROM 
            tblProductss_New p
        LEFT JOIN 
            tblProductImages_NEW i ON p.PID = i.PID
        WHERE 
            p.PID = @PID";

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.Add("@PID", SqlDbType.Int).Value = Convert.ToInt64(pid);
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                listViewProduct.DataSource = dt;
                listViewProduct.DataBind();

                return dt;
            }
        }
    }

//    private DataTable BindListView(string PName)
//    {
//        string connStr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
//        string query = @"
//        SELECT 
//            p.PID,
//            p.PName,
//            p.PDescription,
//            p.PURL,
//            p.PDateTime,
//            PshortDesc,
//            i.Name AS ImageName,
//            i.Extention AS ImageExt
//        FROM 
//            tblProductss_New p
//        LEFT JOIN 
//            tblProductImages_NEW i ON p.PID = i.PID
//        WHERE 
//            p.PName = @PName";

//        using (SqlConnection conn = new SqlConnection(connStr))
//        {
//            using (SqlCommand cmd = new SqlCommand(query, conn))
//            {
//                cmd.Parameters.Add("@PName", SqlDbType.NVarChar).Value = PName;
//                conn.Open();
//                SqlDataAdapter da = new SqlDataAdapter(cmd);
//                DataTable dt = new DataTable();
//                da.Fill(dt);

//                listViewProduct.DataSource = dt;
//                listViewProduct.DataBind();

//                return dt;
//            }
//        }
//    }




//    private void BindListView(string pid)
//    {
//        string connStr = ConfigurationManager.ConnectionStrings["MyconnectionBlog"].ConnectionString;
//        string query = @"
//        SELECT 
//            p.PID,
//            p.PName,
//            p.PDescription,
//            p.PDateTime,
//            i.Name AS ImageName,
//            i.Extention AS ImageExt
//        FROM 
//            tblProducts p
//        LEFT JOIN 
//            tblProductImages i ON p.PID = i.PID
//        WHERE 
//            p.PID = @PID";

//        using (SqlConnection conn = new SqlConnection(connStr))
//        {
//            using (SqlCommand cmd = new SqlCommand(query, conn))
//            {
//                cmd.Parameters.Add("@PID", SqlDbType.Int).Value = Convert.ToInt64(pid);
//                conn.Open();
//                SqlDataAdapter da = new SqlDataAdapter(cmd);
//                DataTable dt = new DataTable();
//                da.Fill(dt);

//                listViewProduct.DataSource = dt;
//                listViewProduct.DataBind();
//            }
//        }
//    }



    protected string GetImageUrl(object pid, object imageName, object imageExt)
    {
        if (pid == DBNull.Value || imageName == DBNull.Value || imageExt == DBNull.Value)
        {
            return ResolveUrl("~/images/noimage.jpg");
        }

        string id = pid.ToString();
        string name = imageName.ToString();
        string ext = imageExt.ToString();
        if (!ext.StartsWith(".")) ext = "." + ext;

        string relativePath = string.Format("~/Images/ProductImages/{0}/{1}{2}", id, name, ext);
        return ResolveUrl(relativePath);
    }

   

}