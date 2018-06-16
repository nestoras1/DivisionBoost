<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckoutDetails.aspx.cs" Inherits="Checkout_CheckoutDetails" %>

<!DOCTYPE html>

<html lang="en" class="no-js">
   
    <head>
        <title> CheckOut Details - DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
        <link href="https://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="../vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/animate.css" rel="stylesheet">
        <link href="../vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/layout.min.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/x-icon" href="favicon.ico"/>  

        <script>
        	//-------google analytics--------------
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

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
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../demo.aspx">Demo</a></li>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../index.aspx#boosting">Boosting</a></li>
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



        <div id="carousel-example-generic1">
            <div class="content-lg container">
                <div class="masonry-grid row margin-t-40">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-md-offset-0" >
                        <div class=" offset-0" data-scrollreveal="enter left">
                        <div class=" m20 " style="text-align: center;">
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

                        </div>
                        </div>
                        </div>

                        <div class="col-xs-10 col-sm-8 col-md-6 col-lg-5 col-md-offset-0 margin-t-30">
                        <div class=" offset-0" data-scrollreveal="enter left">
                        <div class=" m20 " style="text-align: center;">
                            <asp:Label ID="Label1" runat="server" Text="Coupon Code:" CssClass="couponcode" Font-Bold="True"></asp:Label>
						    <asp:TextBox ID="coupontb" runat="server" CssClass="couponcode"></asp:TextBox>
						    <asp:Button ID="couponbt" runat="server" Text="Apply Coupon!" CssClass="btn-theme btn-theme-sm btn-white-bg text-uppercase" OnClick="couponbt_Click" /><br />
						    <asp:Label ID="couponerrorlb" runat="server" Text="" ForeColor="Red" Font-Bold="True" Font-Size="16px"></asp:Label>
						    <asp:Label ID="couponoklb" runat="server" Text="" ForeColor="Green" Font-Bold="True" Font-Size="16px"></asp:Label>
                        </div>
                        </div>
                        </div>

                        <div class="col-xs-10 col-sm-12 col-md-6 col-lg-7 col-md-offset-0 right margin-t-30">
                        <div class=" offset-0" data-scrollreveal="enter right">
                        <div class="" style="text-align: right;">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="https://www.paypalobjects.com/webstatic/en_US/i/buttons/buy-logo-medium.png" onclick="Button1_Click" />
                        </div>
                        </div>
                        </div>



                    <br /><br /><br />

				</div>
            </div>
        </fieldset>
   </ContentTemplate>
 </asp:UpdatePanel>

        <div id="contact">
            <div class="section-seperator">
                <div class="content-lg container">
                    <div class="row">
                        <div class="col-sm-7 sm-margin-b-50">
                            <h3>Contact with us <span class="text-uppercase margin-l-20">Human Resources</span></h3>
                            <p>We are Online 24/7 On Live Chat, you can ask everythink you want</p>
                            <ul class="list-unstyled contact-list">
                                <li><i class="margin-r-10 color-base icon-envelope"></i> support@divisionboost.eu</li>
                                <li><i class="margin-r-10 color-base icon-skype"></i> <a href="skype:divisionboosteu?chat" class="margin-r-10">DivisionBoosteu</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
        <footer class="footer">
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