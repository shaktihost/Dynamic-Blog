<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="_Default" %>

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
    <link rel="icon" type="image/png" href="images/favicon.png"/>

    <!-- CSS
================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.min.css"/>
    <!-- Animation -->
    <link rel="stylesheet" href="plugins/animate-css/animate.css"/>
    <!-- slick Carousel -->
    <link rel="stylesheet" href="plugins/slick/slick.css"/>
    <link rel="stylesheet" href="plugins/slick/slick-theme.css"/>
    <!-- Colorbox -->
    <link rel="stylesheet" href="plugins/colorbox/colorbox.css"/>
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
                                    <h1 class="banner-title">about</h1>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb justify-content-center">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item"><a href="/about">about</a></li>
                                            
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
                    <div class="row">

                        <div class="col-lg-8 mb-5 mb-lg-0"> 
                            <!-- Content Col end -->
                            <h6>DEMO Financial Service</h6>
                            <p>DEMO Financial Service एक समर्पित और विश्वसनीय वित्तीय सेवा प्रदाता है, जिसकी स्थापना इस उद्देश्य से की गई है कि आम नागरिकों को वित्तीय रूप से जागरूक, समर्थ और सशक्त बनाया जा सके। हम मानते हैं कि हर व्यक्ति को सही वित्तीय मार्गदर्शन और साधनों तक पहुंच मिलनी चाहिए, ताकि वह अपने जीवन के लक्ष्यों को सरलता से प्राप्त कर सके।</p>
                            <h6>हमारी सेवाएं:</h6>
                            <p>हम विभिन्न प्रकार की वित्तीय सेवाएं प्रदान करते हैं जो आपकी व्यक्तिगत और व्यावसायिक आवश्यकताओं के अनुसार तैयार की जाती हैं:</p>
                           
                            ✅ व्यक्तिगत ऋण (Personal Loan)<br />
                            ✅ गृह ऋण (Home Loan)<br />
                            ✅ व्यापार ऋण (Business Loan)<br />
                            ✅ बीमा सेवाएं (Insurance – जीवन, स्वास्थ्य, वाहन)<br />
                            ✅ निवेश सलाह (Mutual Funds, SIP, Fixed Deposits आदि)<br />
                            ✅ क्रेडिट स्कोर सुधार एवं सलाह<br />
                            ✅ टैक्स योजना (Tax Planning)<br />
                            ✅ वित्तीय शिक्षा और मार्गदर्शन (Financial Literacy & Awareness)<br /><br />

                            <h6>हमारी विशेषताएँ:</h6>

                            ✅ पारदर्शिता: हम हर सेवा में पूरी स्पष्टता और पारदर्शिता बनाए रखते हैं।<br />
                            ✅ सरल प्रक्रिया: हमारी सेवाओं का लाभ उठाना आसान और झंझट-मुक्त है।<br />
                            ✅ विशेषज्ञ मार्गदर्शन: अनुभवी वित्तीय सलाहकारों की टीम हर कदम पर आपका मार्गदर्शन करती है।<br />
                            ✅ ग्राहक-संतुष्टि: हमारी पहली प्राथमिकता हमेशा हमारे ग्राहकों की संतुष्टि और भरोसा होती है।<br /><br />

                            <h6>हमारा उद्देश्य:</h6>

                            <p>हमारा लक्ष्य है कि भारत के हर नागरिक को वित्तीय रूप से सक्षम बनाया जाए। हम चाहते हैं कि आम आदमी भी बैंकिंग, निवेश, बीमा और टैक्स जैसी सेवाओं को समझे, अपनाए और अपने सपनों को साकार करे।</p>
                            
                            <h6>हम क्यों अलग हैं?</h6>
                            
                            <p>DEMO Financial Service केवल एक सेवा नहीं, बल्कि एक मिशन है – लोगों को सही जानकारी, सही समय पर, सही माध्यम से प्रदान करना। हम तकनीक और व्यक्तिगत सेवा का ऐसा मेल प्रस्तुत करते हैं जो आज के तेज़ी से बदलते आर्थिक परिवेश में आपकी सबसे बड़ी जरूरत बन जाए।</p>
                            
                            <h6>संपर्क करें:</h6>
                            <p>यदि आप भी अपने वित्तीय भविष्य को मजबूत बनाना चाहते हैं, तो आज ही हमसे जुड़ें। हम हर कदम पर आपके साथ हैं – सलाह से समाधान तक।</p>
                            
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

            <!-- Template custom -->
            <script src="js/script.js"></script>
        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
