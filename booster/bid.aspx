<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bid.aspx.cs" Inherits="booster_orderbid" %>

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
	<meta name="author" content="" />
	<link rel="icon" type="image/x-icon" href="https://divisionboost.eu/images/DBLogo.ico"/>
	<!-- Bootstrap Core CSS -->
	<link href="~/booster/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="~/booster/css/stylish-portfolio.css" rel="stylesheet" type="text/css" />
	<!-- Custom Fonts -->
	<link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<script>

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
		<nav class="navbar navbar-inverse">


  <div class="nav-div">
	  <div class="nav-bar-left">
		  <a class="navbar-brand" href="../booster/index.aspx"><i class="fa fa-diamond"></i>DivisionBoost</a>
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
		<div style="width:1100px; min-width:1100px; margin:0 auto;">
			<div class="divorderidbid">Order id: <asp:Label ID="ordernamelb" runat="server" Text="OrderName"></asp:Label></div>
			<div class="spandivsbid">
				<div class="spandiv1bid"><span class="spanredcolor">Never use scripts or 3rd party tools</span><span> in a customer account, </span><span class="spanredcolor">Never share the account with anyone else</span><span>, regardless of the situation.</span></div>
				<div class="spandiv2bid"><span class="spanredcolor">Do not attempt to contact a customer</span><span> and give him a lower price or a </span><span class="spanredcolor">private service</span><span>, we give customers who report boosters free division orders.</span></div>
				<div class="spandiv3bid"><span>You need to play at least </span><span class="spanredcolor">3 games after locking</span><span> an order, and </span><span class="spanredcolor">10 minimum per day</span><span>, without any excuses </span><span class="spanredcolor">OR WE WILL REMOVE CASHOUT FROM YOUR BALANCE</span><span>. If you are not sure about it, DO NOT Bid!</span></div>
			</div>
			<div class="spandiv4bid"><span>Keep in mind that we are a real company, Online Games Inc exist since 2015, we have the right to sue anyone that attempts to the disrupt normal company service that is directly related to loss of company profit.</span></div>

			<div class="div-orderinfo">

				<table class="table-fill">
					<tbody class="table-hover">
						<tr><td class="text-left"><asp:Label ID="orderdescriptionlb1" runat="server" Text="Description"></asp:Label></td>
							<td class="text-left"><asp:Label ID="orderdescriptionlb2" runat="server" Text="-"></asp:Label><br />
							<div class="div-descinfo"><div class="div-duoqueue"><asp:Label ID="queuelb" runat="server" Text="Queue"></asp:Label></div><div class="div-soloflex"><asp:Label ID="rankedlb" runat="server" Text="Queue"></asp:Label></div></div></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="startingcashoutlb1" runat="server" Text="Starting Cashout"></asp:Label></td>
						<td class="text-left"><asp:Label ID="startingcashoutlb2" runat="server" Text="-"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="minbidlb1" runat="server" Text="Minimum Bid"></asp:Label></td>
						<td class="text-left"><asp:Label ID="minbidlb2" runat="server" Text="-"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="serverlb1" runat="server" Text="Server"></asp:Label></td>
						<td class="text-left"><asp:Label ID="serverlb2" runat="server" Text="None"></asp:Label></td>
						</tr>
					</tbody></table>



			</div>
			<div class="div-orderbid">
				<div class="divtimeleft1"><asp:Label ID="timeleftlb1" runat="server" Text="Time Left"></asp:Label></div>

				<div class="divtimeleft2"><p id="demo"></p></div>
				<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="2000"></asp:Timer>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server" AutoPostBack="True">
				<Triggers>
				<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
			</Triggers>
				<ContentTemplate>
					<fieldset>
						
						<div class="divcurrentbid1"><asp:Label ID="Cblb" runat="server" Text="Current Bid:"></asp:Label></div>
						<div class="divcurrentbid2"><asp:Label ID="currentbidlb" runat="server" Text="Available to start"></asp:Label><asp:Label ID="currentbidlb2" runat="server" Text=""></asp:Label></div>
						<div class="divcurrentboosterwinbid1"><asp:Label ID="winnerbooster" runat="server" Text="Loading"></asp:Label></div>
					</fieldset>
				</ContentTemplate>
			</asp:UpdatePanel>

				
				
						<asp:Button ID="bidbt" runat="server" class="buttonbid" Text="Bid" OnClick="bidbt_Click" />
				<div class="bidtbprice"><asp:TextBox ID="bidtb" runat="server" CssClass="bidtbpricecss"></asp:TextBox></div>
				<asp:Label ID="errorbidlb" runat="server" Text="" ForeColor="Red" Font-Bold="True" Font-Size="23px"></asp:Label>
				
			</div>

		</div>

		


	</form>
</body>
</html>
