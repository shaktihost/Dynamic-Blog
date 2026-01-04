<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Allpostcontrols.ascx.cs" Inherits="user_controls_testlist" %>

<div class="widget recent-posts">
    <ul class="list-unstyled">
        <asp:ListView ID="lvCustomers" runat="server" GroupPlaceholderID="groupPlaceHolder1"
            ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">

            <ItemTemplate>
                <li class="d-flex align-items-center">
                    <div class="posts-thumb">
                        <a href="<%# GetRouteUrl("RouteForArticle", new {PID = Eval("PID"), PName= GetTitle(Eval("PName"))})%>">
                            <img loading="lazy" style="width: 200px; height: 150px;" alt="img" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("ImageName") %>"></a>
                    </div>
                    <div class="post-info">
                        <h4 class="entry-title">
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ArticleTitle" href='<%# GetRouteUrl("RouteForArticle", new {PID = Eval("PID"), PName= GetTitle(Eval("PName"))})%>'
                                Text='<%# Eval("PName") %>'>  
                            </asp:HyperLink>

                        </h4>
                        <div style="text-align: justify;">
                            <%--The max and min width/height 11properties gives you an extra layer of control in addition to the regular width and height properties. Please be aware that if both min-height, max-height and height are specified, min-height takes precedence over both, while max-height only takes precedence over height.--%>
                            <div class="proName" style="text-align: justify; display:-webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; max-height: 100px;"><%#Eval("PshortDesc") %></div>
                        </div>

                    </div>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0">

                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                    <tr>
                        <td colspan="3">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCustomers" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                        ShowPreviousPageButton="false" />
                                </Fields>
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


    </ul>
</div>

