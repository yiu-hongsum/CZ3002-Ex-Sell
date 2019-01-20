<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineSupport.aspx.cs" Inherits="OnlineSupport.OnlineSupport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Live Support</title>
    <script src="Scripts/jquery-1.6.4.min.js"></script>
    <script src="Scripts/jquery.signalR-1.0.0-rc2.min.js"></script>
    <script type="text/javascript">        
        $(function () {
            var conn = $.connection();
            var img1 = "online.png";
            var img2 = "offline.png";
            $('#message').keypress(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                }
            });

            conn.received(function (data) {                                       
                $("#message_list").append(data + "<br/>");
                playSound();
                if (data == "Operator is offline now") {
                    setTimeout(function () {
                        window.location.reload(1);
                    }, 5000);
                    $("#Status_div").html("<a href=\"#\" style=\"text-decoration:none;width:100px;\" title=\"Go To Contact Page\"><img alt=\"offline\" src=\"offline.png\" style=\"border:none;\" /></a>");
                }
                else if (data == "Operator has joined") {                                        
                    location.reload(true);
                    $("#Status_div").html("<img style = \"width:100px;\" alt=\"online\" src=\"online.png\" />");
                    return false;
                }
                else{
                    $("#Status_div").html("<img style = \"width:100px;\" alt=\"online\" src=\"online.png\" />");
                }
            });         

            conn.start()
            .promise()
            .done(function () {                
                $("#Wait_div").css("visibility","hidden")
                $("#send").click(function () {                   
                    if ($("#message").val().length == 0)
                        return;
                    conn.send($("#message").val());
                    $('#message').val('').focus();
                })
            });
        });
    </script>  
     <script type="text/javascript">
         var snd = "sound.wav";
         function playSound() {
             document.getElementById("sound").innerHTML = "<embed src='sound.wav' hidden=true autostart=true loop=false>";
         }
    </script>
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
    </style>
</head>
<body style="margin:20px; font-family:'Segoe UI',sans-serif;">
    <form id="form1" runat="server" style="padding-left:25vw;">       
    <div id="chat" class="panel panel-default" style="width:50vw;">
        <div class="panel-heading">Chat Support</div>
        <div class="panel-body" style="object-fit:contain;">
        <div id="Wait_div" style="visibility:visible;">
            <span class="heading" >Please wait....</span>
        </div>
        <div id="Status_div">           
        </div>
        <div id="message_list" style="border:solid 1px silver; padding:5px; min-height:40vh; width:45vw;; max-height:40vh; overflow:auto;">            
        </div>
        <br />
        <div>
            <input id="message" name="message" type="text" style="width:32vw;; border:solid 1px silver; height:25px;" />&nbsp;&nbsp;
            <input id="send" name="send" value="Send" type="button"  class="btn btn-default"/>
             <asp:Button ID="bn_back" CssClass="btn btn-default" runat="server" Text="Back to Home" OnClick="bn_back_Click" />
        </div>
        <div style="display:none" id="sound"></div>

       
    </div>
    
        </div>
    </form>
</body>
</html>
