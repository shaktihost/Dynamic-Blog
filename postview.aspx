<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postview.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/user-controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/user-controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/user-controls/categorydynamic.ascx" TagPrefix="uc1" TagName="categorydynamic" %>
<%@ Register Src="~/user-controls/recentpost.ascx" TagPrefix="uc1" TagName="recentpost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DEMO.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png" />

    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css" />
    <!-- FontAwesome -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.min.css" />
    <!-- Animation -->
    <link rel="stylesheet" href="plugins/animate-css/animate.css" />
    <!-- slick Carousel -->
    <link rel="stylesheet" href="plugins/slick/slick.css" />
    <link rel="stylesheet" href="plugins/slick/slick-theme.css" />
    <!-- Colorbox -->
    <link rel="stylesheet" href="plugins/colorbox/colorbox.css" />
    <!-- Template styles-->
    <link rel="stylesheet" href="css/style.css" />
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
            <section id="main-container" class="main-container">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 mb-5 mb-lg-0">
                            <asp:ListView ID="listViewProduct" runat="server">
                                <ItemTemplate>

                                    <asp:Image ID="imgProduct" runat="server"
                                        ImageUrl='<%# GetImageUrl(Eval("PID"), Eval("ImageName"), Eval("ImageExt")) %>'
                                        Style="max-width: 100%; height: auto; display: block;" />

                                    <div class="divDet1 pt-2">
                                        <br />
                                        <h4 class="proNameView"><%#Eval("PName") %></h4>
                                    </div>

                                 
                                    <br />
                                    <a href="https://dl.flipkart.com/dl//oppo-reno14-5g-forest-green-256-gb/p/itm4d9e853eee6cf?pid=MOBHDDQ95MNGEZSJ&affid=ashwanik6">
                                        <img src="https://img1a.flixcart.com/www/prod/images/buy_btn_3-0b867813.png"></a>






                                    <div class="divDet1">

                                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                                    </div>

                                    <div class="divDet1">
                                        <p style="text-align: justify;">
                                            <%#Eval("PDescription") %>
                                    </div>





                                    <p>Posted : <%# Convert.ToDateTime(Eval("PDateTime")).ToString("MMM dd, yyyy") %></p>
                                </ItemTemplate>
                            </asp:ListView>

                        </div>

                        <!-- Content Col end -->

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
            <script src="../../plugins/jQuery/jquery.min.js"></script>
            <!-- Bootstrap jQuery -->
            <script src="../../plugins/bootstrap/bootstrap.min.js" defer></script>
            <!-- Slick Carousel -->
            <script src="../../plugins/slick/slick.min.js"></script>
            <script src="../../plugins/slick/slick-animation.min.js"></script>
            <!-- Color box -->
            <script src="../../plugins/colorbox/jquery.colorbox.js"></script>
            <!-- shuffle -->
            <script src="../../plugins/shuffle/shuffle.min.js" defer></script>


            <!-- Template custom -->
            <script src="js/script.js"></script>

        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
