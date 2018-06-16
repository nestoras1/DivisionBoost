<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>
<!DOCTYPE html>

<html lang="en" class="no-js">
   
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/x-icon" href="https://divisionboost.eu/img/DBLogo.ico"/>
        <title> DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
        <meta property="og:site_name" content="DivisionBoost.eu">
          <meta property="og:description" content="Elo Boosting - League of Legends" />
          <meta property="og:url" content="https://divisionboost.eu/" />
          <meta property="og:title" content="DivisionBoost" />
          <meta property="og:image" content="https://divisionboost.eu/img/fb_img_share.jpg" />
          <meta property="fb:app_id" content="1504158542989599" />
          <meta name="google-site-verification" content="4Pf_YnTUTtEop0W9tP5nahaEi_Upf0CFLimuu5aQw3o" />
        <meta name="norton-safeweb-site-verification" content="5z5ahv9wknr1st178ukw0h2gd7sdv0-xs0pkqp3algylbe-nkp6ty20fr1zx2s0uzewif8mbrk3q2s2edpp7gj3oi-f09r1vmen66xysfosnjqzar2bjcxc7v8pl989t" />
        <link href="vendor/fonts-googleapis.css" rel="stylesheet" type="text/css"/>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.css" rel="stylesheet">
        <link href="vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
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
                                <img class="logo-img logo-img-main" src="img/logo.png" alt="Eloboost Logo">
                                <img class="logo-img logo-img-active" src="img/logo-dark.png" alt="Elo Boost Logo">
                            </a>
                        </div>
                    </div>

                    <div class="collapse navbar-collapse nav-collapse">
										
                        <div class="menu-container">
                            <ul class="nav navbar-nav navbar-nav-right">
                                <li class="js_nav-item nav-item active"><a class="nav-item-child nav-item-hover" href="index.aspx">Home</a></li>
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../demo.aspx">Demo</a></li>
								<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#boosting">Boosting</a></li>
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
			                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="login/login.aspx">Login / Sign Up</a></li>
			                            <% } else { %>
			                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="../../Logout.aspx">Logout</a></li>
		                            <%} %>

                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
			</header>
       
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <div class="container">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="img-responsive" src="img/1920x1080/01.jpg" alt="Discount Price">
                    <div class="container">
                        <div class="carousel-centered">
                            <div class="margin-b-40">
                                <h1 class="carousel-title">Summer Discount</h1>
                                <h4 class="color-white">20% Off on all DivisionBoost Services <br/> Make you order!</h4>
                            </div>
                            <a href="boosting/division.aspx" class="btn-theme btn-theme-sm btn-white-brd text-uppercase">Check Here</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="img-responsive" src="img/1920x1080/02.jpg" alt="Order your boost now">
                    <div class="container">
                        <div class="carousel-centered">
                            <div class="margin-b-40">
                                <h2 class="carousel-title">Order Your Elo Boost Today!</h2>
                                <h4 class="color-white">Our team will boost your league of legends acoount  <br/> To the division you desire as fast are posible</h4>
                            </div>
                            <a href="#boosting" class="btn-theme btn-theme-sm btn-white-brd text-uppercase">Choose Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--========== SLIDER ==========-->

        <!--========== PAGE LAYOUT ==========-->
        <!-- About -->
        <div id="carousel-example-generic1" style="background-color:#1b1c23;">
            <div class="content-lg container">
                <!-- Masonry Grid -->
                <div class="masonry-grid row">
                    <div class="masonry-grid-sizer col-xs-6 col-sm-6 col-md-1"></div>
                    <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4 col-lg-4 sm-margin-b-30">
                        <div class="margin-b-60">
                            <h2>High Quality</h2>
                            <p>Over 1000+ orders have been completed until today by thousands of players worldwide. Combining low-base prices with continuous discounts.</p>
                        </div>
                        <img class="full-width img-responsive wow fadeInUp" src="img/500x500/01.png" alt="Trusted users" data-wow-duration=".3" data-wow-delay=".2s">
                    </div>
                    <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <div class="margin-b-60">
                          <h2>Best Experience</h2>
                          <p>We try to provide the best boosting experience every day with a team that consists of 30+ professional boosters.</p>  
                        </div>
						 <img class="full-width img-responsive wow fadeInUp" src="img/500x500/02.png" alt="Challenger Players" data-wow-duration=".3" data-wow-delay=".3s">
                    </div>
                    <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <div class="margin-t-60 margin-b-60">
                            <h2>Private VPN</h2>
                            <p>We provide VPN protection as a standard for every user to ensure account safety against RIOT while booster working on your LoL account.</p>
                        </div>
                        <img class="full-width img-responsive wow fadeInUp" src="img/500x500/03.png" alt="VPN Protect boost" data-wow-duration=".3" data-wow-delay=".4s">
                    </div>
				</div>
                <!-- End Masonry Grid -->
            </div>
            
            <div class="bg-color-sky-light">
                <div class="content-lg container">
                    <div class="row">
                        <div class="col-md-5 col-sm-5 md-margin-b-60">
                            <div class="margin-t-50 margin-b-30">
                                <h2>Why Us?</h2>
                                <p>DivisionBoost working only with Master or Challenger boosters and we provide various options of cheap League of Legends ELO boosting.</p>
                            </div>
                            <%--<a href="#" class="btn-theme btn-theme-sm btn-white-bg text-uppercase">More...</a>--%>
                        </div>
                        <div class="col-md-5 col-sm-7 col-md-offset-2">
                            <!-- Accordion -->
                            <div class="accordion">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <a class="panel-title-child" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    Live Chat with your Booster
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">
                                                Your order dashboard includes a real time chat with the booster that is responsible for your order. You can ask him any questions and set up game schedules!
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <h4 class="panel-title">
                                                <a class="collapsed panel-title-child" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    Spectate your Order
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body">
                                                After purchasing any type of ELO boost you will have access to the dashboard. By logging in to the dashboard you will see different types of information such as detailed match history and league points gained. 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingThree">
                                            <h4 class="panel-title">
                                                <a class="collapsed panel-title-child" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    Fast Service
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                            <div class="panel-body">
                                                 All of the players working with us are hand-picked Master and Challenger players in the current season. We have made sure that all of our boosters have multiple years of experience in Solo-Q and ELO boosting. It is guaranteed that they will do the job fast and efficiently.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Accodrion -->
                        </div>
                    </div>
                    <!--// end row -->
                </div>
            </div>
        </div>
        <!-- End About -->

       

        <!-- Pricing -->
        <div id="boosting">
            
                <div class="content-lg container">
                    <div class="row row-space-1">
                        <h1 class="text-center" style="color:#ebeef2">Elo Boosting</h1>
                        <div class="col-sm-4 sm-margin-b-1">
                            
                            
                            <div class="pricing margin-b-10">
                                <div class="margin-b-30">
                                    <img class="img-responsive" src="img/unracked.png" alt="Placement boost" style="width:50%; margin:0 auto;">
                                    <h3>Placement Wins</h3>
                                    <p>In placement games which we provide we guarantee at least 7 wins out of 10 games.</p>
                                </div>
                                <ul class="list-unstyled pricing-list margin-b-50">
                                    <li class="pricing-list-item">70%+ win rate guarantee</li>
                                </ul>
                                <a href="/boosting/placement.aspx" class="btn-theme btn-theme-sm btn-default-bg text-uppercase">Buy</a>
                            </div>
                            
                        </div>
                        <div class="col-sm-4 sm-margin-b-2">
                            
                            <div class="pricing pricing-active margin-b-10">
                                <div class="margin-b-30">
                                    <img class="img-responsive" src="img/challenger.png" alt="elo boost" style="width:50%; margin:0 auto;">
                                    <h3>Elo Boosting</h3>
                                    <p>A Division Boost is a Type of boost that will guarantee the League and Division you desire.</p>
                                </div>
                                <ul class="list-unstyled pricing-list margin-b-50">
                                    <li class="pricing-list-item">Best Option</li>
                                    <li class="pricing-list-item">Guarantee Division you'll order</li>
                                </ul>
                                <a href="/boosting/division.aspx" class="btn-theme btn-theme-sm btn-default-bg text-uppercase">Buy</a>
                            </div>
                            
                        </div>
                        <div class="col-sm-4">
                            
                            <div class="pricing margin-b-10">
                                <div class="margin-b-30">
                                    <img class="img-responsive" src="img/Void_Crest_icon.png" alt="Game win boost" style="width:50%; margin:0 auto;">
                                    <h3>Normal & Ranked Wins</h3>
                                    <p>In Wins Boost games which we provide we guarantee wins games.</p>
                                </div>
                                <ul class="list-unstyled pricing-list margin-b-50">
                                    <li class="pricing-list-item">Guarantee Wins</li>
                                    <li class="pricing-list-item">Ex: 8 Wins = 9 Wins - 1 Loss</li>
                                </ul>
                                <a href="/boosting/wins.aspx" class="btn-theme btn-theme-sm btn-default-bg text-uppercase">Buy</a>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
        </div>
        

        
        <%--<div id="work">
            <div class="bg-color-sky-light">
            <div class="section-seperator">
                <div class="content-md container">
                    <div class="row margin-b-40">
                        <div class="col-sm-6">
                            <h2>Portfolio</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed tempor incididunt ut laboret dolore magna aliqua enim minim veniam exercitation</p>
                        </div>
                    </div>
                    

                    
                    <div class="masonry-grid row">


                        <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4 md-margin-b-30">
                            
                            <div class="work work-popup-trigger">
                                <div class="work-overlay">
                                    <img class="full-width img-responsive" src="img/397x300/01.jpg" alt="Portfolio Image">
                                </div>
                                <div class="work-popup-overlay">
                                    <div class="work-popup-content">
                                        <a href="javascript:void(0);" class="work-popup-close">Hide</a>
                                        <div class="margin-b-30">
                                            <h3 class="margin-b-5">Art Of Coding</h3>
                                            <span>Clean &amp; Minimalistic Design</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8 work-popup-content-divider sm-margin-b-20">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                                                    <ul class="list-inline work-popup-tag">
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Strategy,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Implementation,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Credentials</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p class="margin-b-5"><strong>Project Manager:</strong> Boris Becker</p>
                                                    <p class="margin-b-5"><strong>Executive:</strong> Heike Macatsch</p>
                                                    <p class="margin-b-5"><strong>Architect:</strong> Oliver Pocher</p>
                                                    <p class="margin-b-5"><strong>Client:</strong> FairTech</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4 md-margin-b-30">
                            
                            <div class="work work-popup-trigger">
                                <div class="work-overlay">
                                    <img class="full-width img-responsive" src="img/397x300/02.jpg" alt="Portfolio Image">
                                </div>
                                <div class="work-popup-overlay">
                                    <div class="work-popup-content">
                                        <a href="javascript:void(0);" class="work-popup-close">Hide</a>
                                        <div class="margin-b-30">
                                            <h3 class="margin-b-5">Art Of Coding</h3>
                                            <span>Clean &amp; Minimalistic Design</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8 work-popup-content-divider sm-margin-b-20">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                                                    <ul class="list-inline work-popup-tag">
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Strategy,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Implementation,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Credentials</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p class="margin-b-5"><strong>Project Manager:</strong> Boris Becker</p>
                                                    <p class="margin-b-5"><strong>Executive:</strong> Heike Macatsch</p>
                                                    <p class="margin-b-5"><strong>Architect:</strong> Oliver Pocher</p>
                                                    <p class="margin-b-5"><strong>Client:</strong> Keenthemes</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                        <div class="masonry-grid-item col-xs-12 col-sm-6 col-md-4">
                            
                            <div class="work work-popup-trigger">
                                <div class="work-overlay">
                                    <img class="full-width img-responsive" src="img/397x300/03.jpg" alt="Portfolio Image">
                                </div>
                                <div class="work-popup-overlay">
                                    <div class="work-popup-content">
                                        <a href="javascript:void(0);" class="work-popup-close">Hide</a>
                                        <div class="margin-b-30">
                                            <h3 class="margin-b-5">Art Of Coding</h3>
                                            <span>Clean &amp; Minimalistic Design</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8 work-popup-content-divider sm-margin-b-20">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                                                    <ul class="list-inline work-popup-tag">
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Strategy,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Implementation,</a></li>
                                                        <li class="work-popup-tag-item"><a class="work-popup-tag-link" href="#">Credentials</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="margin-t-10 sm-margin-t-0">
                                                    <p class="margin-b-5"><strong>Project Manager:</strong> Boris Becker</p>
                                                    <p class="margin-b-5"><strong>Executive:</strong> Heike Macatsch</p>
                                                    <p class="margin-b-5"><strong>Architect:</strong> Oliver Pocher</p>
                                                    <p class="margin-b-5"><strong>Client:</strong> Keenthemes</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
						<div class="masonry-grid-sizer col-xs-6 col-sm-6 col-md-1"></div>
						
                        
                    </div>
                    
                </div>
                </div>
            </div>
            
           
        </div>--%>
        <!-- End Work -->


            
        <!-- Contact -->
        <div id="contact">
            <!-- Contact List -->
            <div class="section-seperator">
                <div class="content-lg container">
                    <div class="row">
                        <!-- Contact List -->
                        <div class="col-sm-7 sm-margin-b-50">
                            <h3>Contact with us <span class="text-uppercase margin-l-20">Human Resources</span></h3>
                            <p>We are Online 24/7 On Live Chat, you can ask everything you want</p>
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
        <script src="vendor/jquery.min.js" type="text/javascript"></script>
        <script src="vendor/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <!-- PAGE LEVEL PLUGINS -->
        <script src="vendor/jquery.easing.js" type="text/javascript"></script>
        <script src="vendor/jquery.back-to-top.js" type="text/javascript"></script>
        <script src="vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
        <script src="vendor/jquery.wow.min.js" type="text/javascript"></script>
        <script src="vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
        <script src="vendor/masonry/jquery.masonry.pkgd.min.js" type="text/javascript"></script>
        <script src="vendor/masonry/imagesloaded.pkgd.min.js" type="text/javascript"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="js/layout.min.js" type="text/javascript"></script>
        <script src="js/components/wow.min.js" type="text/javascript"></script>
        <script src="js/components/swiper.min.js" type="text/javascript"></script>
        <script src="js/components/masonry.min.js" type="text/javascript"></script>

        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">

        <script type="text/javascript">
            $(document).ready(function () {
                if (window.location.href.indexOf("boosting") > -1) {
                    setTimeout(function () { location.href = "https://divisionboost.eu/index.aspx#boosting"; }, 500);
                }
            });
        </script>
    </body>
    <!-- END BODY -->
</html>