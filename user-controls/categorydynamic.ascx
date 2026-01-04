<%@ Control Language="C#" AutoEventWireup="true" CodeFile="categorydynamic.ascx.cs" Inherits="user_controls_categorydynamic" %>
<div class="widget">
    <h3><a class="widget-title" href="/post">Blog Categories</a></h3>
    <div class="accordion accordion-group" id="our-values-accordion">
        <div class="card">
            <div class="card-header p-0 bg-transparent" id="headingOne">
                <h2 class="mb-0">
                    <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <asp:Repeater ID="rptCategory" runat="server" OnItemDataBound="OnItemDataBound">
                            <ItemTemplate>
                                <a class="" href="../../post.aspx?cat=<%# Eval("CatID") %>"><%# Eval("CatName") %></a>
                                <asp:HiddenField ID="hfCatId" runat="server" Value='<%# Eval("CatID") %>' />


                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#our-values-accordion">
                                    <div class="card-body">
                                        <asp:Repeater ID="rptSubCategories" runat="server">
                                            <ItemTemplate>
                                                <a class="dropdown-item" href="../../post.aspx?subcat=<%# Eval("SubCatID") %>"><%# Eval("SubCatName") %></a>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="dropdown-divider"></div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </button>
                </h2>
            </div>


        </div>

    </div>
</div>
