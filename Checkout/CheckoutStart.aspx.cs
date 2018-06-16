using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout_CheckoutStart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NVPAPICaller payPalCaller = new NVPAPICaller();
        string retMsg = "";
        string token = "";

        if ((Session["new_payment_amt"] != null) && (Session["currency_code"] != null))
        {
            string amt = Session["new_payment_amt"].ToString();
            string currency_code = Session["currency_code"].ToString();
            string brandname = Session["BRANDNAME"].ToString();
            string email = Session["EMAIL"].ToString();
            string itemname = Session["new_item_name"].ToString();
            bool ret = payPalCaller.ShortcutExpressCheckout(amt, currency_code, brandname, itemname, email, ref token, ref retMsg);
            if (ret)
            {
                Session["token"] = token;
                Response.Redirect(retMsg);
            }
            else
            {
                Response.Redirect("CheckoutError.aspx?" + retMsg);
            }
        }
        else
        {
            Response.Redirect("CheckoutError.aspx?ErrorCode=AmtMissing");
        }

    }
}