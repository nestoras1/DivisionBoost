<%@ Page Language="C#" AutoEventWireup="true" CodeFile="placement.aspx.cs" Inherits="boosting_placement" %>

<!DOCTYPE html>

<html lang="en" class="no-js">
   
    <head>
        <title> Placement Wins - DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
        <meta property="og:site_name" content="DivisionBoost.eu">
      <meta property="og:description" content="Placement Wins - Elo Boosting - League of Legends" />
      <meta property="og:url" content="https://divisionboost.eu/" />
      <meta property="og:title" content="Placement Wins - DivisionBoost" />
      <meta property="og:image" content="https://divisionboost.eu/img/fb_img_share.jpg" />
      <meta property="fb:app_id" content="1504158542989599" />
      <meta name="google-site-verification" content="4Pf_YnTUTtEop0W9tP5nahaEi_Upf0CFLimuu5aQw3o" />
      <link rel="icon" type="image/x-icon" href="https://divisionboost.eu/img/DBLogo.ico"/>
        <meta name="norton-safeweb-site-verification" content="5z5ahv9wknr1st178ukw0h2gd7sdv0-xs0pkqp3algylbe-nkp6ty20fr1zx2s0uzewif8mbrk3q2s2edpp7gj3oi-f09r1vmen66xysfosnjqzar2bjcxc7v8pl989t" />
        <link href="../vendor/fonts-googleapis.css" rel="stylesheet" type="text/css"/>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="../vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/animate.css" rel="stylesheet">
        <link href="../vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/layout.min.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/x-icon" href="favicon.ico"/>  

        <script>
        	//-------google analytics--------------
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window, document, 'script','../vendor/analytics.js','ga');

          ga('create', 'UA-76719054-2', 'auto');
          ga('send', 'pageview');
	        //-------google analytics--------------
            
	        //Start of Zendesk Chat Script
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
        d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
        $.src="https://goo.gl/rmUKm2";z.t=+new Date;$.
        type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
	        //End of Zendesk Chat Script
        </script>

        <script type="text/javascript">
		<!--//--><![CDATA[//><!--
			var images = new Array()
			function preload() {
				for (i = 0; i < preload.arguments.length; i++) {
					images[i] = new Image()
					images[i].src = preload.arguments[i]
				}
			}
			preload(
				"../img/divisions/bronze-sima-black-white.png",
				"../img/divisions/bronze-sima.png",
				"../img/divisions/silver-sima.png",
				"../img/divisions/gold-sima.png",
				"../img/divisions/platinum-sima.png",
				"../img/divisions/diamond-sima.png",
				"../img/divisions/master-sima.png"
			)
		//--><!]]>
	</script>

    </head>
   
    <body id="body" data-spy="scroll" data-target=".header">
        <form runat="server">
          <header class="header navbar-fixed-top">
              <nav class="navbar" role="navigation">
                <div class="container">
                      <div class="menu-container js_nav-item">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="toggle-icon"></span>
                        </button>
                          <div class="logo">
                            <a class="logo-wrap" href="#body">
                                <img class="logo-img logo-img-main" src="../img/logo.png" alt="Eloboost Logo">
                                <img class="logo-img logo-img-active" src="../img/logo-dark.png" alt="Elo Boost Logo">
                            </a>
                        </div>
                    </div>

                    <div class="collapse navbar-collapse nav-collapse">
					
                        <div class="menu-container">
                            <ul class="nav navbar-nav navbar-nav-right">
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../index.aspx">Home</a></li>
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../demo.aspx">Demo</a></li>
								<li class="js_nav-item nav-item active"><a class="nav-item-child nav-item-hover" href="../index.aspx#boosting">Boosting</a></li>
                                <%--<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#products">Coaching</a></li>--%>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../faq.aspx">FAQ</a></li>

                                <% if (Session["user"] == null) { %>
	                              <% } else { %>
	                              <% if (Session["account_type"].ToString() == "False") { %>
			                           <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../customer/index.aspx">Dashboard</a></li>
			                            <% } else { %>
			                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../booster/index.aspx">Dashboard</a></li>
			                            <%} %>

			                            <%} %>
	                              <% if (Session["user"] == null) { %>
			                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../login/login.aspx">Login / Sign Up</a></li>
			                            <% } else { %>
			                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../Logout.aspx">Logout</a></li>
		                            <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
			</header>
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
	<fieldset class="boosting-bg-effect">





        <!--========== PAGE LAYOUT ==========-->
        <!-- About -->
        <div id="carousel-example-generic1" class="viphoto">
            <div class="content-lg container">
                <!-- Masonry Grid -->
                <div class="masonry-grid row margin-t-40">
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 col-md-offset-0" data-scroll-reveal="enter left over 1s and move 300px after 0.5s">
                        <div class=" offset-0" data-scrollreveal="enter left">
                        <div class=" m20 " style="text-align: center;">
                        <h3 style="color:#b5b6ba;">Previous League</h3>
                            <asp:Image ID="Image2" runat="server" ImageUrl="../img/divisions/bronze-sima-black-white.png" AlternateText="elo boost"/>        
					        <asp:DropDownList ID="DropDownList1" CssClass="" runat="server" class="dropdownstylecss col-xs-offset-1 margin-b-10 center-block" OnSelectedIndexChanged="imageallagi1" AutoPostBack="True" Width="160px" AppendDataBoundItems="False" ToolTip="Select your League">
						        <asp:ListItem Selected="True" Value="0">Unranked</asp:ListItem>
						        <asp:ListItem Value="00">Normal</asp:ListItem>
						        <asp:ListItem Value="1">Bronze</asp:ListItem>
						        <asp:ListItem Value="2">Silver</asp:ListItem>
						        <asp:ListItem Value="3">Gold</asp:ListItem>
						        <asp:ListItem Value="4">Platinum</asp:ListItem>
						        <asp:ListItem Value="5">Diamond</asp:ListItem>
					        </asp:DropDownList>
                        </div>
                        </div>
                        </div>




                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 col-md-offset-0" data-scroll-reveal="enter left over 1s and move 300px after 0.5s">
                            <div class=" offset-0" data-scrollreveal="enter left">
                                <div class="m20 here" style="text-align: center;">
                                    <div class="col"> 
                                        <h3 style="color:#b5b6ba;">Select Games</h3>
                                        <asp:Label ID="placementlb" runat="server" Text="1" ForeColor="White" Font-Bold="True" Font-Size="114px"></asp:Label><br />
						                <asp:Label ID="placementlb2" runat="server" Text="Placement Games" ForeColor="White" Font-Bold="True" Font-Size="22px"></asp:Label>
						                <asp:DropDownList ID="DropDownList2" runat="server" class="dropdownstylecss col-xs-offset-1 margin-b-10 center-block" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="imageallagi1" ToolTip="Select Number of Placement Games">
							                <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
							                <asp:ListItem Value="2">2</asp:ListItem>
							                <asp:ListItem Value="3">3</asp:ListItem>
							                <asp:ListItem Value="4">4</asp:ListItem>
							                <asp:ListItem Value="5">5</asp:ListItem>
							                <asp:ListItem Value="6">6</asp:ListItem>
							                <asp:ListItem Value="7">7</asp:ListItem>
							                <asp:ListItem Value="8">8</asp:ListItem>
							                <asp:ListItem Value="9">9</asp:ListItem>
							                <asp:ListItem Value="10">10</asp:ListItem>
						                </asp:DropDownList>
					                </div>
                                    </div>
                                </div>
                            </div>
                        


                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 col-md-offset-0" data-scroll-reveal="enter left over 1s and move 300px after 0.5s">
                        <div class=" offset-0" data-scrollreveal="enter left">
                            <div class=" margin-t-40 " style="text-align: center;">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" ForeColor="White">
							        <asp:ListItem Text="Ranked Solo" Value="Solo" Selected="True"></asp:ListItem>
							        <asp:ListItem Text="Ranked Flex" Value="Flex"></asp:ListItem>
							    </asp:RadioButtonList>
                                <asp:Label ID="Labeldeltext2" runat="server" Text="" Font-Bold="False" Font-Size="19pt" ForeColor="#CC0000" Font-Overline="False" Font-Strikeout="True"></asp:Label>
				                <asp:Label ID="Label5" runat="server" Text="3 Euro" Font-Bold="True" Font-Size="19pt" ForeColor="White"></asp:Label><br />
					            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="Red"></asp:Label><br />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 col-md-offset-0 margin-b-10" data-scroll-reveal="enter left over 1s and move 300px after 0.5s">
                        <div class=" offset-0" data-scrollreveal="enter left">
                            <div class=" margin-t-40 margin-b-50 " style="text-align: center;">
                                <asp:CheckBox ID="CheckBox3" runat="server" text="Duo with Booster" Font-Size="13pt" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="True" ForeColor="White" />
                                <asp:DropDownList ID="DropDownServer" runat="server" CssClass="dropdownstylecss col-xs-offset-1 margin-b-10 center-block" Width="160px" ToolTip="Select your Server">
							        <asp:ListItem Selected="True" Value="0">EUW</asp:ListItem>
							        <asp:ListItem Value="1">EUNE</asp:ListItem>
							        <%--<asp:ListItem Value="2">NA</asp:ListItem>
							        <asp:ListItem Value="3">OCE</asp:ListItem>--%>
						        </asp:DropDownList>
                                <% if (Session["user"] == null) { %>
							            <a href="../login/login.aspx" class="btn-theme btn-theme-sm btn-white-bg text-uppercase margin-t-40">Order Now</a>
					            <% } else { %>
							            <asp:Button ID="Button1" runat="server" CssClass="btn-theme btn-theme-sm btn-white-bg text-uppercase margin-t-40" Text="ORDER NOW" OnClick="Button1_Click"/>
					            <% } %>
                                <div class=" margin-t-50 margin-b-50 " style="text-align: center;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4 col-md-offset-0" data-scroll-reveal="enter left over 1s and move 300px after 0.5s">
                        <div class=" offset-0" data-scrollreveal="enter left">
                            <div class=" margin-t-40 " style="text-align: left;">
                                <span class="extra-title">Extra Services you receive for <span class="extra-title" style="color:red;">FREE</span></span><br />
					            <h2><i class="fa fa-clock-o extra-icon-size extra-text-icon green-color" aria-hidden="true"></i><span class="extra-text"> Average Time for this order: </span><asp:Label ID="timeremaininglb" runat="server" Text="-" Font-Bold="True" Font-Size="Medium" ForeColor="#10baa8"></asp:Label><br />
					            <i class="fa fa-shield extra-icon-size extra-text-icon green-color" aria-hidden="true"></i><span class="extra-text"> Every account is VPN protected</span><br />
					            <i class="fa fa-hourglass-end extra-text-icon green-color" aria-hidden="true"></i><span class="extra-text"> Booster Starts to play in 5-20 minutes</span><br />
					            <i class="fa fa-star-half-o extra-icon-size extra-text-icon green-color" aria-hidden="true"></i><span class="extra-text"> Top Tier Master/Challenger Booster</span><br />
					            <i class="fa fa-weixin extra-icon-size extra-text-icon green-color" aria-hidden="true"></i><span class="extra-text"> Chat direct with booster</span><br /></h2>


                            </div>
                        </div>
                    </div>

                </div>

                    <br /><br /><br />

				</div>
                <!-- End Masonry Grid -->
            </div>
        </fieldset>
   </ContentTemplate>
 </asp:UpdatePanel>
        


        <div id="pricing" style="background-color:#111217;">
            
                <div class="content-xs container">
                        <div class="col-sm-6">
                                <asp:Image ID="Image1" runat="server" class="img-responsive" ImageUrl="~/img/1920x1080/Jinx_1.png"/>
                        </div>
                        <div class="col-sm-6 margin-t-50 margin-b-50">
                                <i class="fa fa-question-circle" aria-hidden="true" style="color:#10baa8; font-size:25px;"></i><span class="title-description-howwork1"> How does this service work?</span><br />
                            <span class="description-howwork1">You pay us for improving your performance in ranked games. You give us your username and password and we play on your account.</span><br /><br />
                            <i class="fa fa-question-circle" aria-hidden="true" style="color:#10baa8; font-size:25px;"></i><span class="title-description-howwork2"> What is Placements Matches?</span><br />
                            <span class="description-howwork2">In placement games which we provide we guarantee atleast 7 wins out of 10 games. If we do not fullfill contract we will provide one additional division of boosting for free.</span>
                        </div>
                    <!--// end row -->
                </div>
                </div>


            
        <!-- Contact -->
        <div id="contact">
            <!-- Contact List -->
            <div class="section-seperator">
                <div class="content-lg container">
                    <div class="row">
                        <!-- Contact List -->
                        <div class="col-sm-7 sm-margin-b-50">
                            <h3>Contact with us <span class="text-uppercase margin-l-20">Human Resources</span></h3>
                            <p>We are Online 24/7 On Live Chat, you can ask everythink you want</p>
                            <ul class="list-unstyled contact-list">
                                <li><i class="margin-r-10 color-base icon-envelope"></i> support@divisionboost.eu</li>
                                <li><i class="margin-r-10 color-base icon-skype"></i> <a href="skype:divisionboosteu?chat" class="margin-r-10">DivisionBoosteu</a></li>
                            </ul>
                        </div>
                        <!-- End Contact List -->

                        <!-- Contact List -->
                        <%--<div class="col-sm-4 sm-margin-b-50">
                            <h3><a href="http://ft-seo.ch/">Malta</a> <span class="text-uppercase margin-l-20">Development</span></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed tempor incdidunt ut laboret dolor magna ut consequat siad esqudiat dolor</p>
                            <ul class="list-unstyled contact-list">
                                <li><i class="margin-r-10 color-base icon-call-out"></i> +356 7965 1257</li>
                                <li><i class="margin-r-10 color-base icon-envelope"></i> developmemt@flameonepage.com</li>
                            </ul>
                        </div>--%>
                        <!-- End Contact List -->

                        <!-- Contact List -->
                        <%--<div class="col-sm-4 sm-margin-b-50">
                            <h3><a href="http://ft-seo.ch/">Manchester</a> <span class="text-uppercase margin-l-20">CEO</span></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed tempor incdidunt ut laboret dolor magna ut consequat siad esqudiat dolor</p>
                            <ul class="list-unstyled contact-list">
                                <li><i class="margin-r-10 color-base icon-call-out"></i> +44 654 583 5518</li>
                                <li><i class="margin-r-10 color-base icon-envelope"></i> ceo@flameonepage.com</li>
                            </ul>
                        </div>--%>
                        <!-- End Contact List -->
                    </div>
                    <!--// end row -->
                </div>
            </div>
            <!-- End Contact List -->
            
            
        </div>
        <!-- End Contact -->
        <!--========== END PAGE LAYOUT ==========-->

        <!--========== FOOTER ==========-->
        <footer class="footer">
            <!-- Links -->
            <div class="section-seperator">
                <div class="content-md container">
                    <div class="row">
                        <div class="col-sm-2 sm-margin-b-30">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="../index.aspx">Home</a></li>
                                <li class="footer-list-item"><a href="../demo.aspx">Demo</a></li>
                                <li class="footer-list-item"><a href="../index.aspx#boosting">Boosting</a></li>
                                 
                            </ul>
                            <!-- End List -->
                        </div>
                        <div class="col-sm-2 sm-margin-b-30">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="https://twitter.com/DivisionBoosteu">Twitter</a></li>
                                <li class="footer-list-item"><a href="https://www.facebook.com/divisionboost.eu/">Facebook</a></li>
                                <li class="footer-list-item"><a href="https://plus.google.com/u/0/113780646356606760727">Google+</a></li>
                                <li class="footer-list-item"><a href="https://www.youtube.com/channel/UCYhFqLQwzA0mpdT8Jnn0kRA">YouTube</a></li>
                            </ul>
                            <!-- End List -->
                        </div>
                        <div class="col-sm-3">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="../faq.aspx">FAQ</a></li>
                            </ul>
                            <!-- End List -->
                        </div>
                        <%--<div class="col-xs-4 text-right">
                        <p class="margin-b-0"><img class="img-responsive" src="img/PayPal-logo.png" alt="Elo Boost Payment Type">
                        </div>--%>
                    </div>
                    <!--// end row -->
                </div>
            </div>
            <!-- End Links -->

            <!-- Copyright -->
            <div class="content container">
                <div class="row">
                    <div class="col-xs-6">
                        <img class="footer-logo" src="../img/logo.png" alt="DivisionBoost Logo">
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="margin-b-0"><a class="fweight-700" href="#">Copyright © DivisionBoost.eu 2015 - 2017</a></p>
                        <p>League of Legends are trademarks or registered trademarks of Riot Games, Inc.<br />
                        We are in no way affiliated with, associated with or endorsed by Riot Games, Inc.</p>
                    </div>
                </div>
                <!--// end row -->
            </div>
            <!-- End Copyright -->
        </footer>
        <!--========== END FOOTER ==========-->
        


        
        <!-- Back To Top -->
        <a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

        <!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- CORE PLUGINS -->
        <script src="../vendor/jquery.min.js" type="text/javascript"></script>
        <script src="../vendor/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <!-- PAGE LEVEL PLUGINS -->
        <script src="../vendor/jquery.easing.js" type="text/javascript"></script>
        <script src="../vendor/jquery.back-to-top.js" type="text/javascript"></script>
        <script src="../vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
        <script src="../vendor/jquery.wow.min.js" type="text/javascript"></script>
        <script src="../vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
        <script src="../vendor/masonry/jquery.masonry.pkgd.min.js" type="text/javascript"></script>
        <script src="../vendor/masonry/imagesloaded.pkgd.min.js" type="text/javascript"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="../js/layout.min.js" type="text/javascript"></script>
        <script src="../js/components/wow.min.js" type="text/javascript"></script>
        <script src="../js/components/swiper.min.js" type="text/javascript"></script>
        <script src="../js/components/masonry.min.js" type="text/javascript"></script>

        <link rel="stylesheet" href="../vendor/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">


            </form>
    </body>
    <!-- END BODY -->
</html>