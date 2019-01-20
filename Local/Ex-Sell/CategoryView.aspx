<%@ Page Title="Category View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryView.aspx.cs" Inherits="Ex_Sell.CategoryView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <style>
         p{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow:hidden;
        }
    </style>
    <section>
        <div class="row" style="background-color:white;border-radius:10px;padding: 10px 0px;">
            <div class="col-sm-12">
                <h3>Category: <asp:Label ID="lb_category" runat="server" Text=""></asp:Label></h3>
                  <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 150px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black; white-space: nowrap; text-overflow: hidden; overflow:hidden;" class=" col-xs-2 recommended">
                            <div style="height: 75%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 25%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
</asp:Content>
