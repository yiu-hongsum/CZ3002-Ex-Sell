<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Conversation.aspx.cs" Inherits="Ex_Sell.Conversation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="col">
        <div class="row">
            <div style="padding: 0; height: 480px; background-color: rgba(0,0,255,0.1);" class="col-xs-5 ">
                <div><span>Insert Product Picture</span></div>
                <div style="position: absolute; bottom: 0; height: 100px; width:100%; background-color: rgba(0,0,255,0.1);">
                    <h4>Product Name</h4>
                    <p>
                        <label>Listed Price:</label><span> $20</span>
                    </p>
                </div>
            </div>
            <div style="height: 480px;" class="col-xs-5 col-xs-offset-1">
                <div id="message-box" class="panel panel-default">
                    <div id="party-name" class="panel-heading ">Tom</div>
                    <div style="height: 435px" class="panel-body">
                        wew
                        <div style="position: absolute; bottom: 5px;" class="form-group row">
                            <div class="col-xs-10">
                                <input class="form-control" placeholder="Enter your message">
                            </div>
                            <div class="col-xs-2">
                                <button type="submit" class="btn secondary">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
