<%@ Control Language="C#" AutoEventWireup="true" CodeFile="recentpost.ascx.cs" Inherits="user_controls_recentpost" %>
<div class="widget recent-posts">
    <script type="text/javascript">
        atOptions = {
            'key': 'fad6b17d336314f3983d4e2f317ec103',
            'format': 'iframe',
            'height': 250,
            'width': 300,
            'params': {}
        };
    </script>
    <script type="text/javascript" src="//www.highperformanceformat.com/fad6b17d336314f3983d4e2f317ec103/invoke.js"></script><br /><br />
    <h3 class="widget-title">Recent Posts</h3>

    <ul class="list-unstyled">

        <asp:ListView ID="lvProducts" runat="server" GroupPlaceholderID="groupPlaceHolder1"
            ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">
            <%--<LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server">
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </ul>
            </LayoutTemplate>--%>
            <ItemTemplate>
                <li class="d-flex align-items-center">
                    <div class="posts-thumb">
                        <a href='<%# GetRouteUrl("RouteForArticle", new { PID = Eval("PID"), PName = GetTitle(Eval("PName")) }) %>'>
                            <img loading="lazy" alt="img"
                                src='<%# "../../Images/ProductImages/" + Eval("PID") + "/" + Eval("ImageName") + Eval("Extention") %>'
                                alt='<%# Eval("ImageName") %>' />
                        </a>
                    </div>
                    <div class="post-info">
                        <h4 class="entry-title">
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ArticleTitle"
                                NavigateUrl='<%# GetRouteUrl("RouteForArticle", new { PID = Eval("PID"), PName = GetTitle(Eval("PName")) }) %>'
                                Text='<%# Eval("PName") %>' />
                        </h4>
                    </div>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0">

                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                    <tr>
                        <td colspan="3">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvProducts" PageSize="2">
                                <%-- <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                        ShowPreviousPageButton="false" />
                                </Fields>--%>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
        </asp:ListView>

        <!-- 1st post end-->
    </ul>

</div>
