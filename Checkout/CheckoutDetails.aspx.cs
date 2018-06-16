using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Checkout_CheckoutDetails : System.Web.UI.Page
{
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=pass;";
    StringBuilder table = new StringBuilder();
    double temp = 0.0;
    public static double newprice = 0.0;
    public static bool couponok = false;
    public static string couponstr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string script = "$(document).ready(function () { $('[id*=couponbt]').click(); });";
            ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
        }
        if (Session["user"] != null)
        {

        }
        else
        {
            Response.Redirect("../Index.aspx");
        }


            table.Append("<table class=\"table-fill\">");
        table.Append("<thead><tr><th class=\"text-left\">Customer UserName</th><th class=\"text-left\">Description</th><th class=\"text-left\">Price</th></tr></thead><tbody class=\"table-hover\">");
        table.Append("<tr><td class=\"text-left\">" + Session["user"].ToString() + "</td><td class=\"text-left\">" + Session["item_name"].ToString() + "</td><td class=\"text-left\">" + Session["payment_amt"].ToString() + "&euro;</td></tr>");
        table.Append("</tbody></table>");
        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
        couponok = false;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }

    protected void couponbt_Click(object sender, EventArgs e)
    {
        if (couponok == false) { 
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            DataTable dt1 = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            if (couponbt.Text.Trim() != "")
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT CouponDiscount FROM `coupons` WHERE CouponName=@coupontext;", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@coupontext", coupontb.Text.Trim());
                    da.SelectCommand = cmd;
                
                
                    da.Fill(dt1);
                    con.Close();
                    if (dt1.Rows[0][0].ToString() != "")
                    {
                        temp = Convert.ToDouble(Session["payment_amt"].ToString()) * Int32.Parse(dt1.Rows[0][0].ToString()) / 100;
                        newprice = Convert.ToDouble(Session["payment_amt"].ToString()) - temp;
                        table.Clear();
                        PlaceHolder1.Controls.Clear();
                        table.Append("<table class=\"table-fill\">");
                        table.Append("<thead><tr><th class=\"text-left\">Customer UserName</th><th class=\"text-left\">Description</th><th class=\"text-left\">Price</th></tr></thead><tbody class=\"table-hover\">");
                        table.Append("<tr><td class=\"text-left\">" + Session["user"].ToString() + "</td><td class=\"text-left\">" + Session["item_name"].ToString() + "</td><td class=\"text-left\">" + newprice + "&euro;</td></tr>");
                        table.Append("</tbody></table>");
                        couponok = true;
                        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
                        couponstr = "Coupon Code:" + coupontb.Text;
                        couponoklb.Text = "Coupon OK!";
                        couponerrorlb.Text = "";
                    }
                }
                catch
                {
                    couponstr = "";
                    couponoklb.Text = "";
                    couponerrorlb.Text = "Invalid Coupon!";
                }
            }
        }
        else
        {
            couponstr = "";
            couponoklb.Text = "";
            couponerrorlb.Text = "You can use only one coupon!";
        }
    }

    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        Session["new_item_name"] = Session["item_name"] + " | " + couponstr;
        if (newprice <= 2)
        {
            Session["new_payment_amt"] = Session["payment_amt"];
        }
        else
        {
            Session["new_payment_amt"] = newprice;
        }
        Response.Redirect("~/Checkout/CheckoutStart.aspx");
    }
}