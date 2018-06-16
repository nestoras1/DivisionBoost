using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Net;

public partial class Checkout_CheckoutComplete : System.Web.UI.Page
{
    static String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=pass;";
    public DataTable datat1 = new DataTable();
    object max_id;
    object obj;
    string PaymentConfirmation = "";
    DataTable dt = new DataTable();
    static MySqlConnection con = new MySqlConnection(connectionString);
    double BoosterCashout = 0;
    double BoosterMinCashout = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        BoosterCashout = double.Parse(Session["new_payment_amt"].ToString(), System.Globalization.CultureInfo.InvariantCulture) * 0.8;
        BoosterMinCashout = double.Parse(Session["new_payment_amt"].ToString(), System.Globalization.CultureInfo.InvariantCulture) * 0.6;
        if (!IsPostBack)
        {
            checkforopenorder();
            VerifyPayment();
            InsertNewOrder();
            
        }
    }
    private static Random random = new Random();
    public static string RandomStringInt(int length)
    {
        const string chars = "0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    private static Random random1 = new Random();
    public static string RandomStringStr(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random1.Next(s.Length)]).ToArray());
    }

    void InsertNewOrder()
    {
        
        InserPaymentOrdersTable();
        InserOrderProgressTable();
        deletesumnamefrompreorder();
        con.Close();
        sendcompletemail();

    }

    void checkforopenorder()
    {
        con.Close();
        con.Open();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT COUNT(*) FROM `orderprogress` as `b` WHERE b.accountid ='" + Session["id"] + "' and (b.OrderStatus = '0' or b.OrderStatus = '1');", con);
        sda1.Fill(datat1);
        
        if (datat1.Rows[0][0].ToString() != "0")
        {
            Response.Redirect("../../Checkout/errordouble.aspx");
        }
    }

    void deletesumnamefrompreorder()
    {      
        MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `game_summonername` = @game_summonername WHERE `id` = '" + Session["id"] + "';", con);
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@game_summonername", null);
        cmd.Connection = con;
        cmd.ExecuteNonQuery();


    }

    void InserPaymentOrdersTable()
    {
        try
        {
            MySqlCommand command1 = con.CreateCommand();
            command1.CommandText = "INSERT INTO paymentsorders (id,userID,usernamepayer,transactionID,description,amount,paymentDate) VALUES (?id,?userID,?usernamepayer,?transactionID,?description,?amount,?paymentDate)";
            command1.Parameters.AddWithValue("?id", Convert.ToInt32(RandomStringInt(6)));
            command1.Parameters.AddWithValue("?userID", Convert.ToInt32(Session["id"].ToString()));
            command1.Parameters.AddWithValue("?usernamepayer", Session["user"].ToString());
            command1.Parameters.AddWithValue("?transactionID", PaymentConfirmation);
            command1.Parameters.AddWithValue("?description", Session["item_name"].ToString());
            command1.Parameters.AddWithValue("?amount", Session["payment_amt"].ToString());
            command1.Parameters.AddWithValue("?paymentDate", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            command1.ExecuteNonQuery();
        }
        catch
        {
            InserPaymentOrdersTable();
        }
    }

    void InserOrderProgressTable()
    {
        try
        {
            MySqlCommand command2 = con.CreateCommand();
            command2.CommandText = "INSERT INTO orderprogress (accountid,idOrderProgress,OrderStartLeague,OrderStartDivision,OrderStartLp,OrderEndLeague,OrderEndDivision,GamesNumber,SoloFlex,NoDuoOrDuo,ServerName,OrderType,OrderCashout,OrderMinCashout,OrderCurrency,OrderBid,OrderDate) VALUES (?accountid,?idOrderProgress,?OrderStartLeague,?OrderStartDivision,?OrderStartLp,?OrderEndLeague,?OrderEndDivision,?GamesNumber,?SoloFlex,?NoDuoOrDuo,?ServerName,?OrderType,?OrderCashout,?OrderMinCashout,?OrderCurrency,?OrderBid,?OrderDate)";
            command2.Parameters.AddWithValue("?accountid", Convert.ToInt32(Session["id"].ToString()));
            command2.Parameters.AddWithValue("?idOrderProgress", RandomStringStr(5));
            command2.Parameters.AddWithValue("?OrderStartLeague", Session["StartLeague"].ToString());
            command2.Parameters.AddWithValue("?OrderStartDivision", Session["StartDivision"].ToString());
            command2.Parameters.AddWithValue("?OrderStartLp", Session["StartLp"].ToString());
            command2.Parameters.AddWithValue("?OrderEndLeague", Session["EndLeague"].ToString());
            command2.Parameters.AddWithValue("?OrderEndDivision", Session["EndDivision"].ToString());
            command2.Parameters.AddWithValue("?GamesNumber", Session["GamesNumber"].ToString());
            command2.Parameters.AddWithValue("?SoloFlex", Convert.ToInt32(Session["SoloFlex"].ToString()));
            command2.Parameters.AddWithValue("?NoDuoOrDuo", Convert.ToInt32(Session["DuoNoDuo"].ToString()));
            command2.Parameters.AddWithValue("?ServerName", Convert.ToInt32(Session["ServerName"].ToString()));
            command2.Parameters.AddWithValue("?OrderType", Convert.ToInt32(Session["OrderType"].ToString()));
            command2.Parameters.AddWithValue("?OrderCashout", Convert.ToInt32(BoosterCashout));
            command2.Parameters.AddWithValue("?OrderMinCashout", Convert.ToInt32(BoosterMinCashout)); 
            command2.Parameters.AddWithValue("?OrderCurrency", 0);
            command2.Parameters.AddWithValue("?OrderBid", Convert.ToInt32(BoosterCashout+1));
            command2.Parameters.AddWithValue("?OrderDate", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            command2.ExecuteNonQuery();            
        }
        catch
        {
            InserOrderProgressTable();
        }
    }

    void sendcompletemail()
    {
        try
        {
            using (MailMessage mm = new MailMessage("info@divisionboost.eu", Session["email"].ToString()))
            {
                mm.Subject = "DivisionBoost Payment Confirmation";
                string body = "<img src=\"https://divisionboost.eu/images/DBLogo.png \" height=\"55px\" width=\"53px\"></img> </br>Dear " + Session["user"].ToString() + ",";
                body += "<br /><br />Thank you for your payment of " + Session["new_payment_amt"].ToString() + " Euro. Now our boosters take care your League Of Legend account!</br>";
                body += "<br />Before that, you need to login on your Dashboard and fill Username, Summoner Name and your game Password. After that you are ready! <br /><br />";
                body += "-------------------------------- <br />";
                body += "<b>Payment Info</b>  <br />TransactionID: <b>" + PaymentConfirmation + "</b> <br />Amount: <b>" + Session["new_payment_amt"].ToString() + " Euro</b> <br />Description: <b>" + Session["item_name"].ToString() + "</b><br />";
                body += "<br />Please don't hesitate to get in contact with us via LiveChat or at support@divisionboost.eu, even if it's just to say Hi! </br></br></br></br>";
                body += "<h3><b>Have a great day,</b></h3>The DivisionBoost Team";
                
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "webmail.divisionboost.eu";
                smtp.EnableSsl = false;
                NetworkCredential NetworkCred = new NetworkCredential("info@divisionboost.eu", "pass");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;
                smtp.Send(mm);
            }
        }
        catch
        {

        }
    }


    public void VerifyPayment()
    {
        NVPAPICaller payPalCaller = new NVPAPICaller();
        string retMsg = "";
        string token = "";
        string PayerID = "";
        NVPCodec decoder = new NVPCodec();
        token = Session["token"].ToString();
        string currency_code = Session["currency_code"].ToString();
        bool ret = payPalCaller.GetCheckoutDetails(token, ref PayerID, ref decoder, ref retMsg);
        if (ret)
        {
            // Verify total payment amount as set on CheckoutStart.aspx.
            try
            {
                decimal paymentAmountOnCheckout = Convert.ToDecimal(Session["new_payment_amt"].ToString());
                decimal paymentAmoutFromPayPal = Convert.ToDecimal(decoder["AMT"].ToString());
                if (paymentAmountOnCheckout != paymentAmoutFromPayPal)
                {
                    Response.Redirect("CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
                }
            }
            catch (Exception)
            {
                Response.Redirect("CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
            }

        }
        string finalPaymentAmount = Session["new_payment_amt"].ToString();
        bool res = payPalCaller.DoCheckoutPayment(finalPaymentAmount, currency_code, token, PayerID, ref decoder, ref retMsg);
        if (res)
        {
            // Retrieve PayPal confirmation value.
            PaymentConfirmation = decoder["PAYMENTINFO_0_TRANSACTIONID"].ToString();
            TransactionId.Text = " " + PaymentConfirmation;
            amountlb.Text = " " + Session["new_payment_amt"].ToString();
            descriptionlb.Text = " " + Session["new_item_name"].ToString();
        }
        else
        {
            Response.Redirect("CheckoutError.aspx?" + retMsg);
        }
    }
}