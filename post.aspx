<%@ Page Language="C#" AutoEventWireup="true" CodeFile="post.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/user-controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/user-controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/user-controls/categorydynamic.ascx" TagPrefix="uc1" TagName="categorydynamic" %>
<%@ Register Src="~/user-controls/recentpost.ascx" TagPrefix="uc1" TagName="recentpost" %>
<%@ Register Src="~/user-controls/Allpostcontrols.ascx" TagPrefix="uc1" TagName="Allpostcontrols" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DEMO.com</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png">

    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="plugins/animate-css/animate.css">
    <!-- slick Carousel -->
    <link rel="stylesheet" href="plugins/slick/slick.css">
    <link rel="stylesheet" href="plugins/slick/slick-theme.css">
    <!-- Colorbox -->
    <link rel="stylesheet" href="plugins/colorbox/colorbox.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="css/style.css">

    <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-SSP0S9VELN"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-SSP0S9VELN');
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="body-inner">


            <!-- Header start -->
            <uc1:Header runat="server" ID="Header" />
            <!--/ Header end -->
          
            <!-- Banner area end -->

            <section id="main-container" class="main-container">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 mb-5 mb-lg-0">
                            <uc1:Allpostcontrols runat="server" ID="Allpostcontrols" />
                            <!-- Content Col end -->
                        </div>
                        <div class="col-lg-4">

                            <div class="sidebar sidebar-right">
                                <uc1:recentpost runat="server" ID="recentpost" />
                                <!-- Recent post end -->
                                
                                <uc1:categorydynamic runat="server" ID="categorydynamic" />
                               
                                <!-- Categories end -->

                            </div>
                            <!-- Sidebar end -->
                        </div>
                        <!-- Sidebar Col end -->

                    </div>
                    <!-- Main row end -->
                </div>
                <!-- Container end -->
            </section>
            <!-- Main container end -->

            <uc1:Footer runat="server" ID="Footer" />
            <!-- Footer end -->


            <!-- Javascript Files
  ================================================== -->

            <!-- initialize jQuery Library -->
            <script src="plugins/jQuery/jquery.min.js"></script>
            <!-- Bootstrap jQuery -->
            <script src="plugins/bootstrap/bootstrap.min.js" defer></script>
            <!-- Slick Carousel -->
            <script src="plugins/slick/slick.min.js"></script>
            <script src="plugins/slick/slick-animation.min.js"></script>
            <!-- Color box -->
            <script src="plugins/colorbox/jquery.colorbox.js"></script>
            <!-- shuffle -->
            <script src="plugins/shuffle/shuffle.min.js" defer></script>


            <!-- Google Map API Key-->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
            <!-- Google Map Plugin-->
            <script src="plugins/google-map/map.js" defer></script>

            <!-- Template custom -->
            <script src="js/script.js"></script>

        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
