<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorLogin.aspx.cs" Inherits="OnlineSupport.OperatorLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Operator Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .heading
        {
             font-family:'Segoe UI',sans-serif; font-size:25px;
        }
        .btn
        {
            height:30px; background-color:#efefef; border:solid 1px silver;
        }
        .panel{
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .panel-default{
            border-color: #ddd;
        }
        .panel-default>.panel-heading{
            color: #333;
            background-color: #f5f5f5;
            border-color: #ddd;
        }
        .panel-heading{
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }
        .panel-body {
            padding: 15px;
        }
    .navbar > .container, .navbar > .container-fluid {
        display: inline-block !important;
    }

    .navbar {
        background-color: #333!important;
    }

    .navbar-nav {
        flex-direction: row !important;
    }

    .nav li {
        display: inline-block !important;

    }
    
    .nav li a {
        color:white!important;
    }
    .nav>li>a:hover {
        text-decoration: none!important;
        background-color: #474747 !important;
    }
    .logo {
        width: 70px!important;
        max-height: 55px!important;
        margin-top: -17px!important;
        padding-left: 2px!important;
    }

    .search-box {
        border-radius: 15px!important;
        border-width: 0px!important;
        padding-left: 14px!important;
    }

        .search-box:focus {
            outline-style: none!important;
        }
    
    /*.login-header {
        background-color: red;
        color: white;
    }*/

    input[type=text] {
        color: #757575!important;
    }
    .search-button{
        height:15px!important;
        width:15px!important;
        position:relative!important;
        top: 3px!important;
    }

    button {
        background-color: antiquewhite;
        background-repeat: no-repeat;
        font-size: 20px;
        border: thin;
        cursor: pointer;
        overflow: hidden;
        border: 1px solid white;
        margin-top: 12px;
    }
    .modal-content{
        box-shadow: none!important;
        -webkit-box-shadow: none!important;
        border:none!important;
        background-color: rgba(0,0,0,0)!important;
    }
    .panel-heading1{
            background-color:white!important;
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }
        .panel-title1{
            color:black!important;
            margin-top: 0;
            margin-bottom: 0;
            font-size: 16px;
        }
        .panel-default>.panel-heading1 {
            color: #333;
            background-color: #f5f5f5;
            border-color: #ddd;
        }
        p{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container" style="padding-left:20vw;margin-top:20vh;">
        <div class="row col-xs-5 col-xs-offset-1">
            <div id="signup" class="panel panel-primary" style="width:25vw">
                <div class="panel-heading ">Login For Operator</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <asp:TextBox ID="tb_user" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="tb_password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="Login_btn" runat="server" Text="Operator Login" class="btn btn-outline-secondary btn-primary" OnClick="Login_btn_Click"/>
                    <br />
                    <br />
                    <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label>
                </div>

            </div>
        </div>
    </div>
    </form>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

