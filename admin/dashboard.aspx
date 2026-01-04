<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="admin_panel" %>

<%@ Register Src="~/admin/useadmincontrol/AdminHeader.ascx" TagPrefix="uc1" TagName="AdminHeader" %>
<%@ Register Src="~/admin/useadmincontrol/AdminFooter.ascx" TagPrefix="uc1" TagName="AdminFooter" %>
<%@ Register Src="~/admin/useadmincontrol/AdminMenuDesh.ascx" TagPrefix="uc1" TagName="AdminMenuDesh" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png">

    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.min.css" />
    <!-- FontAwesome -->
    <link rel="stylesheet" href="../plugins/fontawesome/css/all.min.css" />
    <!-- Animation -->
    <link rel="stylesheet" href="../plugins/animate-css/animate.css" />
    <!-- slick Carousel -->
    <link rel="stylesheet" href="../plugins/slick/slick.css" />
    <link rel="stylesheet" href="../plugins/slick/slick-theme.css" />
    <!-- Colorbox -->
    <link rel="stylesheet" href="../plugins/colorbox/colorbox.css" />
    <!-- Template styles-->
    <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="body-inner">


            <uc1:AdminHeader runat="server" ID="AdminHeader" />


            <section id="main-container" class="main-container">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 order-1 order-lg-0">

                            <uc1:AdminMenuDesh runat="server" ID="AdminMenuDesh" />
                        </div>
                        <!-- Sidebar Col end -->

                        <div class="col-lg-8 mb-5 mb-lg-0 order-0 order-lg-1" style="height:460px;">
                            <div class="post">
                               <h1>Welcome to Dashboard Panel</h1>
                              
                            </div>
                            <!-- 1st post end -->


                           

                        </div>
                        <!-- Content Col end -->

                    </div>
                    <!-- Main row end -->

                </div>
                <!-- Container end -->
            </section>
            <!-- Main container end -->

           
            <uc1:AdminFooter runat="server" ID="AdminFooter" />
        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
