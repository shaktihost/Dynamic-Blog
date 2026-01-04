<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="admin_addcategory" %>

<%@ Register Src="~/admin/useadmincontrol/AdminHeader.ascx" TagPrefix="uc1" TagName="AdminHeader" %>
<%@ Register Src="~/admin/useadmincontrol/AdminFooter.ascx" TagPrefix="uc1" TagName="AdminFooter" %>
<%@ Register Src="~/admin/useadmincontrol/AdminMenuDesh.ascx" TagPrefix="uc1" TagName="AdminMenuDesh" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        window.onload = function () {
            CKEDITOR.replace('myeditor');
        };
    </script>
    <%--<script type="text/javascript" src="ckeditor/ckeditor.js"></script>--%>
    <script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
    <!-- Favicon
================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png" />

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

                        <div class="col-lg-8 mb-5 mb-lg-0 order-0 order-lg-1" style="height:auto;">
                            <h4 class="widget-title">Create a New Admin</h4>
                            <br />
                            <div class="post">
                                <form id="contact-form" action="#" method="post" role="form">
                                    <div class="error-container"></div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">

                                                <label>Enter Name</label>

                                                <asp:TextBox ID="TxtAddname" class="form-control form-control-name" runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="TxtAddCat"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Enter Email</label>
                                                <asp:TextBox ID="TextEmail" class="form-control form-control-name" runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="TxtDesc"></asp:RequiredFieldValidator>--%>
                                                <%--<textarea name="myeditor" placeholder="Product Details" class="form-control" rows="12" cols="50"></textarea>--%>
                                            </div>


                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Enter Password</label>
                                                <asp:TextBox ID="Txtpass" class="form-control form-control-name" runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="TxtDesc"></asp:RequiredFieldValidator>--%>
                                                <%--<textarea name="myeditor" placeholder="Product Details" class="form-control" rows="12" cols="50"></textarea>--%>
                                            </div>


                                        </div>
                                    </div>
                                    <div>
                                        <asp:Label ID="adminPDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                                    </div><br />
                                    <div>
                                        <asp:Label ID="Catmess" runat="server" Text="" ForeColor="Green"></asp:Label>

                                        <asp:Button ID="SubmitCat" class="btn btn-primary solid blank" runat="server" Text="Submit" OnClick="SubmitCat_Click" />
                                    </div>
                                </form>
                                <!-- post-body end -->
                            </div>
                            <!-- 1st post end -->
                            <h4 class="widget-title">Change Password</h4><br />
                            <asp:Label ID="lbldeletegrid" ForeColor="Green" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lbludategrid" runat="server" ForeColor="Green" Text=""></asp:Label>
                            <asp:GridView ID="gvCategory" CellPadding="4" runat="server" AutoGenerateColumns="false" Width="100%" 
                                DataKeyNames="AdminId" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                PageSize="5" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating"
                                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                                <Columns>
                                     <asp:TemplateField HeaderText="Id" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("AdminId") %>'></asp:Label>
                                        </ItemTemplate>
                                     
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("Aminname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("Aminname") %>' Width="140"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("Email") %>' Width="140"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpass" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtpass" runat="server" Text='<%# Eval("Password") %>' Width="140"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-ForeColor="Blue" ShowDeleteButton="true"
                                        ItemStyle-Width="100" />
                                </Columns>
                            </asp:GridView>



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
