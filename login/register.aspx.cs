using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        AccountManager.registerAccount(regusertb.Text.Trim(), regemailtb.Text.Trim(), regpasstb.Text.Trim(), regpass2tb.Text.Trim());
        regerror_message_lb.Text = AccountManager.returnregerror();
        if (regerror_message_lb.Text == "")
        {
            Response.Redirect("../index.aspx");
        }
        regemailtb.Text = "";
        regpasstb.Text = "";
        regpass2tb.Text = "";
    }
}