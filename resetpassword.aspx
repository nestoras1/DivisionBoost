<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resetpassword.aspx.cs" Inherits="resetpassword" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DivisionBoost - Reset Password</title>
    <link rel="icon" type="image/x-icon" href="https://divisionboost.eu/images/DBLogo.ico"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>DivisionBoost</h1>
        <h2>Reset Password</h2>
        <div style="width:120px;">
        <asp:Label ID="Label1" runat="server" Text="New Password "></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="confirm Password "></asp:Label>
        </div>
        <div style="width:100px;margin-top:-42px;margin-left:120px;">
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="Reset" OnClick="Button1_Click" /><br />
        <asp:Label ID="errormsglb" runat="server" Text="" Font-Bold="True" ForeColor="Red" Font-Size="20"></asp:Label>

    </div>
    </form>
</body>
</html>
