<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TestRecent.ascx.cs" Inherits="user_controls_TestRecent" %>

<h3 class="widget-title">Recent Posts</h3>

<ul class="list-unstyled">


    <asp:ListView ID="lvCustomers" runat="server" GroupPlaceholderID="groupPlaceHolder1"
        ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">

        <ItemTemplate>
            <li class="d-flex align-items-center">
                <div class="posts-thumb">
                    <a href="postview.aspx?PID=<%#Eval("PID") %>">
                        <img loading="lazy" style="width: 200px; height: 150px;" alt="img" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("ImageName") %>"></a>
                </div>
                <div class="post-info">
                    <h4 class="entry-title">
                        <a href="postview.aspx?PID=<%#Eval("PID") %>">
                            <div class="proName" style="font-weight: bold;"><%#Eval("PName") %></div>
                        </a>
                    </h4>

                    <div style="text-align: justify;">
                        The max and min width/height properties gives you an extra layer of control in addition to the regular width and height properties. Please be aware that if both min-height, max-height and height are specified, min-height takes precedence over both, while max-height only takes precedence over height.
                    </div>
                    <%--<div class="proName" style="text-align:justify; max-height:100px;"><%#Eval("PDescription") %></div>--%>
                </div>
            </li>
        </ItemTemplate>
        <LayoutTemplate>
           
            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCustomers" PageSize="2">
               <%-- <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                        ShowPreviousPageButton="false" />
                </Fields>--%>
            </asp:DataPager>
        </LayoutTemplate>
        <GroupTemplate>
            <tr>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
            </tr>
        </GroupTemplate>

    </asp:ListView>



</ul>


