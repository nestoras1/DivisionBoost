<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckoutError.aspx.cs" Inherits="Checkout_CheckoutError" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" type="image/x-icon" href="https://divisionboost.eu/images/DBLogo.ico"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <div id="Errorcode" class="text-danger">        
  Error Code:<%=Request.QueryString.Get("ErrorCode")%><br/>
  <%=Request.QueryString.Get("Desc")%><br/>
  <%=Request.QueryString.Get("Desc2")%>            
</div>

    </div>
    </form>
</body>
</html>
