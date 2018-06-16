using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using MySql.Data.MySqlClient;
using System.Data;

public partial class boosting_placement : System.Web.UI.Page
{
    public double price1 = 0.0;
    public double price2 = 0.0;
    public static double tel_poso = 3;
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=pass;";
    object obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    protected void imageallagi1(object sender, EventArgs e)
    {
        price1 = 0.0;
        price2 = 0.0;
        tel_poso = 0.0;
        allagi_ikonas1();

        if (DropDownList1.SelectedValue == "0" || DropDownList1.SelectedValue == "00" || DropDownList1.SelectedValue == "1")
        { price1 = 3; }
        else if (DropDownList1.SelectedValue == "2")
        { price1 = 3.5; }
        else if (DropDownList1.SelectedValue == "3")
        { price1 = 4.5; }
        else if (DropDownList1.SelectedValue == "4")
        { price1 = 5.5; }
        else if (DropDownList1.SelectedValue == "5")
        { price1 = 7.5; }

        double.TryParse(DropDownList2.SelectedValue, out price2);
        teliko_poso_func(price1, price2);
        if (CheckBox3.Checked == true)
        {
            tel_poso = tel_poso * 0.9;
        }
        Label5.Text = tel_poso.ToString("#.##") + " Euro";
        timeremaininglb.Text = DropDownList2.SelectedValue + " hours";
        placementlb.Text = DropDownList2.SelectedValue;

    }
    public void allagi_ikonas1()
    {
        if (DropDownList1.SelectedValue == "0" || DropDownList1.SelectedValue == "00")
        { Image2.ImageUrl = "../img/divisions/bronze-sima-black-white.png"; }
        else if (DropDownList1.SelectedValue == "1")
        { Image2.ImageUrl = "../img/divisions/bronze-sima.png"; }
        else if (DropDownList1.SelectedValue == "2")
        { Image2.ImageUrl = "../img/divisions/silver-sima.png"; }
        else if (DropDownList1.SelectedValue == "3")
        { Image2.ImageUrl = "../img/divisions/gold-sima.png"; }
        else if (DropDownList1.SelectedValue == "4")
        { Image2.ImageUrl = "../img/divisions/platinum-sima.png"; }
        else if (DropDownList1.SelectedValue == "5")
        { Image2.ImageUrl = "../img/divisions/diamond-sima.png"; }
        else if (DropDownList1.SelectedValue == "6")
        { Image2.ImageUrl = "../img/divisions/master-sima.png"; }
    }
    public void teliko_poso_func(double poso1, double poso2)
    {
        tel_poso = poso1 * poso2;
    }

    String getStartLeagueForBoost()
    {
        String strDiv1 = "";
        switch (DropDownList1.SelectedValue)
        {
            case "0":
                strDiv1 = "Unranked";
                break;
            case "00":
                strDiv1 = "Bronze";
                break;
            case "1":
                strDiv1 = "Bronze";
                break;
            case "2":
                strDiv1 = "Silver";
                break;
            case "3":
                strDiv1 = "Gold";
                break;
            case "4":
                strDiv1 = "Platinum";
                break;
            case "5":
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
        if (tel_poso != 0)
        {
            //string business = "nuser1@gmail.com";
            string itemName = " Buy placement league: " + getStartLeagueForBoost() + " for " + Int32.Parse(DropDownList2.SelectedValue) + " games " + getserver() + " " + getSoloFlexCheck() + " " + getCheckToBoostEanEinaiDuoEpistrofiString();
            string itemAmount = tel_poso.ToString("#.##", CultureInfo.GetCultureInfo("en-GB"));
            string currencyCode = "EUR";

            Session["payment_amt"] = itemAmount;
            Session["BRANDNAME"] = "DivisionBoost.eu";
            Session["item_name"] = itemName;
            Session["currency_code"] = currencyCode;
            Session["StartLeague"] = getStartLeagueForBoost();
            Session["GamesNumber"] = DropDownList2.SelectedValue;
            Session["SoloFlex"] = getSoloFlexCheckReturnInt();
            Session["DuoNoDuo"] = getCheckToBoostEanEinaiDuoEpistrofiInt();
            Session["ServerName"] = Int32.Parse(DropDownServer.SelectedValue);
            Session["OrderType"] = 1;
            
            Session["StartDivision"] = "";
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

    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        imageallagi1(null, null);

    }

}