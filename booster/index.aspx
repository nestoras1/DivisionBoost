<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="booster_index" %>




<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
	<title>DivisionBoost - Professional Boosting - EloBoost</title>
		<meta charset="utf-8" />
	<meta https-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="keywords" content="elo boost, cheap elo boost, league of legends boost, league of legends elo boost, lol boost, 
		lol boosting, eloboost, cheap elo boosting, elo boost league, elo boost lol, elo boosting lol, elo boosting service, 
		league of legends boosting, lol elo boost, boost lol, eloboosting, league of legends elo boosting, boosting lol, elo boost euw, 
		eloboost 24, elo boost service, lol boost cheap, lol eloboost, lol tier list, lol counters "/>
	<meta name="description" content="Professional league of legends Boosting By Professional Players. We provide high quality ELO 
		Boosting for League of Legends.  Get the best ELO & League Boost experience, with a 100% satisfaction guarantee at divisionboost.eu" />
    <meta property="og:url" content="https://divisionboost.eu/" />
  <meta property="og:title" content="DivisionBoost" />
  <meta property="og:image" content="https://divisionboost.eu/images/fb_img_share.jpg" />
  <meta property="og:description" content="Challenger boosters - 2 years on market - Solo/Duo Boost - VPN - Live Chat 24/7
Try out tutorial video · Customize your boost · 32 Boosters" />
  <meta property="fb:app_id" content="1504158542989599" />
	<link rel="icon" type="image/x-icon" href="https://divisionboost.eu/images/DBLogo.ico"/>
	<!-- Bootstrap Core CSS -->
	<link href="~/booster/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="~/booster/css/stylish-portfolio.css" rel="stylesheet" type="text/css" />
	<!-- Custom Fonts -->
	<link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
		rel="stylesheet" type="text/css" />
		 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script>
		function myFunction(a) {
			alert("ok");
			__dopostback("btn_checkout", a);
		}

		//-------google analytics--------------
		(function (i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date(); a = s.createElement(o),
			m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
		})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-76719054-2', 'auto');
		ga('send', 'pageview');
		//-------google analytics--------------

		//Start of Zendesk Chat Script
		window.$zopim || (function (d, s) {
			var z = $zopim = function (c) { z._.push(c) }, $ = z.s =
			d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) {
				z.set.
				_.push(o)
			}; z._ = []; z.set._ = []; $.async = !0; $.setAttribute("charset", "utf-8");
			$.src = "https://v2.zopim.com/?4ZfFEVI9d17lIqm6fM5HovydWVWbSf0u"; z.t = +new Date; $.
			type = "text/javascript"; e.parentNode.insertBefore($, e)
		})(document, "script");
		//End of Zendesk Chat Script
		</script>
</head>
<body>
	<form id="form1" runat="server">
		<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">LinkButton</asp:LinkButton>
		<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Visible="False">LinkButton</asp:LinkButton>
		<nav class="navbar navbar-inverse">


  <div class="nav-div">
	  <div class="nav-bar-left">
		  <a class="navbar-brand" href="../index.aspx"><i class="fa fa-diamond"></i>DivisionBoost</a>
	  </div>
	  <div class="nav-bar-right">
		  
	<ul class="nav navbar-nav navbar-right">
		<li class="divlabel_solo_rank1"><asp:Label ID="label_solo_rank1" runat="server" Text="Solo Rank: " ForeColor="White"></asp:Label></li>
		<li class="divlabel_solo_rank2"><asp:Label ID="label_solo_rank2" runat="server" Text="" Font-Bold="True" ForeColor="White"></asp:Label></li>
		<li class="divlabel_duo_rank1"><asp:Label ID="label_duo_rank1" runat="server" Text="Duo Rank: " ForeColor="White"></asp:Label></li>
		<li class="divlabel_duo_rank2"><asp:Label ID="label_duo_rank2" runat="server" Text="" Font-Bold="True" ForeColor="White"></asp:Label></li>
		<li class="divlabel_balance1"><asp:Label ID="label_balance1" runat="server" Text="Balance: " ForeColor="White"></asp:Label></li>
		<li class="divlabel_balance2"><asp:Label ID="label_balance2" runat="server" Text="" Font-Bold="True" ForeColor="White"></asp:Label></li>
	  <li><a href="#"><span class="glyphicon glyphicon-settings"></span> Settings</a></li>
	  <li><a href="../Logout.aspx"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
	</ul>
	  </div>
  </div>
