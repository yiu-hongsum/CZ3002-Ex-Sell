<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Ex_Sell.WebPage.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="container" style="padding-left:18vw;">
        <div class="row col-xs-6 col-xs-offset-1">
            <div id="signup" class="panel panel-info" style="width:100%">
                <div class="panel-heading ">Forgotten your password? Fret not, just key in your email and a reset password link will be send to your email shortly!</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="resetpassword_email">NTU Email</label>
                        <asp:TextBox ID="tb_email" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="bn_reset" runat="server" Text="Reset Password" class="btn btn-outline-secondary" OnClick="bn_reset_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label>
                </div>

            </div>
        </div>
    </div>
</asp:Content>