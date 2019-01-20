<%@ Page Title="Product View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="Ex_Sell.ProductView" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <style>
         #recommended-products p{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow:hidden;
        }
    </style>
    <div class="col">
        <div class="row" style="background-color:white;border-radius: 10px;padding-bottom: 2vh;">
            <div style="height: 63vh; background-color: rgba(255,255,255,0.01);" class="col-xs-5 ">
                <span><asp:Image ID="Image1" runat="server" height="100%" Width="100%" style="object-fit:contain;padding:2vh 0px;"/></span>
            </div>
            <div class="col-xs-5 col-xs-offset-1">
                <div id="product-info" style="margin-top:10vh;">
                        <asp:Label ID="lb_Name" runat="server" Font-Size="XX-Large"></asp:Label>
                    <span>
                        <p>
                            <label>Listed Price:</label><span>
                            <asp:Label ID="lb_price" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <p>
                            <label>Quantity:</label><span>
                            <asp:Label ID="lb_quantity" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <p>
                            <label>Description:</label><span>
                            <asp:Label ID="lb_description" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <p>
                            <label>Category:</label><span>
                            <asp:Label ID="lb_category" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <p>
                            <label>Seller:</label><span>
                            <asp:Label ID="lb_username" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <p>
                            <label>Contact Seller:</label><span>
                            <asp:Label ID="lb_contact" runat="server" Text=""></asp:Label>
                            </span>
                        </p>
                        <asp:Button ID="bn_interest" runat="server" class="btn btn-success" Text="I'm Interested!" OnClick="bn_interest_Click" />
                        <asp:Button ID="bn_uninterest" runat="server" class="btn btn-warning" Text="Uninterest Product" OnClick="bn_uninterest_Click" />
                        <asp:Button ID="bn_edit" runat="server" class="btn btn-info" Text="Edit Product" OnClick="bn_edit_Click" />
                        <asp:Button ID="bn_enquire" runat="server" class="btn btn-danger" Text="Enquire about Product" />
                    </span>
                </div>
            </div>
        </div>
        <br />
        <hr />

        <div class="row" style="background-color:white;border-radius: 10px;padding:10px 10px;">

            <h3 style="margin-left:10px;">Similar Products</h3>
            <div id="recommended-products">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 150px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px;color:black; white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
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
    </div>
</asp:Content>
