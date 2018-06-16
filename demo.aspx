<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>
<%@ OutputCache Duration="600" VaryByParam="txtname" %>

<!DOCTYPE html>

<html lang="en" class="no-js">
   
    <head>
        <title> Demo Order Overview - DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
        <meta property="og:site_name" content="DivisionBoost.eu">
      <meta property="og:description" content="Demo - Elo Boosting - League of Legends" />
      <meta property="og:url" content="https://divisionboost.eu/" />
      <meta property="og:title" content="Demo - DivisionBoost" />
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
          })(window, document, 'script','vendor/analytics.js','ga');

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
                                <li class="js_nav-item nav-item active"><a class="nav-item-child nav-item-hover" href="../demo.aspx">Demo</a></li>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../index.aspx#boosting">Boosting</a></li>
                                <%--<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#products">Coaching</a></li>--%>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../faq.aspx">FAQ</a></li>

                                <% if (Session["user"] == null) { %>
	                              <% } else { %>
	                              <% if (Session["account_type"].ToString() == "False") { %>
			                           <li class="js_nav-item nav-item active"><a class="nav-item-child nav-item-hover" href="../../customer/index.aspx">Dashboard</a></li>
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
        <div id="carousel-example-generic1" class="leesinphoto">
            <div class="content-lg container">
                <!-- Masonry Grid -->
                <div class="masonry-grid row">
                    <div class="masonry-grid-sizer col-xs-6 col-sm-6 col-md-1"></div>
                    <div class="masonry-grid-item col-xs-10 col-sm-8 col-md-10 sm-margin-b-30">
                        <div class="margin-b-60">
                            <asp:Table ID="Table1" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>Order</asp:TableCell>
                                    <asp:TableCell>Order Status</asp:TableCell>
                                    <asp:TableCell>Server</asp:TableCell>
                                    <asp:TableCell>Summoner name</asp:TableCell>
                                    <asp:TableCell>Account Details<asp:Image ID="truefalseimg" runat="server" ImageUrl="customer/img/True_icon.png" Height="20px" Width="20px"/></asp:TableCell>
                                    <%--<asp:TableCell><a href="../../customer/resetpwd.aspx" class="btn-theme btn-theme-sm btn-white-bg text-uppercase">Change Site Password</a></asp:TableCell>--%>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell><asp:Label ID="Label_orderID2" runat="server" class="userdisplaystats21" Text="GSXR1"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="Label_orderstatus2" runat="server" class="userdisplaystats22" Text="In progress"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="Label_server2" runat="server" class="userdisplaystats23" Text="EUW"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="Label_summonername2" runat="server" class="userdisplaystats24" Text="playername"></asp:Label></asp:TableCell>
                                    
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6 sm-margin-b-0">
                        <div class="margin-b-0">
                            <asp:Table ID="Table2" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>Account Name</asp:TableCell>
                                    <asp:TableCell>Summoner name</asp:TableCell>
                                    <asp:TableCell>Password</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell><asp:TextBox ID="TextBox_accountname" runat="server" CssClass="textbox1" onfocus=""></asp:TextBox></asp:TableCell>
                                    <asp:TableCell><asp:TextBox ID="TextBox_summonernameedit" CssClass="textbox1" runat="server"></asp:TextBox></asp:TableCell>
                                    <asp:TableCell><asp:TextBox ID="TextBox_accountpassword" TextMode="Password" CssClass="textbox1" runat="server"></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>

                    <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-6 sm-margin-t-0 margin-t-30">
                        <div class="margin-b-50">
                            <asp:Button ID="button_saveaccountdetails" runat="server" Text="Save" class="btn-theme btn-theme-sm btn-white-bg text-uppercase"/>
                            <asp:Image ID="savetrueimg" runat="server" ImageUrl="img/True_icon.png" Height="23px" Width="23px" Visible="false" />
                            <asp:Label ID="Label4" runat="server" class="" Text="Saved Success" Font-Size="20px" Visible="false"></asp:Label>
                            
                        </div>
                    </div>





                    <div class="masonry-grid-item col-xs-6 col-sm-6 col-md-6 sm-margin-b-0">
                        <div class="margin-t-20 margin-b-0">
                            <asp:Table ID="Table3" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell><asp:Label ID="Label1" runat="server" Text="Start" Font-Size="30px" Font-Bold="True"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="Label2" runat="server" Text="Current" Font-Size="30px" Font-Bold="True"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="Label3" runat="server" Text="Desired" Font-Size="30px" Font-Bold="True"></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell><asp:Image ID="img_progressdivstart" runat="server" CssClass="col-md-offset-0 col-lg-pull-9" ImageUrl="~/img/divisions/gold-sima.png"/></asp:TableCell>
                                    <asp:TableCell><asp:Image ID="img_progressdivcurrent" runat="server" ImageUrl="~/img/divisions/gold-sima.png" /><asp:Label ID="currentplacementlb" runat="server" Text="Label" Visible="False" Font-Size="140px"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="desiredplacementlb" runat="server" Text="Label" Visible="False" Font-Size="140px"></asp:Label><asp:Image ID="img_progressdivdesired" runat="server" ImageUrl="~/img/divisions/platinum-sima.png"/></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell><asp:Label ID="label_progressdivstart" runat="server" Text="Gold II" Font-Size="22px" Font-Bold="True"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="label_progressdivcurrent1" runat="server" Text="Gold I" Font-Size="20px" Font-Bold="True"></asp:Label><br /><asp:Label ID="label_progressdivcurrent3" runat="server" Text="70LP" Font-Size="20px" Font-Bold="True"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label ID="label_progressdivdesired" runat="server" Text="Platinum IV" Font-Size="20px" Font-Bold="True"></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="3">
                                        <div class="progress">
			                              <div id="progressdivid" runat="server" class="progress-bar progress-bar-striped active"  role="progressbar">
				                              <asp:Label ID="progressbartext" runat="server" Text=""></asp:Label>
			                              </div>
                                          </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>



                    <div class="masonry-grid-item col-xs-8 col-sm-8 col-md-6 sm-margin-b-0">
                        <div class="margin-t-20 margin-b-0">
                            <div class="div-spacefree">
	                            <div class="div-spaceforchat"></div>
			                    <div class="chatbox">
				                   <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
		                                <div id="chatlogs" class="chatlogs">
		                                <div class="chat user2">
					                        <%--<div class="user-photo"></div>--%>
					                        <p class="chat-message"><b>Booster: </b>Hello, I'm your booster, I'll start in few minutes</p>                    
				                        </div>
				                        <div class="chat user1">
					                        <%--<div class="user-photo"></div>--%>
					                        <p class="chat-message">Hi, Good luck!</p>   
				                        </div>
				                        <div class="chat user2">
					                        <%--<div class="user-photo"></div>--%>
					                        <p class="chat-message"><b>Booster: </b>I have to edit some runes. Can I?</p>                    
				                        </div>
				                        <div class="chat user1">
					                        <%--<div class="user-photo"></div>--%>
					                        <p class="chat-message">Sure!</p>                    
				                        </div>
			                           <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
		                                </div>
		                                <div class="chat-form">
			                            <asp:TextBox id="txtsend" runat="server" class="chat-formtextbox" cols="20" rows="2" placeholder = "Enter your message"></asp:TextBox>
				                    <asp:Button ID="btn_sendmsg" runat="server" class="chat-formbutton" UseSubmitBehavior="true" Text="SEND"/>
		                      </div>
		                    </div>
		                  </div>

                        </div>
                    </div>




				</div>
                <!-- End Masonry Grid -->
            </div>
        </div>
        <!-- End About -->

            
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
        </fieldset>
   </ContentTemplate>
 </asp:UpdatePanel>



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

        <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">

            </form>
    </body>
    <!-- END BODY -->
</html>