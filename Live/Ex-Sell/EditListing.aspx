<%@ Page Title="Edit Listing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditListing.aspx.cs" Inherits="Ex_Sell.WebPage.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    .auto-style2 {
        width: 148px;
    }
    </style>
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to delete product?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="container" style="margin: 0px auto;">
        <div class="row col-xs-5 col-xs-offset-2">
            <div id="editlisting" class="panel panel-info">
           <div class="panel-heading ">Edit Listing</div>
                <div class="panel-body">
                    <div style="height: 40vh; background-color: rgba(255,255,255,0.01);">
                        <span><asp:Image ID="Image1" runat="server" height="100%" Width="100%" style="object-fit:contain;"/></span>
                    </div>
                    <div class="form-group">
                        <label for="name">Name Of Product</label>&nbsp;
                        <asp:TextBox ID="tb_name" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <asp:TextBox ID="tb_price" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <asp:TextBox ID="tb_quantity" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="category">Category</label>
                        <asp:DropDownList ID="ddl_category" runat="server">
                            <asp:ListItem Enabled="true" Text="TextBooks/Resources" Value="TextBooks/Resources"></asp:ListItem>
                            <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>
                            <asp:ListItem Text="Foods & Services" Value="Foods & Services"></asp:ListItem>
                            <asp:ListItem Text="Household Appliances" Value="Household Appliances"></asp:ListItem>
                            <asp:ListItem Text="Kitchen Appliances" Value="Kitchen Appliances"></asp:ListItem>
                            <asp:ListItem Text="Stationery" Value="Stationery"></asp:ListItem>
                            <asp:ListItem Text="Board Games" Value="Board Games"></asp:ListItem>
                            <asp:ListItem Text="Women's Fashion" Value="Women's Fashion"></asp:ListItem>
                            <asp:ListItem Text="Men's Fashion" Value="Men's Fashion"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="description">Description Of Product</label>
                        <asp:TextBox ID="tb_description" class="form-control" runat="server" Rows="10" TextMode="MultiLine" Width="600px" MaxLength="900" />
                    </div>
                    <div class="form-group">
                        <label for="fileupload">Upload Image</label>
                        <asp:FileUpload ID="fu_img" runat="server" />
                    </div>
                     <asp:Button ID="bn_update" runat="server" class="btn btn-success" Text="Update Listing" OnClick="bn_update_Click" />
                     &nbsp;<asp:Button ID="bn_delete" runat="server" class="btn btn-danger" Text="Delete Listing" OnClientClick = "Confirm()" OnClick="bn_delete_Click" />
            
                    <br />
                    <br />
                    <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>