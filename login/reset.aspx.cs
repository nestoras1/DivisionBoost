using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void bt_reset_Click(object sender, EventArgs e)
    {
        AccountManager.forgotpassword(forgotusertb.Text.Trim());
    }
}