</nav> 
		

	<div style="width:1250px; min-width:1100px; margin:0 auto;">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="dashboardleftside">

			<div class="yourorderdiv">
				<div class="indextitlesdivs">Your Orders</div>
				<asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
			</div>

			<div class="newsdiv">
				<div class="indextitlesdivs">News</div>
				<div class="newstitletext">Regarding Private Boosting - Booster Bait</div>
				<div class="newstext"><span>Customers are aware that they receive 10 Free Division Boost (more than $300)<br /><br />Best regards,<br />Nestor</span></div>
			</div>

		</div>
	
		<div class="dashboardrightside">
			
			<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="5000"></asp:Timer>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server" AutoPostBack="True">
				<Triggers>
				<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
			</Triggers>
				<ContentTemplate>
					<fieldset>
						<div class="availableorderdiv">
							<div class="indextitlesdivs">Available Orders</div>
							<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
						</div>
					</fieldset>
				</ContentTemplate>
			</asp:UpdatePanel>
			<div class="rulesdiv">
				<div class="indextitlesdivs">Rules</div>
				<div class="rulestitletext">List of rules and penalties.</div>
				<div class="rulestext"><span>To <b>REPORT</b> any booster breaking rules below, anonymously, add <b>divisionboosteu</b> on Skype and you'll be rewarded.<br /><br />Actions you <b>CANNOT</b> do in DivisionBoost:<br />
					<b>-YOU CAN'T</b> attempt to ask the customer for a cheaper price <b>(Private Job)</b>, Customers that report boosters for private jobs receive a <b>FREE 10 Division Boost</b>, and they will attempt to bait you. <b>Penalty: Permanent Ban + Last 6 Months Paypal Payments Chargeback</b><br />
					<b>-YOU CAN'T</b> use scripts or any 3rd party programs. <b>Penalty: Permanent Ban + Last 6 Months Paypal Payments Chargeback</b><br />
					<b>-YOU CAN'T</b> add the customer to your league of legends friend list in any situation, you <b>MUST</b> invite him directly from the lobby in case you are doing a DUO order. <b>Penalty:-25</b><br />
					<b>-YOU CAN'T</b> share your personal information such as social media, skype, summoner names, email, discord, etc. <b>Penalty: Permanent Ban</b><br />
					<b>-YOU CAN'T</b> ask the customer to start the order later or tomorrow. <b>Penalty: -10</b><br />
					<b>-YOU CAN'T</b> flame or Trash Talk in any way, in a customer account or inside a game where a customer is present. <b>Penalty: Permanent Ban</b><br />
					<b>-YOU CAN'T</b> talk to ANY customer account friends without exception. <b>Penalty: -20</b><br />
					<b>-YOU CAN'T</b> use customer IP\RP WITHOUT the customer permission. <b>Penalty: -50</b><br />
					<b>-YOU CAN'T</b> SHARE customer account information with ANYONE other than YOU. <b>Penalty: Permanent Ban</b><br />
					<b>-YOU CAN'T</b> DODGE or ABANDON games even if you were autofilled, without customer's permission. <b>Penalty: -25</b><br />
					<b>-YOU CAN'T</b> STREAM any GAMES while playing on a customer account or doing DUO with a customer. <b>Penalty: Permanent Ban</b><br /><br /><br />
														   
					Actions you <b>MUST</b> do in GGBoost:<br />

					<b>-YOU MUST</b> talk to the customer RIGHT AFTER getting a new order. <b>Penalty: -5</b><br />
					<b>-YOU MUST</b> play at least 3 Games in the customer account \ with the customer RIGHT AFTER getting a new order. <b>Penalty: -10</b><br />
					<b>-YOU MUST</b> play at least 10 games \ day (24h) in every order that you have. <b>Penalty: No cashout from order, -10</b><br />
					<b>-YOU MUST</b> update the customer when you stop playing in his account and tell him when you plan to get back. <b>Penalty: -5</b><br />
					<b>-YOU MUST</b> tell customer your availability\schedule to any DUO orders that you get before and after games. <b>Penalty: -5</b><br />
					<b>-YOU MUST</b> talk to an admin if your order games are not updating. <b>Penalty: No order cashout</b><br />
					<b>-YOU MUST</b> respect customer positions \ champions unless the customer tells you not to. <b>Penalty: -10</b><br />
					<b>-YOU MUST</b> tell the customer WHICH runes and masteries you changed after you do. <b>Penalty: -10</b><br /><br /><br />

					Other things that will give you penalties:<br /><br />
					-Asking an admin to leave an order. <b>Penalty: Cut in cashout \ No cashout \ Penalty according to rules</b><br />
				</span></div>

			</div>

		</div>


	</div>

	</form>
</body>
</html>
