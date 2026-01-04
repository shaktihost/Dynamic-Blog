<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addblogpost.aspx.cs" Inherits="admin_addblogpost" %>

<%@ Register Src="~/admin/useadmincontrol/AdminHeader.ascx" TagPrefix="uc1" TagName="AdminHeader" %>
<%@ Register Src="~/admin/useadmincontrol/AdminFooter.ascx" TagPrefix="uc1" TagName="AdminFooter" %>
<%@ Register Src="~/admin/useadmincontrol/AdminMenuDesh.ascx" TagPrefix="uc1" TagName="AdminMenuDesh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container
        {
            -webkit-box-orient: vertical;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            overflow: hidden;
        }
    </style>


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

    <script>
        window.onload = function () {
            CKEDITOR.replace('txtblogdesc');
        };
    </script>
     
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
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

                        <div class="col-lg-8 mb-5 mb-lg-0 order-0 order-lg-1" style="height: auto;">
                            <h4 class="widget-title">New Blog Post</h4>

                            <div class="" style="width: 48%; float: left;">
                                <div class="error-container">
                                    <asp:Label ID="Catmess" runat="server" Text="" ForeColor="Green"></asp:Label>
                                </div>
                                <br />
                                <label>Blog Category</label>
                                <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <asp:DropDownList ID="CatDropList" OnSelectedIndexChanged="CatDropList_SelectedIndexChanged" Width="100%" AutoPostBack="true" class="form-control form-control-name" runat="server"></asp:DropDownList>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="CatDropList"></asp:RequiredFieldValidator>--%>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <label>Blog Sub Category</label>
                                            <asp:DropDownList ID="SubCatDropList" class="form-control form-control-name" runat="server"></asp:DropDownList>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="SubCatDropList"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <label>Blog Title (Meta)</label>
                                            <asp:TextBox ID="txtblogtitle" class="form-control form-control-name" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtblogtitle"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                               

                            </div>
                            <div class="" style="width: 48%; float: right;">
                                <div class="error-container"> </div>
                                <br />
                                 <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <label>Blog Keyword (Meta)</label>
                                            <asp:TextBox ID="txtblogUrl" class="form-control form-control-name" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtblogUrl"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <label>Blog Upload Image</label>
                                            <asp:FileUpload ID="fuImg01" class="form-control form-control-name" runat="server" />
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg01"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="width: 75%;">
                                        <div class="form-group">
                                            <label>Blog Short Description (Meta)</label>
                                            <asp:TextBox ID="txtMtSDes" class="form-control form-control-name" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMtSDes"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="height: auto; clear: both; margin-left: -15px;" >
                                <div class="form-group" style="clear: both;">
                                    <label>Blog Long Description</label>
                                    <asp:TextBox ID="txtblogdesc" class="form-control form-control-name" TextMode="MultiLine" runat="server"></asp:TextBox>

                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtblogdesc"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                                    <div class="row" style="width: 75%;">
                                        <div class="form-group">
                                            <label>Posted Date</label><br />
                                            <asp:Label ID="BlogPDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                                        </div>
                                    </div>
                                <div class="row">
                                    <asp:Button ID="BlogPost" class="btn btn-primary solid blank" runat="server" Text="Blog Post" OnClick="BlogPost_Click" />
                                </div>
                        </div>

                        <!-- Content Col end -->

                    </div>
                    <!-- Main row end -->

                </div>
                <!-- Container end -->
            </section>
            <!-- Main container end -->
            <asp:Label ID="lbldeletegrid" ForeColor="Green" runat="server" Text=""></asp:Label>
            <asp:Label ID="lbludategrid" runat="server" ForeColor="Green" Text=""></asp:Label><br />
            <asp:GridView ID="gvCategory" CellPadding="4" runat="server" AutoGenerateColumns="false" Width="100%"
                DataKeyNames="PID"
                PageSize="5" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowEditing="gvCategory_RowEditing"
                OnRowDeleting="gvCategory_RowDeleting"
                OnRowCancelingEdit="gvCategory_RowCancelingEdit"
                OnRowUpdating="gvCategory_RowUpdating"
                EmptyDataText="No records has been added.">
                <Columns>
                    <asp:TemplateField HeaderText="Blog id" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="50">
                        <ItemTemplate>
                            <asp:Label ID="lblCat" runat="server" Text='<%# Eval("PID") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblCat" runat="server" Text='<%# Eval("PName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCat" runat="server" Text='<%# Eval("PName") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Keyword" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblURL" runat="server" CssClass="container" Text='<%# Eval("PURL") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtURL" runat="server" Text='<%# Eval("PURL") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Long Description" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblDes" runat="server" CssClass="container" Text='<%# Eval("PDescription") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDes" runat="server" Text='<%# Eval("PDescription") %>' Width="500" Height="300" TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:CommandField ButtonType="Link" ShowEditButton="true" HeaderStyle-BackColor="#FFB600" HeaderStyle-ForeColor="White" ItemStyle-ForeColor="Blue" ShowDeleteButton="true"
                        ItemStyle-Width="70" />
                </Columns>
            </asp:GridView>


            <uc1:AdminFooter runat="server" ID="AdminFooter" />
        </div>
        <!-- Body inner end -->
    </form>
</body>
</html>
