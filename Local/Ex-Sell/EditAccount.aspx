<%@ Page Title="Edit Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="Ex_Sell.WebPage.EditAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="container" style="margin: 0px auto; padding-left:18vw;">
        <div class="row col-xs-6 col-xs-offset-1">
            <div id="editaccount" class="panel panel-info" style="width:100%">
           <div class="panel-heading ">Edit Your Profile</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="email">Email</label>&nbsp;
                        <asp:TextBox ID="tb_email" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <asp:TextBox ID="tb_name" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="tb_password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="cpassword">Confirm Password</label>
                        <asp:TextBox ID="tb_cpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="phoneno">Phone Number</label>
                        <asp:TextBox ID="tb_phone" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                    </div>
                    <asp:Button ID="bn_update" runat="server" Text="Update" class="btn btn-outline-secondary" OnClick="bn_update_Click" />
                    &nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Back To Home" OnClick="bn_back_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
    </asp:Content>
