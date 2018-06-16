using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class booster_orderbid : System.Web.UI.Page
{
    static String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=username;Pwd=password;";
    public DataTable datat1 = new DataTable();
    public DataTable datat2 = new DataTable();
    public DataTable datat3 = new DataTable();
    public DataTable datat4 = new DataTable();
    object obj;
    DateTime currentTime = DateTime.Now;
    string counttime = "60";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (Session["account_type"].ToString() == "True")
            {
                Response.Cookies["bidflagstart"].Value = "false";
                filldatatable();
                fillnavbar();
                setorderinfo();
                

                if (Int32.Parse(datat1.Rows[0][19].ToString()) != 0)
                {
                    Response.Redirect("index.aspx");
                }
                //if (!IsPostBack)
                //{
                if (datat1.Rows[0][29].ToString() != "")
                {
                    if ((Convert.ToDateTime(datat1.Rows[0][29].ToString()) - DateTime.Now) > TimeSpan.Zero)
                    {
                        counttime = (Convert.ToDateTime(datat1.Rows[0][29].ToString()) - DateTime.Now).ToString("ss");
                        string script = "var count = " + counttime + "; var counter = setInterval(timer, 1000); function timer() {count = count - 1; if (count <= 0) {clearInterval(counter); document.getElementById(\"demo\").innerHTML = \"0 secs\";  return; }  document.getElementById(\"demo\").innerHTML = count + \" sec\";  } ";
                        ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                        Response.Cookies["bidflagstart"].Value = "true";
                    }
                    else
                    {
                        string script = " document.getElementById(\"demo\").innerHTML = \"0 sec\";  } ";
                        ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                        bidbt.Enabled = false;
                        bidbt.Visible = false;
                        Response.Cookies["bidflagstart"].Value = "true";
                    }
                }

                //}
                if (IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("../customer/Index.aspx");
            }
        }
        else
        {
            Response.Redirect("../Index.aspx");
        }

    }

    void filldatatable()
    {
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT c.accountid, c.division, c.solorank, c.duorank, c.balanceeuro, c.balancepreordereuro, c.balanceusd, c.balancepreorderusd, c.balancegbp, c.balancepreordergbp, b.OrderStartLeague, b.OrderStartDivision, b.OrderStartLp, b.SoloFlex, b.NoDuoOrDuo, b.OrderEndLeague, b.OrderEndDivision, b.GamesNumber, b.OrderStatus, b.OrderStartYesOrNo, b.ServerName, b.OrderType, b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.OrderDate, b.accountid, b.BidEndDate FROM `booster` as `c`, `orderprogress` as `b` WHERE c.accountid ='" + Session["id"] + "' and b.idOrderProgress = '" + Session["boosterorder"] + "';", con);
        sda1.Fill(datat1);
        con.Close();
    }

    static MySqlConnection openconnection()
    {
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        return con;
    }

    void fillnavbar()
    {
        label_solo_rank1.Text = "";
        label_solo_rank2.Text = "";
        label_duo_rank1.Text = "";
        label_duo_rank2.Text = "";
        //label_solo_rank2.Text = booster_accepted_rank(int.Parse(datat1.Rows[0][2].ToString()));
        //label_duo_rank2.Text = booster_accepted_rank(int.Parse(datat1.Rows[0][3].ToString()));
        label_balance2.Text = datat1.Rows[0][4].ToString() + " (" + datat1.Rows[0][5].ToString() + ") EUR / " + datat1.Rows[0][6].ToString() + " (" + datat1.Rows[0][7].ToString();
        label_balance2.Text += ") USD / " + datat1.Rows[0][8].ToString() + " (" + datat1.Rows[0][9].ToString() + ") GBP";
    }

    String booster_accepted_rank(int i)
    {
        String str = "";
        switch (i)
        {
            case 0:
                str = "P5";
                break;
            case 1:
                str = "P4";
                break;
            case 2:
                str = "P3";
                break;
            case 3:
                str = "P2";
                break;
            case 4:
                str = "P1";
                break;
            case 5:
                str = "D5";
                break;
            case 6:
                str = "D4";
                break;
            case 7:
                str = "D3";
                break;
            case 8:
                str = "D2";
                break;
            case 9:
                str = "D1";
                break;
            case 10:
                str = "M";
                break;
        }
        return str;
    }

    String getcurrency(string i)
    {
        String str = "";
        switch (i)
        {
            case "0":
                str = "EURO";
                break;
            case "1":
                str = "USD";
                break;
            case "2":
                str = "GBP";
                break;
        }
        return str;
    }

    String getserver(string i)
    {
        String str = "";
        
            switch (i)
            {
                case "0":
                    str = "EUW";
                    break;
                case "1":
                    str = "EUNE";
                    break;
                case "2":
                    str = "NA";
                    break;
                case "3":
                    str = "OCE";
                    break;
            }
            return str;
    }

    String getDuoNoDuo(string i)
    {
        String str = "";

        switch (i)
        {
            case "0":
                str = "No Duo";
                break;
            case "1":
                str = "Duo";
                break;
        }
        return str;
    }

    String getSoloFlex(string i)
    {
        String str = "";

        switch (i)
        {
            case "0":
                str = "Solo";
                break;
            case "1":
                str = "Flex";
                break;
        }
        return str;
    }

    void setorderinfo()
    {
        ordernamelb.Text = Session["boosterorder"].ToString();
        if (Int32.Parse(datat1.Rows[0][21].ToString()) == 0)
        {
            orderdescriptionlb2.Text = datat1.Rows[0][10].ToString() + " " + datat1.Rows[0][11].ToString() + " " + datat1.Rows[0][12].ToString() + " - " + datat1.Rows[0][15].ToString() + " " + datat1.Rows[0][16].ToString();
        }
        else if (Int32.Parse(datat1.Rows[0][21].ToString()) == 1)
        {
            orderdescriptionlb2.Text = datat1.Rows[0][10].ToString() + " - " + datat1.Rows[0][17].ToString() + " Placement Games";
        } else
        {
            orderdescriptionlb2.Text = datat1.Rows[0][10].ToString() + " " + datat1.Rows[0][11].ToString() + " - " + datat1.Rows[0][17].ToString() + " Win Games";
        }
        queuelb.Text = getDuoNoDuo(datat1.Rows[0][14].ToString()) + " Queue";
        rankedlb.Text = "Ranked " + getSoloFlex(datat1.Rows[0][13].ToString());
        startingcashoutlb2.Text = datat1.Rows[0][23].ToString() + " " + getcurrency(datat1.Rows[0][25].ToString());
        minbidlb2.Text = datat1.Rows[0][24].ToString() + " " + getcurrency(datat1.Rows[0][25].ToString());
        serverlb2.Text = getserver(datat1.Rows[0][20].ToString());

        if(Int32.Parse(datat1.Rows[0][26].ToString()) <= Int32.Parse(datat1.Rows[0][23].ToString()))
        {
            currentbidlb.Text = datat1.Rows[0][26].ToString();
        }
        bidtb.Text = (Int32.Parse(datat1.Rows[0][26].ToString()) - 1).ToString();
    }

    void addanewbid()
    {
        try
        {
            if((Int32.Parse(bidtb.Text) == Int32.Parse(datat1.Rows[0][23].ToString())) || (datat1.Rows[0][29].ToString() == ""))
                {
                
                MySqlConnection con = openconnection();
                MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderBid` = @orderbid, `IdBoosterForOrder` = @IdBoosterForOrder, `BidEndDate` = @BidEndDate WHERE `idOrderProgress` = '" + Session["boosterorder"] + "';", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@orderbid", Int32.Parse(bidtb.Text));
                cmd.Parameters.AddWithValue("@IdBoosterForOrder", Session["id"]);
                double BidTimeMin = 1;
                cmd.Parameters.AddWithValue("@BidEndDate", DateTime.ParseExact(currentTime.AddMinutes(BidTimeMin).ToString("dd-MM-yyyy HH:mm:ss"), "dd-MM-yyyy HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture));
                //cmd.Parameters.AddWithValue("@BidEndDate", DateTime.ParseExact(currentTime.AddMinutes(BidTimeMin).ToString("yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture));
                cmd.ExecuteScalar();
                con.Close();

            }
            else
            {
                MySqlConnection con = openconnection();
                MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderBid` = @orderbid, `IdBoosterForOrder` = @IdBoosterForOrder WHERE `idOrderProgress` = '" + Session["boosterorder"] + "';", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@orderbid", Int32.Parse(bidtb.Text));
                cmd.Parameters.AddWithValue("@IdBoosterForOrder", Session["id"]);
                cmd.ExecuteScalar();
                con.Close();
            }
        }
        catch
        {
            errorbidlb.Text = "Something gone wrong. Please bid again!";
        }
    }


    void endbid(int amount)
    {
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT b.OrderStartYesOrNo FROM `orderprogress` as `b` WHERE b.idOrderProgress = '" + Session["boosterorder"] + "';", con);
        sda1.Fill(datat4);
        if (datat4.Rows[0][0].ToString() == "0")
        {
            MySqlCommand cmd1 = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStartYesOrNo` = @OrderStartYesOrNo, `OrderStatus` = @OrderStatus, `IdBoosterForOrder` = @IdBoosterForOrder WHERE `idOrderProgress` = '" + Session["boosterorder"] + "';", con);
            cmd1.CommandType = CommandType.Text;

            cmd1.Parameters.AddWithValue("@OrderStartYesOrNo", 1);
            cmd1.Parameters.AddWithValue("@OrderStatus", 1);
            cmd1.Parameters.AddWithValue("@IdBoosterForOrder", Session["id"]);
            cmd1.ExecuteScalar();

            MySqlCommand cmd2 = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `user2chatid` = @user2chatid WHERE `id` = '" + Session["id"] + "';", con);
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.AddWithValue("@user2chatid", Int32.Parse(datat1.Rows[0][28].ToString()));

            MySqlCommand cmd3 = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `user2chatid` = @user2chatid WHERE `id` = '" + Int32.Parse(datat1.Rows[0][28].ToString()) + "';", con);
            cmd3.CommandType = CommandType.Text;
            cmd3.Parameters.AddWithValue("@user2chatid", Session["id"]);

            MySqlCommand cmd4;
            switch (datat1.Rows[0][28].ToString())
            {
                case "0":
                    cmd4 = new MySqlCommand("UPDATE `db_divisionboost`.`booster` SET `balancepreordereuro` = @balancepreorder WHERE `accountid` = '" + Session["id"] + "';", con);
                    break;
                case "1":
                    cmd4 = new MySqlCommand("UPDATE `db_divisionboost`.`booster` SET `balancepreorderusd` = @balancepreorder WHERE `accountid` = '" + Session["id"] + "';", con);
                    break;
                case "2":
                    cmd4 = new MySqlCommand("UPDATE `db_divisionboost`.`booster` SET `balancepreordergbp` = @balancepreorder WHERE `accountid` = '" + Session["id"] + "';", con);
                    break;
                default:
                    cmd4 = new MySqlCommand("UPDATE `db_divisionboost`.`booster` SET `balancepreordereuro` = @balancepreorder WHERE `accountid` = '" + Session["id"] + "';", con);
                    break;
            }
            cmd4.CommandType = CommandType.Text;
            cmd4.Parameters.AddWithValue("@balancepreorder", amount);


            cmd2.ExecuteScalar();
            cmd3.ExecuteScalar();
            cmd4.ExecuteScalar();
            con.Close();
            winnerbooster.Text = "You take the order!";
        }
    }


    protected void bidbt_Click(object sender, EventArgs e)
    {
        winnerbooster.Text = "";
        errorbidlb.Text = "";
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.OrderDate FROM `orderprogress` as `b` WHERE b.idOrderProgress = '" + Session["boosterorder"] + "';", con);
        sda1.Fill(datat2);
        con.Close();
        if (Int32.Parse(datat2.Rows[0][4].ToString()) > Int32.Parse(bidtb.Text))
        {
            if (Int32.Parse(bidtb.Text) > Int32.Parse(datat2.Rows[0][2].ToString())) {
                addanewbid();
                currentbidlb.Text = bidtb.Text.ToString();
                winnerbooster.Text = "Your Bid win";
                winnerbooster.ForeColor = System.Drawing.Color.Green;
                bidtb.Text = (Int32.Parse(bidtb.Text) - 1).ToString();
                if (Response.Cookies["bidflagstart"].Value == "false")
                {
                    Response.Redirect("bid.aspx");
                }
            }
            else if(Int32.Parse(bidtb.Text) == Int32.Parse(datat2.Rows[0][2].ToString()))
            {
                addanewbid();
                endbid(Int32.Parse(bidtb.Text));

            }
            else
            {
                errorbidlb.Text = "Your Bid is too low!";
            }
        }
        else
        {
            errorbidlb.Text = "Please give another bid!";
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT b.accountid, b.OrderStatus, b.OrderStartYesOrNo, b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.BidEndDate FROM `orderprogress` as `b` WHERE b.idOrderProgress = '" + Session["boosterorder"] + "';", con);
        sda1.Fill(datat3);
        con.Close();


        if (datat3.Rows[0][8].ToString() != "")
        {
            
            if (DateTime.Now <= Convert.ToDateTime(datat3.Rows[0][8].ToString()))
            {
                if (Int32.Parse(datat3.Rows[0][3].ToString()) == Int32.Parse(Session["id"].ToString()))
                {
                    winnerbooster.Text = "Your Bid win";
                    winnerbooster.ForeColor = System.Drawing.Color.Green;
                    currentbidlb2.Text = " " + getcurrency(datat3.Rows[0][6].ToString());
                }
                else
                {
                    if (Response.Cookies["bidflagstart"].Value == "false")
                    {
                        Response.Redirect("bid.aspx");
                    }
                    winnerbooster.Text = "Another Bid Wins";
                    winnerbooster.ForeColor = System.Drawing.Color.Red;
                    currentbidlb2.Text = " " + getcurrency(datat3.Rows[0][6].ToString());
                }
            }
            else
            {
                if (Int32.Parse(datat3.Rows[0][3].ToString()) == Int32.Parse(Session["id"].ToString()))
                {
                    endbid(Int32.Parse(datat3.Rows[0][7].ToString()));
                }
                winnerbooster.Text = "Bid End";
                Response.Redirect("index.aspx");
                bidbt.Enabled = false;
                bidbt.Visible = false;
            }
        }
        else
        {
            winnerbooster.Text = "Bid Ready to Start!!";
            Response.Cookies["bidflagstart"].Value = "false";


        }


    }



}