using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class booster_index : System.Web.UI.Page
{
    static String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=password;";
    public DataTable datat1 = new DataTable();
    public DataTable datat2 = new DataTable();
    public DataTable datat3 = new DataTable();
    StringBuilder table = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (Session["account_type"].ToString() == "True")
            {
                filldatatable();
                fillnavbar();
                fillboosterorder();
                if (!IsPostBack)
                {
                    table.Clear();
                    table.Append("<table class=\"table-fill\">");
                    table.Append("<thead><tr><th class=\"text-left\">ID</th><th class=\"text-left\">Server</th><th class=\"text-left\">Description</th><th class=\"text-left\">Amount</th><th class=\"text-left\">Cashout</th></tr></thead><tbody class=\"table-hover\">");
                    table.Append("</tbody></table>");
                    PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });

                    
                }
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
        try
        {
            MySqlConnection con = openconnection();
            MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT c.accountid, c.division, c.solorank, c.duorank, c.balanceeuro, c.balancepreordereuro, c.balanceusd, c.balancepreorderusd, c.balancegbp, c.balancepreordergbp FROM `booster` as `c` WHERE c.accountid ='" + Session["id"] + "';", con);
            sda1.Fill(datat1);
            con.Close();
        }
        catch {
            Response.Redirect("../booster/index.aspx");
        }
    }

    static MySqlConnection openconnection()
    {
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        return con;
    }

    void fillboosterorder()
    {
        try
        {
            string duonoduo = "";
            string soloflex = "";
            
            MySqlConnection con = openconnection();
            MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT b.idOrderProgress, b.OrderStartLeague, b.OrderStartDivision, b.OrderStartLp, b.SoloFlex, b.NoDuoOrDuo, b.OrderEndLeague, b.OrderEndDivision, b.OrderStatus, b.ServerName, b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.BidEndDate, b.OrderType, b.GamesNumber FROM `orderprogress` as `b` WHERE b.OrderStartYesOrNo=1 and b.OrderStatus=1 and b.IdBoosterForOrder=" + Session["id"] + ";", con);
            sda1.Fill(datat3);
            con.Close();
            table.Clear();
            
            if (Int32.Parse(datat3.Rows[0][5].ToString()) == 0)
            {
                duonoduo = "No Duo Queue";
            }
            else
            {
                duonoduo = "Duo Queue";
            }
            if (Int32.Parse(datat3.Rows[0][4].ToString()) == 0)
            {
                soloflex = "Solo Ranked";
            }
            else
            {
                soloflex = "Flex Ranked";
            }
            table.Append("<table class=\"table-fill\">");
            table.Append("<thead><tr><th class=\"text-left\">ID</th><th class=\"text-left\">Server</th><th class=\"text-left tabledescriptionwidth\">Description</th><th class=\"text-left\">Amount</th><th class=\"text-left\">Cashout</th></tr></thead><tbody class=\"table-hover\">");
            if (Int32.Parse(datat3.Rows[0][16].ToString()) == 0)
            {
                table.Append("<tr><td class=\"text-left\">" + datat3.Rows[0][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat3.Rows[0][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat3.Rows[0][1].ToString() + " " + datat3.Rows[0][2].ToString() + " - " + datat3.Rows[0][6].ToString() + " " + datat3.Rows[0][7].ToString() + "<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + datat3.Rows[0][14].ToString() + "</td><td class=\"text-left\"><a id=\"" + datat3.Rows[0][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton2', '" + datat3.Rows[0][0].ToString() + "')\" class=\"button-for-checkout\" >View</a></td></tr>");
            }
            else if (Int32.Parse(datat3.Rows[0][16].ToString()) == 1)
            {
                table.Append("<tr><td class=\"text-left\">" + datat3.Rows[0][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat3.Rows[0][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat3.Rows[0][1].ToString() + " - " + datat3.Rows[0][17].ToString() + " Placement Games<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + datat3.Rows[0][14].ToString() + "</td><td class=\"text-left\"><a id=\"" + datat3.Rows[0][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton2', '" + datat3.Rows[0][0].ToString() + "')\" class=\"button-for-checkout\" >View</a></td></tr>");
            }
            else
            {
                table.Append("<tr><td class=\"text-left\">" + datat3.Rows[0][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat3.Rows[0][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat3.Rows[0][1].ToString() + " " + datat3.Rows[0][2].ToString() + " - " + datat3.Rows[0][17].ToString() + " Win Games<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + datat3.Rows[0][14].ToString() + "</td><td class=\"text-left\"><a id=\"" + datat3.Rows[0][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton2', '" + datat3.Rows[0][0].ToString() + "')\" class=\"button-for-checkout\" >View</a></td></tr>");
            }
                table.Append("</tbody></table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
        }
        catch
        {
            table.Clear();
            table.Append("<table class=\"table-fill\">");
            table.Append("<thead><tr><th class=\"text-left\">ID</th><th class=\"text-left\">Server</th><th class=\"text-left tabledescriptionwidth\">Description</th><th class=\"text-left\">Amount</th><th class=\"text-left\">Cashout</th></tr></thead><tbody class=\"table-hover\">");
            table.Append("</tbody></table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        string duonoduo = "";
        string soloflex = "";
        int amounttemp = 0;
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT b.idOrderProgress, b.OrderStartLeague, b.OrderStartDivision, b.OrderStartLp, b.SoloFlex, b.NoDuoOrDuo, b.OrderEndLeague, b.OrderEndDivision, b.OrderStatus, b.ServerName, b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.BidEndDate, b.OrderType, b.GamesNumber FROM `orderprogress` as `b` WHERE b.OrderStartYesOrNo=0 and b.OrderStatus=0;", con);
        sda1.Fill(datat2);
        con.Close();

        table.Clear();
        table.Append("<table class=\"table-fill\">");
        table.Append("<thead><tr><th class=\"text-left\">ID</th><th class=\"text-left\">Server</th><th class=\"text-left tabledescriptionwidth\">Description</th><th class=\"text-left\">Amount</th><th class=\"text-left\">Cashout</th></tr></thead><tbody class=\"table-hover\">");

        for (int i = 0; i < datat2.Rows.Count; i++)
        {
            if(Int32.Parse(datat2.Rows[i][11].ToString()) < Int32.Parse(datat2.Rows[i][14].ToString()))
            {
                amounttemp = Int32.Parse(datat2.Rows[i][11].ToString());
            }
            else
            {
                amounttemp = Int32.Parse(datat2.Rows[i][14].ToString());
            }
            if(datat2.Rows[i][5].ToString() == "0")
            {
                duonoduo = "No Duo Queue";
            }
            else {
                duonoduo = "Duo Queue";
            }
            if (datat2.Rows[i][4].ToString() == "0")
            {
                soloflex = "Solo Ranked";
            }
            else
            {
                soloflex = "Flex Ranked";
            }


            if (Int32.Parse(datat2.Rows[i][16].ToString()) == 0)
            {
                table.Append("<tr><td class=\"text-left\">" + datat2.Rows[i][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat2.Rows[i][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat2.Rows[i][1].ToString() + " " + datat2.Rows[i][2].ToString() + " - " + datat2.Rows[i][6].ToString() + " " + datat2.Rows[i][7].ToString() + "<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + amounttemp + "</td><td class=\"text-left\"><a id=\"" + datat2.Rows[i][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton1', '" + datat2.Rows[i][0].ToString() + "')\" class=\"button-for-checkout\" >Apply</a></td></tr>");
            }else if(Int32.Parse(datat2.Rows[i][16].ToString()) == 1)
            {
                table.Append("<tr><td class=\"text-left\">" + datat2.Rows[i][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat2.Rows[i][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat2.Rows[i][1].ToString() + " - " + datat2.Rows[i][17].ToString() + " Placement Games<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + amounttemp + "</td><td class=\"text-left\"><a id=\"" + datat2.Rows[i][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton1', '" + datat2.Rows[i][0].ToString() + "')\" class=\"button-for-checkout\" >Apply</a></td></tr>");
            }
            else
            {
                table.Append("<tr><td class=\"text-left\">" + datat2.Rows[i][0].ToString() + "</td><td class=\"text-left\">" + setserver(int.Parse(datat2.Rows[i][9].ToString())) + "</td>");
                table.Append("<td class=\"text-left tabledescriptionwidth\">" + datat2.Rows[i][1].ToString() + " " + datat2.Rows[i][2].ToString() + " - " + datat2.Rows[i][17].ToString() + " Win Games<br />");
                table.Append("<div class=\"div-descinfo\"><div class=\"div-duoqueue\">" + duonoduo + "</div><div class=\"div-soloflex\">" + soloflex + "</div></div></td>");
                table.Append("<td class=\"text-left\">" + amounttemp + "</td><td class=\"text-left\"><a id=\"" + datat2.Rows[i][0].ToString() + "\" href=\"javascript: __doPostBack('LinkButton1', '" + datat2.Rows[i][0].ToString() + "')\" class=\"button-for-checkout\" >Apply</a></td></tr>");
            }
        }
        table.Append("</tbody></table>");

        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
        
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
    String setserver(int a)
    {
        String str = "";
        try
        {
            switch (a)
            {
                case 0:
                    str = "EUW";
                    break;
                case 1:
                    str = "EUNE";
                    break;
                case 2:
                    str = "NA";
                    break;
                case 3:
                    str = "OCE";
                    break;
            }
            return str;
        }
        catch
        {
            return "Input Server";
        }
    }


    protected void btn_checkout_Click1(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string boosterorderstr = Request["__EVENTARGUMENT"];
        Session["boosterorder"] = boosterorderstr;
        Response.Redirect("bid.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string boosterorderstr = Request["__EVENTARGUMENT"];
        Session["boostertookedorder"] = boosterorderstr;
        Response.Redirect("order/order.aspx");
    }
}