using System;
using System.Text;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using RiotSharp;

public partial class Index : System.Web.UI.Page
{
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=nuser1;Pwd=pass;";
    object obj;
    public DataTable datat1 = new DataTable();
    bool noneorder = false;
    int row_with_order = 0;
    string game_summonername = "";
    int custumerserver = 0;
    int currentgames = 0;
    String strprogressdivcurrent1 = "";
    String strprogressdivcurrent2 = "";
    int strprogressdivcurrent3 = 0;
    StringBuilder table = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (Session["account_type"].ToString() == "False")
            {
                try
                {
                    filldatatable();
                    if (datat1.Rows.Count > 1)
                    {
                        for (int i = 0; i < datat1.Rows.Count; i++)
                        {
                            if (int.Parse(datat1.Rows[i][14].ToString()) != 2)
                            {
                                row_with_order = i;
                            }
                            else
                            {
                                //edo na balo na enfanizei tin teleutea paragkelia pou exei oloklirothei me basi tin imerominia agoras
                            }
                        }
                    }
                    returncustomerdetails(row_with_order);
                    runcorrectfillprogressdiv();
                    if (datat1.Rows[row_with_order][3].ToString() != "")
                    {
                        truefalseimg.ImageUrl = "img/True_icon.png";
                        Label_AccountDetails2.Text = "";
                    }
                    if (!IsPostBack)
                    {
                        PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[Session["id"].ToString()] });

                    }
                }
                catch
                {
                    noneorder = true;
                    Label_orderID2.Text = "None";
                    Label_server2.Text = "";
                    Label_summonername2.Text = "";
                    Label_orderstatus2.Text = "";
                    img_progressdivstart.ImageUrl = setdivisionpic("Bronze-black-white");
                    label_progressdivstart.Text = "";
                    img_progressdivdesired.ImageUrl = setdivisionpic("Bronze-black-white");
                    label_progressdivdesired.Text = "";
                    img_progressdivcurrent.ImageUrl = setdivisionpic("Bronze-black-white");
                    label_progressdivcurrent1.Text = "";
                    label_progressdivcurrent2.Text = "";
                    label_progressdivcurrent3.Text = "";
                    Label_AccountDetails2.Text = "";
                }
            }
            else
            {
                Response.Redirect("../booster/index.aspx");
            }
        }
        else
        {
            Response.Redirect("../index.aspx");
        }
    }

    void filldatatable()
    {
        MySqlConnection con = openconnection();
        MySqlDataAdapter sda1 = new MySqlDataAdapter("SELECT a.id, a.username, a.game_username, a.game_summonername, a.account_type, b.idOrderProgress, b.OrderStartLeague, b.OrderStartDivision, b.OrderStartLp, b.SoloFlex, b.NoDuoOrDuo, b.OrderEndLeague, b.OrderEndDivision, b.GamesNumber, b.OrderStatus, b.OrderStartYesOrNo, b.ServerName, b.OrderType, b.IdBoosterForOrder, b.accountid FROM `accounts` as `a`, `orderprogress` as `b` WHERE a.id ='" + Session["id"] + "' and b.accountid = '" + Session["id"] + "';", con);
        sda1.Fill(datat1);
        con.Close();
    }

    MySqlConnection openconnection()
    {
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        return con;
    }

    protected void button_saveaccountdetails_Click(object sender, EventArgs e)
    {
        if (noneorder == false)
        {
            if (TextBox_summonernameedit.Enabled == false)
            {
                MySqlConnection con = openconnection();
                MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `game_username` = @accountname, `game_password` = @accountpassword WHERE `id` = '" + Session["id"] + "';", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@accountname", TextBox_accountname.Text);
                cmd.Parameters.AddWithValue("@accountpassword", TextBox_accountpassword.Text);
                obj = cmd.ExecuteScalar();
                con.Close();

                returncustomerdetails(row_with_order);
                TextBox_accountname.Text = "";
                savetrueimg.Visible = true;
                Label4.Visible = true;
                Response.Redirect("~/customer/Index.aspx");
            }
            else
            {
                MySqlConnection con = openconnection();
                MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `game_username` = @accountname, `game_password` = @accountpassword, `game_summonername` = @summonernameedit WHERE `id` = '" + Session["id"] + "';", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@accountname", TextBox_accountname.Text);
                cmd.Parameters.AddWithValue("@summonernameedit", TextBox_summonernameedit.Text);
                cmd.Parameters.AddWithValue("@accountpassword", TextBox_accountpassword.Text);
                obj = cmd.ExecuteScalar();
                con.Close();

                returncustomerdetails(row_with_order);
                TextBox_accountname.Text = "";
                savetrueimg.Visible = true;
                Label4.Visible = true;

                Response.Redirect("~/customer/Index.aspx");
            }
        }
        else
        {
            savetrueimg.ImageUrl = "~/customer/img/False_icon.png";
            savetrueimg.Visible = true;
            Label4.Text = "You need make a order first!";
            Label4.Visible = true;
        }
    }

    void free_game_summonername()
    {
        MySqlConnection con = openconnection();
        MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`accounts` SET `game_summonername` = @summonernameedit WHERE `id` = '" + Session["id"] + "';", con);
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@summonernameedit", null);
        obj = cmd.ExecuteScalar();
        con.Close();
    }

    void runcorrectfillprogressdiv()
    {
        if (int.Parse(datat1.Rows[row_with_order][17].ToString()) == 0)
        {
            getdivisionboostprogress(row_with_order);
            //getdivisionprogresspercent(row_with_order);
        }
        else if (int.Parse(datat1.Rows[row_with_order][17].ToString()) == 1)
        {
            getplacementprogress();
            //getplacementprogresspercent(row_with_order);
        }
        else if (int.Parse(datat1.Rows[row_with_order][17].ToString()) == 2)
        {
            getwinsprogress(row_with_order);
            //getplacementprogresspercent(row_with_order);
        }

    }
    void getplacementprogress()
    {
        getdivisionplacementprogress(row_with_order);
    }

    void returncustomerdetails(int i)
    {
        Label_orderID2.Text = datat1.Rows[i][5].ToString();
        game_summonername = datat1.Rows[i][3].ToString();
        if (game_summonername != "")
        {
            TextBox_summonernameedit.Enabled = false;
            TextBox_summonernameedit.Text = datat1.Rows[i][3].ToString();
        }

        String str = "";
        custumerserver = Int32.Parse(datat1.Rows[i][16].ToString());
        Label_server2.Text = setserver(custumerserver);
        Label_summonername2.Text = game_summonername;
        switch (int.Parse(datat1.Rows[i][14].ToString()))
        {
            case 0:
                str = "Awaiting Information";
                break;
            case 1:
                str = "In Progress";
                break;
            case 2:
                str = "Complete";
                break;
        }
        Label_orderstatus2.Text = str;

    }

    String setserver(int i)
    {
        String str = "";
        try
        {
            switch (i)
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

    String setdivisionpic(String str)
    {
        switch (str)
        {
            case "Bronze":
                str = "../img/divisions/bronze-sima.png";
                break;
            case "Silver":
                str = "../img/divisions/silver-sima.png";
                break;
            case "Gold":
                str = "../img/divisions/gold-sima.png";
                break;
            case "Platinum":
                str = "../img/divisions/platinum-sima.png";
                break;
            case "Diamond":
                str = "../img/divisions/diamond-sima.png";
                break;
            case "Master":
                str = "../img/divisions/master-sima.png";
                break;
            case "Challenger":
                str = "../img/divisions/master-sima.png";
                break;
            case "Bronze-black-white":
                str = "../img/divisions/bronze-sima-black-white.png";
                break;
            case "Unranked":
                str = "../img/divisions/bronze-sima-black-white.png";
                break;

        }
        return str;
    }


    void getdivisionplacementprogress(int i)
    {
        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {

            if (int.Parse(datat1.Rows[i][14].ToString()) != 2)
            {

                var api = RiotApi.GetInstance("RGAPI-cf5bf121-65f7-41cd-85f8-9b3b0b4b1f03");
                var summoner = (dynamic)null;
                switch (setserver(custumerserver))
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
                if (datat1.Rows[i][8].ToString() == "")
                {
                    MySqlConnection con = openconnection();
                    MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStartLp` = @startPlacement WHERE `idOrderProgress` = '" + datat1.Rows[i][5].ToString() + "';", con);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@startPlacement", sum);
                    obj = cmd.ExecuteScalar();
                    con.Close();
                    currentplacementlb.Text = "0";

                }
                else
                {

                    currentgames = sum - Int32.Parse(datat1.Rows[i][8].ToString());
                    currentplacementlb.Text = currentgames.ToString(); ;

                    //if ((sum - Int32.Parse(datat1.Rows[i][8].ToString())) >= Int32.Parse(datat1.Rows[i][13].ToString()))
                    //{
                    //    finishorder(i);
                    //}
                }
            }
            else
            {/////////////////////edo stamatisa

                currentplacementlb.Text = datat1.Rows[i][13].ToString();
                desiredplacementlb.Text = datat1.Rows[i][13].ToString();

            }
            label_progressdivstart.Text = datat1.Rows[i][6].ToString();
            Label1.Text = "Prev League";
            Label1.Font.Size = 21;
            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][6].ToString());
            currentplacementlb.Visible = true;
            desiredplacementlb.Visible = true;
            img_progressdivcurrent.Visible = false;
            img_progressdivdesired.Visible = false;
            desiredplacementlb.Text = datat1.Rows[row_with_order][13].ToString();
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
            if (datat1.Rows[i][3].ToString() != "")
            {
                free_game_summonername();
            }
        }
    }

    void getwinsprogress(int i)
    {

        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {

            if (int.Parse(datat1.Rows[i][14].ToString()) != 2)
            {

                var api = RiotApi.GetInstance("RGAPI-cf5bf121-65f7-41cd-85f8-9b3b0b4b1f03");
                var summoner = (dynamic)null;
                switch (setserver(custumerserver))
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
                if (datat1.Rows[i][8].ToString() == "")
                {
                    MySqlConnection con = openconnection();
                    MySqlCommand cmd = new MySqlCommand("UPDATE `db_divisionboost`.`orderprogress` SET `OrderStartLp` = @startwins WHERE `idOrderProgress` = '" + datat1.Rows[i][5].ToString() + "';", con);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@startwins", winsint);
                    obj = cmd.ExecuteScalar();
                    con.Close();
                    currentplacementlb.Text = "0";

                }
                else
                {

                    currentgames = winsint - Int32.Parse(datat1.Rows[i][8].ToString());
                    currentplacementlb.Text = currentgames.ToString(); ;

                    //if ((winsint - Int32.Parse(datat1.Rows[i][8].ToString())) >= Int32.Parse(datat1.Rows[i][13].ToString()))
                    //{
                    //    finishorder(i);
                    //}
                }
            }
            else
            {/////////////////////edo stamatisa

                currentplacementlb.Text = datat1.Rows[i][13].ToString();
                desiredplacementlb.Text = datat1.Rows[i][13].ToString();
            }
            label_progressdivstart.Text = datat1.Rows[i][6].ToString();
            Label1.Text = "Current Rank";
            Label1.Font.Size = 21;
            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][6].ToString());
            currentplacementlb.Visible = true;
            desiredplacementlb.Visible = true;
            img_progressdivcurrent.Visible = false;
            img_progressdivdesired.Visible = false;
            desiredplacementlb.Text = datat1.Rows[row_with_order][13].ToString();
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
            if (datat1.Rows[i][3].ToString() != "")
            {
                free_game_summonername();
            }
        }

    }

    void getdivisionboostprogress(int i)
    {

        //sindesi me tin riot kai me json anaktisi tou division tou paikti
        try
        {
            if (int.Parse(datat1.Rows[i][14].ToString()) != 2)
            {
                var api = RiotApi.GetInstance("RGAPI-cf5bf121-65f7-41cd-85f8-9b3b0b4b1f03");
                var summoner = (dynamic)null;
                switch (setserver(custumerserver))
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
                label_progressdivcurrent1.Text = "" + league + " ";
                label_progressdivcurrent2.Text = "" + division;
                label_progressdivcurrent3.Text = "" + lp + "LP";
                strprogressdivcurrent1 = league;
                strprogressdivcurrent2 = division;
                strprogressdivcurrent3 = Int32.Parse(lp);
                test.Clear();
                img_progressdivcurrent.ImageUrl = setdivisionpic(league);
                //if ((datat1.Rows[i][11].ToString() == league) && (datat1.Rows[i][12].ToString() == division))
                //{
                //    finishorder(i);
                //}
            }
            else
            {
                img_progressdivcurrent.ImageUrl = setdivisionpic(datat1.Rows[i][11].ToString());
                label_progressdivcurrent1.Text = "" + datat1.Rows[i][11].ToString() + " ";
                label_progressdivcurrent2.Text = "" + datat1.Rows[i][12].ToString();
                label_progressdivcurrent3.Text = "";
            }

            img_progressdivstart.ImageUrl = setdivisionpic(datat1.Rows[i][6].ToString());
            label_progressdivstart.Text = "" + datat1.Rows[i][6].ToString() + "\n" + datat1.Rows[i][7].ToString();
            img_progressdivdesired.ImageUrl = setdivisionpic(datat1.Rows[i][11].ToString());
            label_progressdivdesired.Text = "" + datat1.Rows[i][11].ToString() + " " + datat1.Rows[i][12].ToString();

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
            //if (datat1.Rows[i][3].ToString() != "")
            //{
            //    free_game_summonername();
            //}

        }

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

    void getdivisionprogresspercent(int i)
    {
        if (Int32.Parse(datat1.Rows[i][14].ToString()) == 0 || Int32.Parse(datat1.Rows[i][14].ToString()) == 1)
        {
            double percent;

            int arxikolp = 0;
            int trexonlp = strprogressdivcurrent3;
            int telikolp = 0;
            int arxikoipoepipedo = getdivisionforprogress(datat1.Rows[i][7].ToString());
            int trexonipoepipedo = getdivisionforprogress(strprogressdivcurrent2);
            int telikoipoepipedo = getdivisionforprogress(datat1.Rows[i][12].ToString());
            int arxikodivision = getleagueforprogress(datat1.Rows[i][6].ToString());
            int telikodivision = getleagueforprogress(datat1.Rows[i][11].ToString());
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
            //if (trexonlvl >= telikalvl)
            //{
            //    finishorder(i);
            //}

        }
        else
        {
            progressbartext.Text = "100%";
            progressdivid.Style.Add("width", "100%");
        }
    }

    void getplacementprogresspercent(int i)
    {
        if (Int32.Parse(datat1.Rows[i][14].ToString()) == 0 || Int32.Parse(datat1.Rows[i][14].ToString()) == 1)
        {
            double percent;

            percent = (double)(currentgames) * 100 / (Int32.Parse(datat1.Rows[i][13].ToString()));


            progressbartext.Text = percent.ToString("#.#") + "%";
            progressdivid.Style.Add("width", percent + "%");
            //if (currentgames >= Int32.Parse(datat1.Rows[i][13].ToString()))
            //{
            //    finishorder(i);
            //}

        }
        else
        {
            progressbartext.Text = "100%";
            progressdivid.Style.Add("width", "100%");
        }
    }

    protected void btn_sendmsg_Click(object sender, EventArgs e)
    {
        string name = Session["user"].ToString();
        string message = txtsend.Text;
        string my = "<b>" + name + "</b>: " + message;

        table.Append("<div class=\"chat user1\"><p class=\"chat-message\">" + my + "</p></div>");
        Application[Session["id"].ToString()] = Application[Session["id"].ToString()] + table.ToString() + Environment.NewLine;

        PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[Session["id"].ToString()] });
        Timer1_Tick(null, null);

        txtsend.Text = "";
        ScriptManager.RegisterStartupScript(Page, this.GetType(), "Focus", "focuschattextbox();", true);
        Page.MaintainScrollPositionOnPostBack = true;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        PlaceHolder1.Controls.Clear();
        PlaceHolder1.Controls.Add(new Literal { Text = (string)Application[Session["id"].ToString()] });
    }
}