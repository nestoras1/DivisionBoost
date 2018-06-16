using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RiotSharp;

public partial class booster_order : System.Web.UI.Page
{
    static String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=password;";
    object obj;
    string game_summonername = "";
    public DataTable datat1 = new DataTable();
    String strprogressdivcurrent1 = "";
    String strprogressdivcurrent2 = "";
    int strprogressdivcurrent3 = 0;
    int row_with_order = 0;
    int currentgames = 0;
    StringBuilder table = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (Session["account_type"].ToString() == "True")
            {
                filldatatable();
                fillnavbar();
                fillorderinfo();
                runcorrectfillprogressdiv();
            }
            else
            {
                Response.Redirect("~/customer/Index.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Index.aspx");
        }
        if (IsPostBack)
        {
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ScrollPage", "ResetScrollPosition();", true);
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "Focus", "focuschattextbox();", true);
        }

        if (!IsPostBack)
        {
            PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[Session["id"].ToString()] });
        }
    }

    void filldatatable()
    {
        
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT c.accountid, c.division, c.solorank, c.duorank, c.balanceeuro, c.balancepreordereuro, c.balanceusd, c.balancepreorderusd, c.balancegbp, c.balancepreordergbp, b.accountid, b.idOrderProgress, b.OrderStartLeague, b.OrderStartDivision, b.OrderStartLp, b.SoloFlex, b.NoDuoOrDuo, b.OrderEndLeague, b.OrderEndDivision, b.GamesNumber, b.OrderStatus, b.OrderStartYesOrNo, b.ServerName, b.OrderType, b.IdBoosterForOrder, b.OrderCashout, b.OrderMinCashout, b.OrderCurrency, b.OrderBid, b.OrderDate, b.accountid, b.BidEndDate, a.username, a.game_username, a.game_password, a.game_summonername, a.user2chatid FROM `booster` as `c`, `orderprogress` as `b`, `accounts` as `a` WHERE c.accountid ='" + Session["id"].ToString() + "' and b.idOrderProgress = '" + Session["boostertookedorder"].ToString() + "' and a.id = (SELECT z.accountid FROM `orderprogress` as `z` WHERE z.IdBoosterForOrder = '" + Session["id"] + "' and z.OrderStatus = 1);", con);
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
        try {
            label_solo_rank1.Text = "";
            label_solo_rank2.Text = "";
            label_duo_rank1.Text = "";
            label_duo_rank2.Text = "";
            //label_solo_rank2.Text = booster_accepted_rank(int.Parse(datat1.Rows[0][2].ToString()));
            //label_duo_rank2.Text = booster_accepted_rank(int.Parse(datat1.Rows[0][3].ToString()));
            label_balance2.Text = datat1.Rows[0][4].ToString() + " (" + datat1.Rows[0][5].ToString() + ") EUR / " + datat1.Rows[0][6].ToString() + " (" + datat1.Rows[0][7].ToString();
            label_balance2.Text += ") USD / " + datat1.Rows[0][8].ToString() + " (" + datat1.Rows[0][9].ToString() + ") GBP";
        }
        catch
        {
            Response.Redirect("../../booster/index.aspx");
        }
    }

    void fillorderinfo()
    {
        game_summonername = datat1.Rows[0][35].ToString();
        orderidlb2.Text = datat1.Rows[0][11].ToString();
        serverlb2.Text = getserver(datat1.Rows[0][22].ToString());
        setorderdescriptionlb2();
        queuelb.Text = getDuoNoDuo(datat1.Rows[0][16].ToString()) + " Queue";
        rankedlb.Text = "Ranked " + getSoloFlex(datat1.Rows[0][15].ToString());
        cashoutlb2.Text = datat1.Rows[0][28].ToString();
        accnamelb2.Text = datat1.Rows[0][33].ToString();
        passlb2.Text = datat1.Rows[0][34].ToString();
        sumnamelb2.Text = datat1.Rows[0][35].ToString();
    }

    void setorderdescriptionlb2()
    {
        switch (datat1.Rows[0][23].ToString())
        {
            case "0":
                orderdescriptionlb2.Text = datat1.Rows[0][12].ToString() + " " + datat1.Rows[0][13].ToString() + " - " + datat1.Rows[0][17].ToString() + " " + datat1.Rows[0][18].ToString();
                break;
            case "1":
                orderdescriptionlb2.Text = datat1.Rows[0][12].ToString() + " - " + datat1.Rows[0][19].ToString() + " Placement Games";
                break;
            case "2":
                orderdescriptionlb2.Text = datat1.Rows[0][12].ToString() + " " + datat1.Rows[0][13].ToString() + " - " + datat1.Rows[0][19].ToString() + " Win Games";
                break;
        }
        
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

    void runcorrectfillprogressdiv()
    {
        if (int.Parse(datat1.Rows[row_with_order][23].ToString()) == 0)
        {
            getdivisionboostprogress(row_with_order);
            getdivisionprogresspercent(row_with_order);
        }
        else if (int.Parse(datat1.Rows[row_with_order][23].ToString()) == 1)
        {
            getplacementprogress();
            getplacementprogresspercent(row_with_order);
        }
        else if (int.Parse(datat1.Rows[row_with_order][23].ToString()) == 2)
        {
            getwinsprogress(row_with_order);
            getplacementprogresspercent(row_with_order);
        }

    }

    void getplacementprogress()
    {
        getdivisionplacementprogress(row_with_order);
    }

    String setdivisionpic(String str)
    {
        switch (str)
        {
            case "Bronze":
                str = "../../images/bronze-sima.png";
                break;
            case "Silver":
                str = "../../images/silver-sima.png";
                break;
            case "Gold":
                str = "../../images/gold-sima.png";
                break;
            case "Platinum":
                str = "../../images/platinum-sima.png";
                break;
            case "Diamond":
                str = "../../images/diamond-sima.png";
                break;
            case "Master":
                str = "../../images/master-sima.png";
                break;
            case "Challenger":
                str = "../../images/master-sima.png";
                break;
            case "Bronze-black-white":
                str = "../../images/bronze-sima-black-white.png";
                break;
            case "Unranked":
                str = "../../images/bronze-sima-black-white.png";
                break;
        }
        return str;
    }

    void getdivisionplacementprogress(int i)
    {
        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {

            if (int.Parse(datat1.Rows[i][20].ToString()) != 2)
            {

                var api = RiotApi.GetInstance("RGAPI-7f969fda-a386-4eaa-999b-a2de7064c2c4");
                var summoner = (dynamic)null;
                switch (setserver(row_with_order))
                {
                    case "EUW":
                        summoner = api.GetSummoner(RiotSharp.Region.euw, game_summonername);
                        break;
                    case "EUNE":
                        summoner = api.GetSummoner(RiotSharp.Region.eune, game_summonername);
                        break;
                    case "NA":
                        summoner = api.GetSummoner(RiotSharp.Region.na, game_summonername);
                        break;
                    case "OCE":
                        summoner = api.GetSummoner(RiotSharp.Region.oce, game_summonername);
                        break;
                }

                List<RiotSharp.LeagueEndpoint.League> test = summoner.GetLeagues();

                var wins = test[0].Entries[0].Wins.ToString();
                var losses = test[0].Entries[0].Losses.ToString();
                int sum = Int32.Parse(wins) + Int32.Parse(losses);
                var sumid = summoner.Id;
                sumidlb2.Text = "" + sumid;
                if (datat1.Rows[i][14].ToString() == "")
                {
                    MySqlConnection con = openconnection();
                    MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStartLp` = @startPlacement WHERE `idOrderProgress` = '" + datat1.Rows[i][11].ToString() + "';", con);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@startPlacement", sum);
                    obj = cmd.ExecuteScalar();
                    con.Close();
                    currentplacementlb.Text = "0";

                }
                else
                {

                    currentgames = sum - Int32.Parse(datat1.Rows[i][14].ToString());
                    currentplacementlb.Text = currentgames.ToString();

                    if ((sum - Int32.Parse(datat1.Rows[i][14].ToString())) >= Int32.Parse(datat1.Rows[i][19].ToString()))
                    {
                        finishorder(i);
                    }
                }
            }
            else
            {/////////////////////edo stamatisa

                currentplacementlb.Text = datat1.Rows[i][19].ToString();
                desiredplacementlb.Text = datat1.Rows[i][19].ToString();
            }
            label_progressdivstart.Text = datat1.Rows[i][12].ToString();
            Label1.Text = "Prev League";
            Label1.Font.Size = 21;
            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][12].ToString());
            currentplacementlb.Visible = true;
            desiredplacementlb.Visible = true;
            img_progressdivcurrent.Visible = false;
            img_progressdivdesired.Visible = false;
            desiredplacementlb.Text = datat1.Rows[row_with_order][19].ToString();
            label_progressdivcurrent1.Text = "Current";
            label_progressdivcurrent2.Text = " Placement";
            label_progressdivcurrent3.Text = "Games";
        }
        catch
        {
            img_progressdivstart.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivstart.Text = "";
            img_progressdivdesired.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivdesired.Text = "";
            img_progressdivcurrent.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivcurrent1.Text = "";
            label_progressdivcurrent2.Text = "";
            label_progressdivcurrent3.Text = "";
        }
    }

    void getwinsprogress(int i)
    {

        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {

            if (int.Parse(datat1.Rows[i][20].ToString()) != 2)
            {

                var api = RiotApi.GetInstance("RGAPI-7f969fda-a386-4eaa-999b-a2de7064c2c4");
                var summoner = (dynamic)null;
                switch (setserver(row_with_order))
                {
                    case "EUW":
                        summoner = api.GetSummoner(RiotSharp.Region.euw, game_summonername);
                        break;
                    case "EUNE":
                        summoner = api.GetSummoner(RiotSharp.Region.eune, game_summonername);
                        break;
                    case "NA":
                        summoner = api.GetSummoner(RiotSharp.Region.na, game_summonername);
                        break;
                    case "OCE":
                        summoner = api.GetSummoner(RiotSharp.Region.oce, game_summonername);
                        break;
                }

                List<RiotSharp.LeagueEndpoint.League> test = summoner.GetLeagues();

                var wins = test[0].Entries[0].Wins.ToString();
                int winsint = Int32.Parse(wins);
                var sumid = summoner.Id;
                sumidlb2.Text = "" + sumid;
                if (datat1.Rows[i][14].ToString() == "")
                {
                    MySqlConnection con = openconnection();
                    MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStartLp` = @startwins WHERE `idOrderProgress` = '" + datat1.Rows[i][11].ToString() + "';", con);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@startwins", winsint);
                    obj = cmd.ExecuteScalar();
                    con.Close();
                    currentplacementlb.Text = "0";

                }
                else
                {

                    currentgames = winsint - Int32.Parse(datat1.Rows[i][14].ToString());
                    currentplacementlb.Text = currentgames.ToString(); ;

                    if ((winsint - Int32.Parse(datat1.Rows[i][14].ToString())) >= Int32.Parse(datat1.Rows[i][19].ToString()))
                    {
                        finishorder(i);
                    }
                }
            }
            else
            {/////////////////////edo stamatisa

                currentplacementlb.Text = datat1.Rows[i][19].ToString();
                desiredplacementlb.Text = datat1.Rows[i][19].ToString();
            }
            label_progressdivstart.Text = datat1.Rows[i][12].ToString();
            Label1.Text = "Current Rank";
            Label1.Font.Size = 21;
            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][12].ToString());
            currentplacementlb.Visible = true;
            desiredplacementlb.Visible = true;
            img_progressdivcurrent.Visible = false;
            img_progressdivdesired.Visible = false;
            desiredplacementlb.Text = datat1.Rows[row_with_order][19].ToString();
            label_progressdivcurrent1.Text = "Current";
            label_progressdivcurrent2.Text = " Win";
            label_progressdivcurrent3.Text = "Games";
        }
        catch
        {
            img_progressdivstart.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivstart.Text = "";
            img_progressdivdesired.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivdesired.Text = "";
            img_progressdivcurrent.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivcurrent1.Text = "";
            label_progressdivcurrent2.Text = "";
            label_progressdivcurrent3.Text = "";
        }

    }

    void getdivisionboostprogress(int i)
    {
        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {
            if (int.Parse(datat1.Rows[i][20].ToString()) != 2)
            {
                
                var api = RiotApi.GetInstance("RGAPI-7f969fda-a386-4eaa-999b-a2de7064c2c4");
                var summoner = (dynamic)null;
                switch (setserver(row_with_order))
                {
                    case "EUW":
                        summoner = api.GetSummoner(RiotSharp.Region.euw, game_summonername);
                        break;
                    case "EUNE":
                        summoner = api.GetSummoner(RiotSharp.Region.eune, game_summonername);
                        break;
                    case "NA":
                        summoner = api.GetSummoner(RiotSharp.Region.na, game_summonername);
                        break;
                    case "OCE":
                        summoner = api.GetSummoner(RiotSharp.Region.oce, game_summonername);
                        break;

                }
                

                List<RiotSharp.LeagueEndpoint.League> test = summoner.GetLeagues();
                var league = test[0].Tier.ToString();
                var division = test[0].Entries[0].Division.ToString();
                var lp = test[0].Entries[0].LeaguePoints.ToString();
                var a = test[0].Entries[0].Wins.ToString();
                var sumid = summoner.Id;
                sumidlb2.Text = "" + sumid;
                label_progressdivcurrent1.Text = "" + league + " ";
                label_progressdivcurrent2.Text = "" + division;
                label_progressdivcurrent3.Text = "" + lp + "LP";
                strprogressdivcurrent1 = league;
                strprogressdivcurrent2 = division;
                strprogressdivcurrent3 = Int32.Parse(lp);
                test.Clear();
                img_progressdivcurrent.ImageUrl = setdivisionpic(league);
                if ((datat1.Rows[i][17].ToString() == league) && (datat1.Rows[i][18].ToString() == division))
                {
                    finishorder(i);
                }
            }
            else
            {
                img_progressdivcurrent.ImageUrl = setdivisionpic(datat1.Rows[i][17].ToString());
                label_progressdivcurrent1.Text = "" + datat1.Rows[i][17].ToString() + " ";
                label_progressdivcurrent2.Text = "" + datat1.Rows[i][18].ToString();
                label_progressdivcurrent3.Text = "";
            }

            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][12].ToString());
            label_progressdivstart.Text = "" + datat1.Rows[i][12].ToString() + "\n" + datat1.Rows[i][13].ToString();
            img_progressdivdesired.ImageUrl = setdivisionpic(datat1.Rows[i][17].ToString());
            label_progressdivdesired.Text = "" + datat1.Rows[i][17].ToString() + " " + datat1.Rows[i][18].ToString();
        }
        catch
        {
            img_progressdivstart.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivstart.Text = "";
            img_progressdivdesired.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivdesired.Text = "";
            img_progressdivcurrent.ImageUrl = setdivisionpic("Bronze-black-white");
            label_progressdivcurrent1.Text = "";
            label_progressdivcurrent2.Text = "";
            label_progressdivcurrent3.Text = "";

        }

    }

    void getdivisionprogresspercent(int i)
    {
        if (Int32.Parse(datat1.Rows[i][20].ToString()) == 0 || Int32.Parse(datat1.Rows[i][20].ToString()) == 1)
        {
            double percent;

            int arxikolp = 0;
            int trexonlp = strprogressdivcurrent3;
            int telikolp = 0;
            int arxikoipoepipedo = getdivisionforprogress(datat1.Rows[i][13].ToString());
            int trexonipoepipedo = getdivisionforprogress(strprogressdivcurrent2);
            int telikoipoepipedo = getdivisionforprogress(datat1.Rows[i][18].ToString());
            int arxikodivision = getleagueforprogress(datat1.Rows[i][12].ToString());
            int telikodivision = getleagueforprogress(datat1.Rows[i][17].ToString());
            int trexondivision = getleagueforprogress(strprogressdivcurrent1);
            if (trexonlp == 100)
            {
                trexonlp -= 1;
            }

            int arxikalvl = ((arxikodivision - 1) * 500) + ((arxikoipoepipedo - 1) * 100) + arxikolp;
            int trexonlvl = ((trexondivision - 1) * 500) + ((trexonipoepipedo - 1) * 100) + trexonlp;
            int telikalvl = ((telikodivision - 1) * 500) + ((telikoipoepipedo - 1) * 100) + telikolp;

            percent = (double)(trexonlvl - arxikalvl) * 100 / (telikalvl - arxikalvl);


            progressbartext.Text = percent.ToString("#.#") + "%";
            progressdivid.Style.Add("width", percent + "%");
            if (trexonlvl >= telikalvl)
            {
                finishorder(i);
            }

        }
        else
        {
            progressbartext.Text = "100%";
            progressdivid.Style.Add("width", "100%");
        }
    }

    void getplacementprogresspercent(int i)
    {
        if (Int32.Parse(datat1.Rows[i][20].ToString()) == 0 || Int32.Parse(datat1.Rows[i][20].ToString()) == 1)
        {
            double percent;

            percent = (double)(currentgames) * 100 / (Int32.Parse(datat1.Rows[i][19].ToString()));


            progressbartext.Text = percent.ToString("#.#") + "%";
            progressdivid.Style.Add("width", percent + "%");
            if (currentgames >= Int32.Parse(datat1.Rows[i][19].ToString()))
            {
                finishorder(i);
            }

        }
        else
        {
            progressbartext.Text = "100%";
            progressdivid.Style.Add("width", "100%");
        }
    }

    void finishorder(int i)
    {

        MySqlConnection con = openconnection();
        MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStatus` = @orderstatus WHERE `idOrderProgress` = '" + datat1.Rows[i][11].ToString() + "';", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@orderstatus", 2);
        cmd.ExecuteScalar();
        MySqlCommand cmd2 = new MySqlCommand("UPDATE `db_divisionboost`.`booster` SET `balanceeuro` = @balanceeuro, `balancepreordereuro` = @balancepreordereuro WHERE `accountid` = '" + datat1.Rows[i][0].ToString() + "';", con);
        cmd2.CommandType = CommandType.Text;
        cmd2.Parameters.AddWithValue("@balanceeuro", (int.Parse(datat1.Rows[0][4].ToString()) + int.Parse(datat1.Rows[0][5].ToString())));
        cmd2.Parameters.AddWithValue("@balancepreordereuro", 0);
        cmd2.ExecuteScalar();
    }

    int getleagueforprogress(String str)
    {
        switch (str)
        {
            case "Bronze":
                return 1;
            case "Silver":
                return 2;
            case "Gold":
                return 3;
            case "Platinum":
                return 4;
            case "Diamond":
                return 5;
            case "Master":
                return 6;

        }
        return -1;
    }

    int getdivisionforprogressanapodo(String str)
    {
        switch (str)
        {
            case "V":
                return 5;
            case "IV":
                return 4;
            case "III":
                return 3;
            case "II":
                return 2;
            case "I":
                return 1;
        }
        return -1;
    }

    int getdivisionforprogress(String str)
    {
        switch (str)
        {
            case "V":
                return 1;
            case "IV":
                return 2;
            case "III":
                return 3;
            case "II":
                return 4;
            case "I":
                return 5;
        }
        return -1;
    }

    String setserver(int i)
    {
        String str = "";
        try
        {
            switch (int.Parse(datat1.Rows[i][22].ToString()))
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


    protected void btn_sendmsg_Click(object sender, EventArgs e)
    {
        string name = Session["user"].ToString();
        string message = txtsend.Text;
        string my = "<b>" + name + "</b>: " + message;

        table.Append("<div class=\"chat user2\"><p class=\"chat-message\">" + my + "</p></div>");
        Application[datat1.Rows[0][10].ToString()] = Application[datat1.Rows[0][10].ToString()] + table.ToString() + Environment.NewLine;

        PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[datat1.Rows[0][10].ToString()] });
        Timer2_Tick(null, null);

        txtsend.Text = "";
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        PlaceHolder1.Controls.Clear();
        PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[datat1.Rows[0][10].ToString()] });
    }
}