<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        //RegisterRoutes(System.Web.Routing.RouteTable.Routes);
        //RouteConfig.RegisterRoutes(RouteTable.Routes);
    }

    public static void RegisterRoutes(RouteCollection Routes)
    {
        //routeCollection.MapPageRoute("RouteForArticle", "Blog/{PID}/{PName}", "~/postview.aspx");
        //routeCollection.MapPageRoute("CustomerDetails", "Customers/{CustomerId}", "~/postview.aspx");
        //Routes.MapPageRoute("RouteForArticle", "Blog/{PID}/{PName}", "~/postview.aspx");
        Routes.MapPageRoute("default", "default", "~/Default.aspx");
        Routes.MapPageRoute("contact", "contact", "~/contact.aspx");
        Routes.MapPageRoute("about", "about", "~/about.aspx");
        Routes.MapPageRoute("privacy-policy", "privacy-policy", "~/privacy-policy.aspx");
        Routes.MapPageRoute("terms-and-conditions", "terms-and-conditions", "~/terms-and-conditions.aspx");
        Routes.MapPageRoute("login", "admin/login", "~/admin/login.aspx");
        Routes.MapPageRoute("dashboard", "admin/dashboard", "~/admin/dashboard.aspx");
        Routes.MapPageRoute("addcategory", "admin/addcategory", "~/admin/addcategory.aspx");
        Routes.MapPageRoute("addsubcategory", "admin/addsubcategory", "~/admin/addsubcategory.aspx");
        Routes.MapPageRoute("changepass", "admin/changepass", "~/admin/changepass.aspx");
        Routes.MapPageRoute("addblogpost", "admin/addblogpost", "~/admin/addblogpost.aspx");

        Routes.MapPageRoute("post", "post", "~/post.aspx");
        Routes.MapPageRoute("RouteForArticle", "Blog/{PID}/{PName}", "~/postview.aspx");


    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
