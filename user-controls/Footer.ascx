<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="user_controls_Footer" %>


<footer id="footer" class="footer bg-overlay">
    <div class="footer-main">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-4 col-md-6 footer-widget footer-about">
                    <h3 class="widget-title">About Us</h3>
                    <%--<img loading="lazy" width="200px" class="footer-logo" src="images/design.png" alt="Constra">--%>
                    <p>
                     



                    </p>
                    <div class="footer-social">
                        <ul>
                            <li><a href="#" aria-label="Facebook"><i
                                class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li><a href="#" aria-label="Instagram"><i
                                class="fab fa-instagram"></i></a></li>
                            
                        </ul>
                    </div>
                    <!-- Footer social end -->
                </div>
                <!-- Col end -->

                <div class="col-lg-4 col-md-6 footer-widget mt-5 mt-md-0">
                    
                </div>
                <!-- Col end -->

                <div class="col-lg-3 col-md-6 mt-5 mt-lg-0 footer-widget">
                    <h3 class="widget-title">Most Popular Link</h3>
                    <ul class="list-arrow">
                       <li><a href="/privacy-policy">Privacy Policy</a></li>
                       <li><a href="/terms-and-conditions">Terms and conditions</a></li>
                        <%--  <li><a href="#"></a></li>--%>

                    </ul>
                </div>
                <!-- Col end -->
            </div>
            <!-- Row end -->
        </div>
        <!-- Container end -->
    </div>
    <!-- Footer main end -->

    <div class="copyright">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="copyright-info">
                        <span>Copyright &copy;
                                        <script>
                                            document.write(new Date().getFullYear())
                                        </script>
                            , Designed &amp; Developed by <a href="https://Aaakhabar.com">Shakti</a></span>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="footer-menu text-center text-md-right">
                        <ul class="list-unstyled">
                            <li><a href="/about">About</a></li>
                            <li><a href="/contact">Contact</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <!-- Row end -->

            <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
                <button class="btn btn-primary" title="Back to Top">
                    <i class="fa fa-angle-double-up"></i>
                </button>
            </div>

        </div>
        <!-- Container end -->
    </div>
    <!-- Copyright end -->
</footer>
