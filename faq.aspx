<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>
<%@ OutputCache Duration="600" VaryByParam="txtname" %>

<!DOCTYPE html>

<html lang="en" class="no-js">
   
    <head>
        <title> Frequently Asked Questions - DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
        <meta property="og:site_name" content="DivisionBoost.eu">
          <meta property="og:description" content="FAQ - Elo Boosting - League of Legends" />
          <meta property="og:url" content="https://divisionboost.eu/" />
          <meta property="og:title" content="FAQ - DivisionBoost" />
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
        <link href="css/layout.min.css" rel="stylesheet" type="text/css"/>
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
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../demo.aspx">Demo</a></li>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../index.aspx#boosting">Boosting</a></li>
                                <%--<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#products">Coaching</a></li>--%>
								<li class="js_nav-item nav-item active"><a class="nav-item-child nav-item-hover" href="../../faq.aspx">FAQ</a></li>

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
                        <div class=" m20 " style="text-align: left;">
                        
                            <ul>
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>How does this service work?</b></h4></div><h5>You pay us for improving your performance in ranked games. 
					              You give us your username and password and we play on your account. We have a lot of players which are at least in Master and Challenger league who 
					              guarantee the quah4ty and speed required for your order.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>What makes sure that my account won't get stolen?</b></h4></div><h5>The security of your account is
					               provided by an apph4cation programmed by our developers. With that apph4cation no booster has the access to your private details.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Do the boosters have the access to my IP and RP?</b></h4></div><h5>No, the access to the shop is blocked
					               but in the case when the number of heros or runs is not sufficient booster can ask for the purchase.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Can the boosters play with the champion or role that I want? </b></h4></div><h5>You can ask the booster direct with your chat on DashBoad 
					              but the final decision belongs to him. Remember that the booster must choose what's best for you and the team!
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Can I watch the games performed by the booster on my account?</b></h4></div><h5>Yes, after purchase you
					               receive information allows you to spectate the boosters game on your account.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Can I contact the booster outside of the game?</b></h4></div><h5>Yes, you can contact with him via chat on your Dashboard. 
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>There have been no games played on my account for hours now, why does this happen?</b></h4></div><h5>There's 
					              a lot of reasons why this can happen. If there are no server problems then you should contact the administrators through the contact 
					              form <span class="kokkiko-skouro">support@divisionboost.eu</span>. We will solve all of your problems.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>How long will you work on my account to get my desired division?</b></h4></div><h5>We aren't in a position 
					              to say how long exactly your account will be worked on. It depends on a few things that we have no control under such as the size of 
					              your order, the current amount of orders and the availabih4ty of our players. Sometimes it can take a couple of days and sometimes it 
					              can be done in under 24 hours. You can see the estimated average time when you make an order.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Can I play on my account while you're working on it?</b></h4></div><h5>Yes but before the game you will 
					              need to check if a booster isn't currently playing on your account. After you've made sure that no booster is playing on your account,
					               you can pause your order. Remember that you can play all game modes apart from ranked solo/duo 5v5.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>I've made my payment, what now?</b></h4></div><h5>Once you have paid for the boost, make sure you register on our site 
					              and then log into your account and fill your Username, Summoner Name and Game Password. Once you’ve customized your boosting order, the service 
					              is ready to begin.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>Can I play duo with my booster?</b></h4></div><h5>Yes, please select a Duo with booster option from our h4st of services
					               and you can play with your booster throughout the order.
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>I've made a mistake in my order, what shall I do?</b></h4></div><h5>you can speak to an administrator
					               and you talk about to change your order via h4ve chat or at support@divisionboost.eu
				             <%-- </h5><div class="div-faqtitle"><h4 class="green-color"><b>What are gifts and why are they given to the boosters?</b></h4></div><h5>Gifts are extra money for the boosters.
					               Gifts are given out by you and they cost you extra money. You can reward the booster for multiple reasons, high scores, for example a
					               lot of wins in a row, games with your favourite champion or games as your favourite role.--%>
				              </h5><div class="div-faqtitle"><h4 class="green-color"><b>I get less than 12 league points for a game, can I use the first option for the boosting?</b></h4></div><h5>If you win 
					              less than 12 league points per game, means your MMR is very low, so in this case the division boost is not an option, to improve your MMR we 
					              have the wins service that will fit much better and will help you in the future grinding the ranks.
				            </ul>

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