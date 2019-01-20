<%@ Page Title="Search Result" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SearchResult.aspx.cs" Inherits="Ex_Sell.WebPage.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
                                 <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                                    </asp:ScriptManagerProxy>      
    <style>
         p{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow:hidden;
        }
    </style>
    <section>
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <asp:Label ID="lb_category" runat="server" Font-Size="XX-Large"></asp:Label>
                    <div class="panel-group category-products" id="accordian">
                        <!--category-productsr-->
                        <div class="panel panel-default">
                            <div class="panel-heading1">
                                <h4 class="panel-title1">
                                    <asp:Label ID="l_sort" runat="server" Text="Sort By:"></asp:Label>
                                    <asp:DropDownList ID="ddl_sort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sort_SelectedIndexChanged">
                                        <asp:ListItem Text="Name" Value="ProductName"></asp:ListItem>
                                        <asp:ListItem Text="Date" Value="TimeStamp"></asp:ListItem>
                                        <asp:ListItem Text="Price" Value="Price"></asp:ListItem>
                                        <asp:ListItem Text="Quantity" Value="ProductQuantity"></asp:ListItem>
                                    </asp:DropDownList>

                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <h3>Search Result:</h3>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 150px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px;color:black; white-space: nowrap; text-overflow: hidden; overflow:hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                                <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>
        </div>
    </section>
</asp:Content>
