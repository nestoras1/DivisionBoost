using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using MySql.Data.MySqlClient;
using System.Data;

public partial class boosting_wins : System.Web.UI.Page
{
    public static double price3_gia_buywins = 0.0;
    public static double price4_gia_buywins = 0.0;
    public static double tel_poso_gia_buywins = 4.0;
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=pass;";
    object obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public void allagi_ikonas4()
    {
        if (DropDownList8.SelectedValue == "0" || DropDownList8.SelectedValue == "1")
        { Image8.ImageUrl = "../img/divisions/bronze-sima-black-white.png"; }
        else if (DropDownList8.SelectedValue == "2")
        { Image8.ImageUrl = "../img/divisions/bronze-sima.png"; }
        else if (DropDownList8.SelectedValue == "3")
        { Image8.ImageUrl = "../img/divisions/silver-sima.png"; }
        else if (DropDownList8.SelectedValue == "4")
        { Image8.ImageUrl = "../img/divisions/gold-sima.png"; }
        else if (DropDownList8.SelectedValue == "5")
        { Image8.ImageUrl = "../img/divisions/platinum-sima.png"; }
        else if (DropDownList8.SelectedValue == "6")
        { Image8.ImageUrl = "../img/divisions/diamond-sima.png"; }
        else if (DropDownList8.SelectedValue == "7")
        { Image8.ImageUrl = "../img/divisions/master-sima.png"; }
    }
    void emfanisi_DropDownList8()
    {
        if (Int32.Parse(DropDownList8.SelectedValue) >= 2)
        {
            DropDownList9.Visible = true;
        }
        else
        {
            DropDownList9.Visible = false;
        }
    }
    public void teliko_poso_func_gia_buywins(double poso1, double poso2)
    {
        tel_poso_gia_buywins = poso1 * poso2;
        if (CheckBox3.Checked == true)
        {
            tel_poso_gia_buywins = tel_poso_gia_buywins * 1.7;
        }
    }
    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        ipologismos_posou_gia_option2_buywins();
    }

    void ipologismos_posou_gia_option2_buywins()
    {
        price3_gia_buywins = 0.0;
        price4_gia_buywins = 0.0;
        tel_poso_gia_buywins = 4.0;

        switch (Int32.Parse(DropDownList8.SelectedValue))
        {
            case 0:
                price3_gia_buywins = 3;
                break;
            case 1:
                price3_gia_buywins = 3;
                break;
            case 2:
                price3_gia_buywins = 3.8;
                break;
            case 3:
                price3_gia_buywins = 5.1;
                break;
            case 4:
                price3_gia_buywins = 7.9;
                break;
            case 5:
                price3_gia_buywins = 13;
                break;
            case 6:
                price3_gia_buywins = 21;
                break;
        }

        if ((Int32.Parse(DropDownList8.SelectedValue) != 0) || (Int32.Parse(DropDownList8.SelectedValue) != 1))
        {
            for (int i = 0; i <= Int32.Parse(DropDownList9.SelectedValue); i++)
            {
                price3_gia_buywins = price3_gia_buywins * 0.93;
            }
        }
        emfanisi_DropDownList8();


        double.TryParse(DropDownList10.SelectedValue, out price4_gia_buywins);
        teliko_poso_func_gia_buywins(price3_gia_buywins, price4_gia_buywins);

        if (Int32.Parse(DropDownList8.SelectedValue) == 6)
        {
            if (Int32.Parse(DropDownList9.SelectedValue) == 3)
            {
                tel_poso_gia_buywins = tel_poso_gia_buywins * 1.5;
            }
            else if (Int32.Parse(DropDownList9.SelectedValue) == 2)
            {
                tel_poso_gia_buywins = tel_poso_gia_buywins * 1.7;
            }
            else if (Int32.Parse(DropDownList9.SelectedValue) == 1)
            {
                tel_poso_gia_buywins = tel_poso_gia_buywins * 1.7;
            }
        }
        Label5.Text = " " + tel_poso_gia_buywins.ToString("#.#") + " Euro";
    }

    protected void imageallagi4(object sender, EventArgs e)
    {
        price3_gia_buywins = 0.0;
        price4_gia_buywins = 0.0;
        tel_poso_gia_buywins = 4.0;
        allagi_ikonas4();

        placementlb.Text = DropDownList10.SelectedValue;
        timeremaininglb.Text = DropDownList10.SelectedValue + " hours";

        ipologismos_posou_gia_option2_buywins();

    }

    String getNumberForgetDivisionForBuyWins()
    {
        String strDiv2 = "";
        switch (Int32.Parse(DropDownList9.SelectedValue))
        {
            case 1:
                strDiv2 = "I";
                break;
            case 2:
                strDiv2 = "II";
                break;
            case 3:
                strDiv2 = "III";
                break;
            case 4:
                strDiv2 = "IV";
                break;
            case 5:
                strDiv2 = "V";
                break;
        }
        return strDiv2;
    }
    String getDivisionForBuyWins()
    {
        String strDiv1 = "";
        switch (Int32.Parse(DropDownList8.SelectedValue))
        {
            case 0:
                strDiv1 = "Unranked";
                break;
            case 1:
                strDiv1 = "Normal";
                break;
            case 2:
                strDiv1 = "Bronze";
                break;
            case 3:
                strDiv1 = "Silver";
                break;
            case 4:
                strDiv1 = "Gold";
                break;
            case 5:
                strDiv1 = "Platinum";
                break;
            case 6:
                strDiv1 = "Diamond";
                break;
        }
        if (DropDownList9.Visible == true)
        {
            return strDiv1 + " " + getNumberForgetDivisionForBuyWins();
        }
        else
        {
            return strDiv1;
        }
    }

    String getCheckToBuywinsEanEinaiDuoEpistrofiString()
    {
        String str1 = "";
        if (CheckBox3.Checked == true)
        {
            str1 = " with Duo";
        }
        else
        {
            str1 = " No Duo";
        }

        return str1;
    }

    String getStartLeagueForBoost()
    {
        String strDiv1 = "";
        switch (Int32.Parse(DropDownList8.SelectedValue))
        {
            case 0:
                strDiv1 = "Unranked";
                break;
            case 1:
                strDiv1 = "Normal";
                break;
            case 2:
                strDiv1 = "Bronze";
                break;
            case 3:
                strDiv1 = "Silver";
                break;
            case 4:
                strDiv1 = "Gold";
                break;
            case 5:
                strDiv1 = "Platinum";
                break;
            case 6:
                strDiv1 = "Diamond";
                break;
        }
        return strDiv1;
    }
    String getSoloFlexCheck()
    {
        String str1 = "";
        if (RadioButtonList1.SelectedValue == "Solo")
        {
            str1 = " (Solo Ranked)";
        }
        else
        {
            str1 = " (Flex Ranked)";
        }

        return str1;
    }

    int getSoloFlexCheckReturnInt()
    {
        int i = 0;
        if (RadioButtonList1.SelectedValue == "Solo")
        { i = 0; }
        else
        { i = 1; }
        return i;
    }
    String getCheckToBoostEanEinaiDuoEpistrofiString()
    {
        String str1 = "";
        if (CheckBox3.Checked == true)
        {
            str1 = " with Duo";
        }
        else
        {
            str1 = " No Duo";
        }

        return str1;
    }

    int getCheckToBoostEanEinaiDuoEpistrofiInt()
    {
        int i = 0;
        if (CheckBox3.Checked == false)
        { i = 0; }
        else
        { i = 1; }
        return i;
    }

    String getserver()
    {
        String str = "";
        switch (Int32.Parse(DropDownServer.SelectedValue))
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label6.Text = "";
        if (tel_poso_gia_buywins != 0)
        {
            //string business = "nuser1@gmail.com";
            string itemName = "Buy Wins: " + getDivisionForBuyWins() + " for " + DropDownList10.SelectedValue + " games " + getCheckToBuywinsEanEinaiDuoEpistrofiString() + " " + getSoloFlexCheck() + " " + getserver();
            string itemAmount = tel_poso_gia_buywins.ToString("#.#", CultureInfo.GetCultureInfo("en-GB"));
            string currencyCode = "EUR";

            Session["payment_amt"] = itemAmount;
            Session["BRANDNAME"] = "DivisionBoost.eu";
            Session["item_name"] = itemName;
            Session["currency_code"] = currencyCode;
            Session["StartLeague"] = getStartLeagueForBoost();
            Session["StartDivision"] = getNumberForgetDivisionForBuyWins();
            Session["GamesNumber"] = DropDownList10.SelectedValue;
            Session["SoloFlex"] = getSoloFlexCheckReturnInt();
            Session["DuoNoDuo"] = getCheckToBoostEanEinaiDuoEpistrofiInt();
            Session["ServerName"] = Int32.Parse(DropDownServer.SelectedValue);
            Session["OrderType"] = 2;

            Session["StartLp"] = "";
            Session["EndLeague"] = "";
            Session["EndDivision"] = "";
            Response.Redirect("~/Checkout/CheckoutDetails.aspx");
        }
        else
        {
            Label6.Text = ("Unacceptable - check your Order");
        }
    }
}