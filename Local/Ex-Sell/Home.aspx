<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Ex_Sell.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <style>
        .carousel-inner>.item>img, .carousel-inner>.item>a>img {
        display: block;
        height: auto;
        max-width: 100%;
        line-height: 1;
        margin:auto;
        width: 100%; // Add this
        }
        .panel-heading{
            background-color:white!important;
        }
        .panel-title{
            color:black!important;
        }
         p{
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow:hidden;
        }
    </style>
    <!--slider-->
    <div class="row">
        <div class="col-sm-12">
            <div id="slider-carousel" style="height: 300px; background-color: gainsboro;" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#slider-carousel" data-slide-to="1"></li>
                    <li data-target="#slider-carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="col-sm-6">
                            <asp:Image ID="banner_1" runat="server" ImageUrl="~/Images/always got time for some music..png" style="width:100vw;height:300px;margin-left:-15px;" />
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                    <div class="item">
                        <asp:Image ID="banner_2" runat="server" ImageUrl="~/Images/Product/exam.jpg" style=" height:300px;width: 100vw;padding:0px -15px;"/>
                        <div class="col-sm-6" style="background-color:rgba(255,255,255,0.5);z-index:2;position:absolute;left:0px;top:0px; padding:10px 5px;">
                            <h1 style="background-color:rgba(0,0,0,0)">TRENDING: Past Year Paper Sale</h1>
                            <h2 style="background-color:rgba(0,0,0,0)">Available for every course code</h2>
                           <asp:Button ID="bn_preorder" runat="server" Text="Preorder Now" class="btn btn-default get" OnClick="bn_preorder_Click"/>
                        </div>
                    </div>
                     
                    <div class="item">
                        <asp:Image ID="banner_3" runat="server" ImageUrl="~/Images/stationerybanner.jpg" style=" height:300px;width: 100vw;padding:0px -15px;"/>
                        <div class="col-sm-6" style="background-color:rgba(255,255,255,0.5);z-index:2;position:absolute;left:0px;top:0px; padding:10px 5px;">
                            <h1 style="background-color:rgba(0,0,0,0)">TRENDING: Past Year Paper Sale</h1>
                            <h2 style="background-color:rgba(0,0,0,0)">Available for every course code</h2>
                           <asp:Button ID="bn_getstationery" runat="server" Text="Get Stationery Now" class="btn btn-default get" OnClick="bn_getstationery_Click"/>
                        </div>
                    </div>

                </div>

                <%-- <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>--%>
            </div>
        </div>
    </div>
    <!--/slider-->
    <section>
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Categories</h2>

                    <div class="panel-group category-products" id="accordian">
                        <!--category-productsr-->

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#textbooks">
                                        <span class="badge pull-right"></span>
                                        Textbooks / Resources
                                    </a>
                                </h4>
                            </div>
                            <div id="textbooks" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><asp:LinkButton ID="bn_Engineering" runat="server" OnClick="bn_engineering_Click">Engineering</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Science" runat="server" OnClick="bn_Science_Click">Science</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Business" runat="server" OnClick="bn_Business_Click">Business</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Humanities" runat="server" OnClick="bn_Humanities_Click">Humanities</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Computing" runat="server" OnClick="bn_Computing_Click">Computing</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Social" runat="server" OnClick="bn_Social_Click">Social Sciences</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Accountancy" runat="server" OnClick="bn_Accountancy_Click">Accountancy</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Maths" runat="server" OnClick="bn_Maths_Click">Maths</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_Arts" runat="server" OnClick="bn_Arts_Click">Arts and Design</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#electronics">
                                        <span class="badge pull-right"></span>
                                        Electronics
                                    </a>
                                </h4>
                            </div>
                            <div id="electronics" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><asp:LinkButton ID="bn_computer" runat="server" OnClick="bn_computer_Click">Computers</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_tv" runat="server" OnClick="bn_tv_Click">TVs and Entertainment Systems</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_audio" runat="server" OnClick="bn_audio_Click">Audio</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_part" runat="server" OnClick="bn_part_Click">Computer Parts and Accessories</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                            <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#stationery">
                                        <span class="badge pull-right"></span>
                                        Stationery
                                    </a>
                                </h4>
                            </div>
                            <div id="stationery" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><asp:LinkButton ID="bn_case" runat="server" OnClick="bn_case_Click">Pencil Cases</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_notebook" runat="server" OnClick="bn_notebook_Click">Notebooks</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_paper" runat="server" OnClick="bn_paper_Click">Paper</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_pen" runat="server" OnClick="bn_pen_Click">Pens / Pencils</asp:LinkButton></li>                                   
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#hall">
                                        <span class="badge pull-right"></span>
                                        Services and Foods
                                    </a>
                                </h4>
                            </div>
                            <div id="hall" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                         <li><asp:LinkButton ID="bn_baked" runat="server" OnClick="bn_baked_Click">Baked Goods</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_instant" runat="server" OnClick="bn_instant_Click">Instant Food</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_packaged" runat="server" OnClick="bn_packaged_Click">Packaged Goods</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="bn_drinks" runat="server" OnClick="bn_drinks_Click">Beverages</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <div class="col-sm-9">
                <h3>Textbook / Resources <span style="font-size: 12px"><asp:LinkButton ID="bn_viewbook" runat="server" OnClick="bn_viewbook_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black; white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="hardcode_books" runat ="server">

                </div>
                <br/>
                <h3>Electronics <span style="font-size: 12px"><asp:LinkButton ID="bn_electronic" runat="server" OnClick="bn_electronic_Click">View More >>></asp:LinkButton></span></h3>
                
                <asp:ListView ID="ListView2" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px;background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black;white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;" />
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" runat="server" Class='<%# Eval("productid") %>'><%# Eval("productname") %></p>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                
                <div id="hardcode_electronics" runat ="server">

                </div>
                <br/>
                <h3>Stationery <span style="font-size: 12px"><asp:LinkButton ID="bn_stationery" runat="server" OnClick="bn_stationery_Click">View More >>></asp:LinkButton></span></h3>
                
                <asp:ListView ID="ListView3" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black;white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;" />
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" runat="server" Class='<%# Eval("productid") %>'><%# Eval("productname") %></p>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                
                <div id="hardcode_stationery" runat ="server">

                </div>
                <br/>
                 <h3>Services & Foods <span style="font-size: 12px"><asp:LinkButton ID="bn_service" runat="server" OnClick="bn_service_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView4" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black;white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div1" runat ="server">

                </div>
                <br/>
                 <h3>Household Appliance <span style="font-size: 12px"><asp:LinkButton ID="bn_household" runat="server" OnClick="bn_household_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView5" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black;white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div2" runat ="server">

                </div>
                <br/>
                <h3>Kitchen Appliances <span style="font-size: 12px"><asp:LinkButton ID="bn_kitchen" runat="server" OnClick="bn_kitchen_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView6" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black;white-space: nowrap; text-overflow: hidden; overflow: hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div3" runat ="server">

                </div>
                <br/>

                <h3>Board Games <span style="font-size: 12px"><asp:LinkButton ID="bn_games" runat="server" OnClick="bn_games_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView7" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius:  5px; color:black; white-space: nowrap; text-overflow: hidden; overflow:hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div4" runat ="server">

                </div>
                <br/>

                <h3>Women's Fashion <span style="font-size: 12px"><asp:LinkButton ID="bn_women" runat="server" OnClick="bn_women_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView8" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black; white-space: nowrap; text-overflow: hidden; overflow:hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div5" runat ="server">

                </div>
                <br/>

                <h3>Men's Fashion <span style="font-size: 12px"><asp:LinkButton ID="bn_men" runat="server" OnClick="bn_men_Click">View More >>></asp:LinkButton></span></h3>
                <asp:ListView ID="ListView9" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" id="item1" onclick="item_click" CssClass='<%# Eval("productid") %>'>
                            <div style="margin: 1%; padding: 0; height: 200px; border-radius: 10px; background-color: rgba(255, 255, 255, 1);box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;border-radius: 5px; color:black; white-space: nowrap; text-overflow: hidden; overflow:hidden;" class=" col-xs-2 recommended">
                            <div style="height: 20%; border-radius: 10px; background-color: rgba(255, 255, 255, 1);" class=""></div>
                            <div style="height: 60%; background-color: rgba(255, 255, 255, 1);" class="recommended-image">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageid", "~/Images/Product/{0}") %>' Height="100%" Width="100%" style="object-fit:contain;"/>
                            </div>
                            <p ID="ProductName" style="height: 20%;padding:5px 5px;" Class='<%# Eval("productid") %>' runat="server"><%# Eval("productname") %></p>
                             
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>
                <div id="Div6" runat ="server">

                </div>
                <br/>
                 
        </div>

        </div>
    </section>



</asp:Content>
