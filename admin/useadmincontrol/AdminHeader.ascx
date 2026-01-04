<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="admin_useadmincontrol_AdminHeader" %>

<!-- Header start -->
<header id="header" class="header-one">
    <div class="bg-white">
        <div class="container">
            <div class="logo-area">
                <div class="row align-items-center">
                    <div class="logo col-lg-3 text-center text-lg-left mb-3 mb-md-5 mb-lg-0">
                        <a class="d-block" href="/admin/dashboard">
                            <h2>Administrator</h2>
                        </a>

                    </div>
                    <!-- logo end -->
                    <div class="col-lg-9 header-right" style="text-align: right;">
                        Welcome
                        <asp:LoginName ID="LoginName" runat="server" Font-Bold="true" />

                        <asp:LoginStatus ID="LoginStatus" runat="server" ForeColor="Blue" />
                    </div>

                </div>
                <!-- logo area end -->

            </div>
            <!-- Row end -->
        </div>
        <!-- Container end -->
    </div>


</header>
<!--/ Header end -->
