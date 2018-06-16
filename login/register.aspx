<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="login_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
  <title> Register - DivisionBoost.eu - League of Legends Elo Boost & Coaching service!</title>
          <meta charset="utf-8"/>
          <meta content="width=device-width, initial-scale=1" name="viewport"/>
          <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
          <meta name="description" content="Elo League Boosting service for League of Legends. Available on Europe West, Europe Nordic & East. We are provide fast services and all of the players working with us are hand-picked Master and Challenger players">
          <meta name="keywords" content="elo boost, elo boosting, lol boost, lol elo, elo, boosting, boost, league of legends, lol, cheap elo, league points, lol tier, lol division, league boosting, mmr boosting">
        <meta content="Divisionboost" name="author"/>
    <meta property="og:site_name" content="DivisionBoost.eu">
      <meta property="og:description" content="Register - Elo Boosting - League of Legends" />
      <meta property="og:url" content="https://divisionboost.eu/" />
      <meta property="og:title" content="Register - DivisionBoost" />
      <meta property="og:image" content="https://divisionboost.eu/img/fb_img_share.jpg" />
      <meta property="fb:app_id" content="1504158542989599" />
      <meta name="google-site-verification" content="4Pf_YnTUTtEop0W9tP5nahaEi_Upf0CFLimuu5aQw3o" />
      <link rel="icon" type="image/x-icon" href="https://divisionboost.eu/img/DBLogo.ico"/>
    <meta name="norton-safeweb-site-verification" content="5z5ahv9wknr1st178ukw0h2gd7sdv0-xs0pkqp3algylbe-nkp6ty20fr1zx2s0uzewif8mbrk3q2s2edpp7gj3oi-f09r1vmen66xysfosnjqzar2bjcxc7v8pl989t" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
  <div class="info">
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="img/user-icon.png"/></div>
    <form id="form1" runat="server">
    <h1 style="color:white;">Create Account</h1><br />
        <asp:TextBox ID="regusertb" CssClass="text1" runat="server" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="regpasstb" CssClass="text1" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="regpass2tb" CssClass="text1" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="regemailtb" CssClass="text1" runat="server" placeholder="Email Address"></asp:TextBox>
        <asp:Button ID="bt_register" CssClass="button1" runat="server" Text="Create" OnClick="Button1_Click" /><br /><br />
    <asp:Label ID="regerror_message_lb" runat="server" Text="" Font-Bold="True" Font-Size="15" ForeColor="Red"></asp:Label><br />
    <p class="message">Already registered? <a href="login.aspx">Sign In</a></p>
        

    </form>

     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>
</body>
</html>
