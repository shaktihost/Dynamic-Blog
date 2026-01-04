<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/user-controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/user-controls/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/user-controls/categorydynamic.ascx" TagPrefix="uc1" TagName="categorydynamic" %>
<%@ Register Src="~/user-controls/recentpost.ascx" TagPrefix="uc1" TagName="recentpost" %>
<%@ Register Src="~/user-controls/sendquery.ascx" TagPrefix="uc1" TagName="sendquery" %>




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
    <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.min.css"/>
    <!-- Template styles-->
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="body-inner">


            <!-- Header start -->
            <uc1:Header runat="server" ID="Header" />
            <!--/ Header end -->
            <div id="banner-area" class="banner-area" style="background-image: url(images/banner/banner3.jpg)">
                <div class="banner-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="banner-heading">
                                    <h1 class="banner-title">contact</h1>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb justify-content-center">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item"><a href="/contact">contact</a></li>

                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <!-- Col end -->
                        </div>
                        <!-- Row end -->
                    </div>
                    <!-- Container end -->
                </div>
                <!-- Banner text end -->
            </div>
            <!-- Banner area end -->

            <section id="main-container" class="main-container">
                <div class="container">

                    <div class="row text-center">
                        <div class="col-12">
                            <h2 class="section-title">Reaching our Office</h2>
                            <h3 class="section-sub-title">Find Our Location</h3>
                        </div>
                    </div>
                    <!--/ Title row end -->

                    <div class="row">
                        <div class="col-md-4">
                            <div class="ts-service-box-bg text-center h-100">
                                <span class="ts-service-icon icon-round">
                                    <i class="fas fa-map-marker-alt mr-0"></i>
                                </span>
                                <div class="ts-service-box-content">
                                    <h4>Visit Our Office</h4>
                                    <p>9051 Roorkee Incorporate, INDIA</p>
                                </div>
                            </div>
                        </div>
                        <!-- Col 1 end -->

                        <div class="col-md-4">
                            <div class="ts-service-box-bg text-center h-100">
                                <span class="ts-service-icon icon-round">
                                    <i class="fa fa-envelope mr-0"></i>
                                </span>
                                <div class="ts-service-box-content">
                                    <h4>Email Us</h4>
                                    <p>ashwanik616@gmail.com</p>
                                </div>
                            </div>
                        </div>
                        <!-- Col 2 end -->

                        <div class="col-md-4">
                            <div class="ts-service-box-bg text-center h-100">
                                <span class="ts-service-icon icon-round">
                                    <i class="fa fa-phone-square mr-0"></i>
                                </span>
                                <div class="ts-service-box-content">
                                    <h4>Call Us</h4>
                                    <p>coming soon</p>
                                </div>
                            </div>
                        </div>
                        <!-- Col 3 end -->

                    </div>
                    <!-- 1st row end -->

                    <div class="gap-60"></div>
                    <div class="gap-40"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="column-title">We love to hear</h3>
                           
                            <form id="contact-form" action="#" method="post" role="form">
                               
                                <uc1:sendquery runat="server" ID="sendquery" />
                            </form>
                            
                        </div>

                    </div>
                    <!-- Content row -->
                </div>
                <!-- Conatiner end -->
            </section>
            <!-- Main container end -->

            <uc1:Footer runat="server" ID="Footer" />
            <!-- Footer end -->


        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
