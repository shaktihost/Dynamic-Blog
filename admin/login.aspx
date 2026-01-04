<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_loginn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png"/>

    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.min.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="../plugins/fontawesome/css/all.min.css"/>
    <!-- Animation -->
    <link rel="stylesheet" href="../plugins/animate-css/animate.css"/>
    <!-- slick Carousel -->
    <link rel="stylesheet" href="../plugins/slick/slick.css">
    <link rel="stylesheet" href="../plugins/slick/slick-theme.css"/>
    <!-- Colorbox -->
    <link rel="stylesheet" href="../plugins/colorbox/colorbox.css"/>
    <!-- Template styles-->
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
   
    <form id="form1" runat="server">
        <div style="background-image: url('adminimage/backimage.webp'); background-size: cover; height:790px; background-position: center;">
            <section id="main-container" class="main-container">
                <div class="container">

                    <div class="gap-60"></div>

                    <div class="gap-40"></div>

                    <div class="row" style="text-align:center;">
                       <div class="col-md-12">
                           <h3>DEMO </h3>
                            <h4 class="column-title">Secure Admin</h4>
                           <center><asp:Login ID="userLogin" runat="server" OnAuthenticate="ValidateUser"  CssClass="adminlogin"></asp:Login></center>
                        </div>

                    </div>
                    <!-- Content row -->
                </div>
                <!-- Conatiner end -->
            </section>
            <!-- Main container end -->
        </div>
    </form>
</body>
</html>
