<%@ Page Title="Ex-Sell" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ex_Sell.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="container" style="padding-left:18vw;">
        <div class="row col-xs-6 col-xs-offset-1">
            <div id="signup" class="panel panel-info" style="width:100%">
                <div class="panel-heading ">Welcome to Ex-sell, please take some time to sign up with us below:</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="signupName">Name</label>
                        <asp:TextBox ID="tb_name" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="signupemail">NTU Email</label><br />
                        <asp:TextBox ID="tb_regemail" class="form-control" runat="server" style="width:40%;display:inline-block;"></asp:TextBox> &nbsp
                        <asp:TextBox ID="tb_domain" class="form-control" runat="server" style="width:55%;display:inline-block;" Enabled="False">@e.ntu.edu.sg</asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="signuppassword">Password</label>
                        <asp:TextBox ID="tb_regpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="signupcpassword">Confirm Password</label>
                        <asp:TextBox ID="tb_regcpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="signupphoneno">Phone Number</label>
                        <asp:TextBox ID="tb_phone" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RadioButtonList ID="rbl_role" runat="server" RepeatDirection="Horizontal" Width="180px" OnSelectedIndexChanged="rbl_role_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True">Student</asp:ListItem>
                        <asp:ListItem>Staff</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <asp:Button ID="bn_signup" runat="server" Text="Register" style="color: #31708f;background-color: #d9edf7;" CssClass="btn btn-outline-secondary" OnClick="bn_signup_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lb_msg2" runat="server" Text="" Font-Size="Larger" ForeColor="Red" Font-Bold="True"></asp:Label>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
