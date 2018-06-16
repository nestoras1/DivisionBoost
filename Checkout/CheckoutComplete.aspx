<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckoutComplete.aspx.cs" Inherits="Checkout_CheckoutComplete" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Checkout - DivisionBoost</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:url" content="https://divisionboost.eu/" />
  <meta property="og:title" content="DivisionBoost" />
  <meta property="og:image" content="https://divisionboost.eu/images/fb_img_share.jpg" />
  <meta property="og:description" content="Challenger boosters - 2 years on market - Solo/Duo Boost - VPN - Live Chat 24/7
Try out tutorial video · Customize your boost · 32 Boosters" />
  <meta property="fb:app_id" content="1504158542989599" />
	<link rel="icon" type="image/x-icon" href="https://divisionboost.eu/images/DBLogo.ico"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
		rel="stylesheet" type="text/css" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<form id="form1" runat="server">
	<div>

		<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=1504158542989599";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


</script>


	  <div class="header-background-div">
	   <header id="top" class="header" >
		  <div class="header-div">
		   <div class="header-div-left">
			   <a class="header-title" href="../index.aspx">
			   <asp:Image ID="Image7" runat="server" ImageUrl="~/images/dblogo.png" href="../../Index.aspx" Width="85" Height="85"/>
			   <span class="header-title h1">DivisionBoost</span></a>
		   </div>
			<div class="header-div-right">
		  <a href="https://www.facebook.com/divisionboost.eu/"><i class="navbar-brand fa fa-facebook fa-fw fa-2x" ></i></a>
		  <a href="https://plus.google.com/u/0/113780646356606760727"><i class="navbar-brand fa fa-google-plus fa-fw fa-2x"></i></a>
		  <a href="https://www.youtube.com/channel/UCYhFqLQwzA0mpdT8Jnn0kRA"><i class="navbar-brand fa fa-youtube fa-fw fa-2x" ></i></a>
		  <a href="https://twitter.com/DivisionBoosteu"><i class="navbar-brand fa fa-twitter fa-fw fa-2x"></i></a>
			<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" style="margin-left:-95px; width:140px;" data-layout="button" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div>
		
		</div><br />
	   </div>
	  </header>


   <nav class="navbar navbar-inverse" style="height:30px;">
	<div class="container-fluid" style="width:60%;">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
	  <li><a href="../../Index.aspx">HOME</a></li>
	  <li><a href="../../demo.aspx">DEMO</a></li>
	  <li><a href="../../boosting/index.aspx">BOOSTING</a></li>
	  <li><a href="../../coaching/index.aspx">COACHING</a></li>
	  <li><a href="../../faq.aspx">FAQ</a></li>
	</ul>

	  
	</div>
	<ul class="nav navbar-nav navbar-right" >
	  <% if (Session["user"] == null) { %>
							
	  <% } else { %>
					
	  <% if (Session["account_type"].ToString() == "False") { %>
			<li  class="active"><a href="../customer/index.aspx">Dashboard</a></li>
			<% } else { %>
			<li  class="active"><a href="../booster/index.aspx">Dashboard</a></li>
			<%} %>

			<%} %>
	  <% if (Session["user"] == null) { %>
			<li><asp:LinkButton ID="LinkButton5" runat="server" OnClientClick="javascript:$find('mp2').show();return false;$find('mp1').hide();$find('mp2').hide();"><span class="glyphicon glyphicon-user"></span> Sign Up</asp:LinkButton></li>
			<li><asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="javascript:$find('mp1').show();return false;$find('mp3').hide();$find('mp2').hide();"><span class="glyphicon glyphicon-log-in"></span> Login</asp:LinkButton></li>
			<% } else { %>
			<li><a href="../../Logout.aspx"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		<%} %>
	</ul>
  </div>
</nav>
</div>
</div>
			<div style="width:1100px; min-width:1100px; margin:0 auto;">
		<h1><span>Checkout Complete <asp:Image ID="savetrueimg" runat="server" ImageUrl="~/customer/img/True_icon.png" Height="30px" Width="30px"/></span></h1>
		<div role="form" class="form-horizontal">
			
				<div class="div-paymenttra">
					<label class="control-label">Transaction ID:</label><asp:Label ID="TransactionId" CssClass="control-label" runat="server"></asp:Label><br />
					<label class="control-label">Amount:</label><asp:Label ID="amountlb" CssClass="control-label" runat="server"></asp:Label><br />
					<label class="control-label">Description:</label><asp:Label ID="descriptionlb" CssClass="control-label" runat="server"></asp:Label><br /><br />
				</div>
				<h4><span>Now go on your Dashboard and fill Username, Summoner Name and your game Password. After that you are ready!</span></h4>
			
		</div>
		<br /><br />
			<div class="div-buttontodashboard">
			<asp:LinkButton ID="lnkRedirectToDashBoard" CssClass="btn btn-primary btn-block" PostBackUrl="../customer/index.aspx" runat="server">Go To DashBoard</asp:LinkButton>
		</div>
	</div>
		<br /><br /><br /><br />

			  <section id="question" class="questions-section">
		  <div class="question-img-div">
			  <asp:Image ID="Image6" runat="server" ImageUrl="~/images/questions.png" width="480" Height="272"/>
				<div class="questions-title-text">
					 <span>You Need Help?</span>
					<div class="question-text">
					  <span>Talk to us Now! Our Live Customer Support is up 24/7!</span><br />
					  <span>Email: support@divisionboost.eu</span><br />
					  <span>Skype: <a href="skype:divisionboosteu?chat" style="color:white;">divisionboosteu</a></span>
					</div>
				</div>
			  
		  </div>
		  </section>
	  <br />
	<footer>
		<div class="footer-div">
		 <div class="div-footer-left">
			<div class="text-center">
				<%--<div class="col-lg-10 col-lg-offset-1 text-center">--%>
					<ul class="list-unstyled">
						<asp:Image ID="Image1" class="paypal-bottom-image" runat="server" ImageUrl="~/images/PayPal-logo-1.png" /><br />
						<li><i class="fa fa-skype fa-fw"></i>Skype: divisionboosteu</li>
						<li><i class="fa fa-envelope-o fa-fw"></i> e-mail: <a href="mailto:support@divisionboost.eu">support@divisionboost.eu</a>
						</li>
					</ul>
					
				<%--</div>--%>
			</div>
			 </div>
		<div class="div-footer-right">
			<div class="fb-page" data-href="https://www.facebook.com/divisionboost.eu/" style="margin-top:30px;" data-tabs="timeline" data-width="240" data-height="70" data-small-header="true" data-adapt-container-width="false" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/divisionboost.eu/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/divisionboost.eu/">DivisionBoost.eu</a></blockquote></div>
		</div>
		</div>
	</footer>
	  <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	  <div class="copyright-div">
		  <div class="copyright-text">
		<p class="text-muted">Copyright &copy; DivisionBoost.eu 2015 - 2017</p>
		  </div>
		  <div>
			  <p class="mikragrammatakatoapo-copyright">League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc.<br />
			  We are in no way affiliated with, associated with or endorsed by Riot Games, Inc.</p>
		  </div>
	  </div>

	</form>
</body>
</html>
