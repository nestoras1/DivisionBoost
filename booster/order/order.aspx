<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="booster_order" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html>

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
	<link href="~/booster/order/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="~/booster/order/css/stylish-portfolio.css" rel="stylesheet" type="text/css" />
	<!-- Custom Fonts -->
	<link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
		rel="stylesheet" type="text/css" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
  <link href="css/bootstrap.min.css" rel="stylesheet" />

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script>

		$(document).keypress(function (e) {
			if (e.keyCode === 13) {
				//e.preventDefault();
				__doPostBack('btn_sendmsg', '');
				document.getElementById("txtsend").value = "";
				return false;
			}
		});


		$(document).ready(function () {
			document.getElementById("chatlogs").scrollTop = document.getElementById("chatlogs").scrollHeight;
		});

		function ResetScrollPosition() {
			setTimeout("document.getElementById(\"chatlogs\").scrollTop = document.getElementById(\"chatlogs\").scrollHeight", 0);
		}
		function focuschattextbox() {
			setTimeout("document.getElementById(\"txtsend\").focus()", 0);
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
<nav class="navbar navbar-inverse">


  <div class="nav-div">
	  <div class="nav-bar-left">
		  <a class="navbar-brand" href="../../booster/index.aspx"><i class="fa fa-diamond"></i>DivisionBoost</a>
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
		<div style="width:1400px; min-width:1100px; margin:0 auto;">
		<div class="leftdiv">
		<div class="oorderinfodiv">
			<div class="indextitlesdivs">Order Information</div>
			<table class="table-fill">
					<tbody class="table-hover">

						<tr>
						<td class="text-left"><asp:Label ID="orderidlb1" runat="server" Text="Order ID"></asp:Label></td>
						<td class="text-left"><asp:Label ID="orderidlb2" runat="server" Text="None"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="serverlb1" runat="server" Text="Server"></asp:Label></td>
						<td class="text-left"><asp:Label ID="serverlb2" runat="server" Text="None"></asp:Label></td>
						</tr>
						<tr><td class="text-left"><asp:Label ID="orderdescriptionlb1" runat="server" Text="Task"></asp:Label></td>
							<td class="text-left"><asp:Label ID="orderdescriptionlb2" runat="server" Text="-"></asp:Label><br />
							<div class="div-descinfo"><div class="div-duoqueue"><asp:Label ID="queuelb" runat="server" Text="Queue"></asp:Label></div><div class="div-soloflex"><asp:Label ID="rankedlb" runat="server" Text="Queue"></asp:Label></div></div></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="cashoutlb1" runat="server" Text="Cashout"></asp:Label></td>
						<td class="text-left"><asp:Label ID="cashoutlb2" runat="server" Text="-"></asp:Label></td>
						</tr>
						
					</tbody></table>
		</div>

		<div class="oaccountinfodiv">
			<div class="indextitlesdivs">Account Information</div>
			<table class="table-fill">
					<tbody class="table-hover">
						<tr>
						<td class="text-left"><asp:Label ID="accnamelb1" runat="server" Text="Account name"></asp:Label></td>
						<td class="text-left"><asp:Label ID="accnamelb2" runat="server" Text="None"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="passlb1" runat="server" Text="Password"></asp:Label></td>
						<td class="text-left"><asp:Label ID="passlb2" runat="server" Text="None"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="sumnamelb1" runat="server" Text="Summoner name"></asp:Label></td>
						<td class="text-left"><asp:Label ID="sumnamelb2" runat="server" Text="-"></asp:Label></td>
						</tr>
						<tr>
						<td class="text-left"><asp:Label ID="sumidlb1" runat="server" Text="Summoner ID"></asp:Label></td>
						<td class="text-left"><asp:Label ID="sumidlb2" runat="server" Text="-"></asp:Label></td>
						</tr>
					</tbody></table>
		</div>
		</div> 

		<div class="centerdiv">
		<div class="progressdiv">
		   <div class="progress-icons">
			<div class="progressdivstart">
				<div class="mb30"><asp:Label ID="Label1" runat="server" Text="Start" Font-Size="30px" Font-Bold="True"></asp:Label></div>
				<asp:Image ID="img_progressdivstart" runat="server" />
				<div class="divisiontext"><asp:Label ID="label_progressdivstart" runat="server" Text="Label" Font-Size="22px" Font-Bold="True"></asp:Label></div>
			</div>
			<div class="progressdivcurrent">
				<div class="mb30"><asp:Label ID="Label2" runat="server" Text="Current" Font-Size="30px" Font-Bold="True"></asp:Label></div>
				<asp:Label ID="currentplacementlb" runat="server" Text="Label" Visible="False" Font-Size="140px"></asp:Label>
				<asp:Image ID="img_progressdivcurrent" runat="server" />
				<div class="divisiontext"><asp:Label ID="label_progressdivcurrent1" runat="server" Text="Label" Font-Size="20px" Font-Bold="True">
					</asp:Label><asp:Label ID="label_progressdivcurrent2" runat="server" Text="Label" Font-Size="20px" Font-Bold="True"></asp:Label><br />
					<asp:Label ID="label_progressdivcurrent3" runat="server" Text="Label" Font-Size="20px" Font-Bold="True"></asp:Label></div>
			</div>
			<div class="progressdivdesired">
				<div class="mb30"><asp:Label ID="Label3" runat="server" Text="Desired" Font-Size="30px" Font-Bold="True"></asp:Label></div>
				<asp:Label ID="desiredplacementlb" runat="server" Text="Label" Visible="False" Font-Size="140px"></asp:Label>
				<asp:Image ID="img_progressdivdesired" runat="server" />
				<div class="divisiontext"><asp:Label ID="label_progressdivdesired" runat="server" Text="Desired Games" Height="70px" Font-Size="20px" Font-Bold="True"></asp:Label></div>
			</div><br />
		   </div>
			<div class="progressbar-div">
			  <div id="progressdivid" runat="server" class="progress-bar progress-bar-striped active"  role="progressbar" style="height:20px;">
				  <asp:Label ID="progressbartext" runat="server" Text="progressbartext"></asp:Label>
			  </div>
			</div>
		 </div>
		</div>
		   



		<div class="rightdiv">
	 <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --%>
		  <div class="chatbox">
	  <asp:Timer ID="Timer2" OnTick="Timer2_Tick" runat="server" Interval="2000" />
		<div id="chatlogs" class="chatlogs">
			<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<asp:UpdatePanel ID="Chatupdatepanel" runat="server" UpdateMode="Conditional">
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="Timer2" />
			<asp:AsyncPostBackTrigger ControlID="btn_sendmsg" />
		</Triggers>
		<ContentTemplate>
			
			   <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
			  
		</ContentTemplate>
		</asp:UpdatePanel>

		</div>
		  <div class="chat-form">
			  
			  <asp:TextBox id="txtsend" runat="server" class="chat-formtextbox" cols="20" rows="2" placeholder = "Enter your message"></asp:TextBox>

				<asp:Button ID="btn_sendmsg" runat="server" class="chat-formbutton" UseSubmitBehavior="true" OnClick="btn_sendmsg_Click" Text="SEND"/>
		  </div>
		</div>

	  <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --%>

			</div>
</div>



	</form>
</body>
</html>
