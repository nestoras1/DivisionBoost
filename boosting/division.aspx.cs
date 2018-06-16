using System;
using System.Globalization;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using System.Data;

public partial class boosting_division : System.Web.UI.Page
{
    public static double final_price = 0;
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=user;Pwd=pass;";
    object obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public void allagi_ikonas2()
    {
        if (DropDownList3.SelectedValue == "1")
        { Image2.ImageUrl = "../img/divisions/bronze-sima.png"; }
        else if (DropDownList3.SelectedValue == "2")
        { Image2.ImageUrl = "../img/divisions/silver-sima.png"; }
        else if (DropDownList3.SelectedValue == "3")
        { Image2.ImageUrl = "../img/divisions/gold-sima.png"; }
        else if (DropDownList3.SelectedValue == "4")
        { Image2.ImageUrl = "../img/divisions/platinum-sima.png"; }
        else if (DropDownList3.SelectedValue == "5")
        { Image2.ImageUrl = "../img/divisions/diamond-sima.png"; }
        else if (DropDownList3.SelectedValue == "6")
        { Image2.ImageUrl = "../img/divisions/master-sima.png"; }
    }
    public void allagi_ikonas3()
    {
        if (DropDownList6.SelectedValue == "1")
        { Image3.ImageUrl = "../img/divisions/bronze-sima.png"; }
        else if (DropDownList6.SelectedValue == "2")
        { Image3.ImageUrl = "../img/divisions/silver-sima.png"; }
        else if (DropDownList6.SelectedValue == "3")
        { Image3.ImageUrl = "../img/divisions/gold-sima.png"; }
        else if (DropDownList6.SelectedValue == "4")
        { Image3.ImageUrl = "../img/divisions/platinum-sima.png"; }
        else if (DropDownList6.SelectedValue == "5")
        { Image3.ImageUrl = "../img/divisions/diamond-sima.png"; }
        else if (DropDownList6.SelectedValue == "6")
        { Image3.ImageUrl = "../img/divisions/master-sima.png"; }
    }
    public static Boolean IsEmailValid(string EmailAddr)
    {
        return Regex.IsMatch(EmailAddr, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
    }

    protected void imageallagi2(object sender, EventArgs e)
    {
        allagi_ikonas2();
        ipologismos_posou_gia_option1_boost();
        gettimeremaining();
    }

    bool check_errors_final_price(double a)
    {
        if (a > 5)
        {
            return false;
        }
        else
        {
            return true;
        }
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

    String getStartLeagueForBoost()
    {
        String strDiv1 = "";
        switch (Int32.Parse(DropDownList3.SelectedValue))
        {
            case 1:
                strDiv1 = "Bronze";
                break;
            case 2:
                strDiv1 = "Silver";
                break;
            case 3:
                strDiv1 = "Gold";
                break;
            case 4:
                strDiv1 = "Platinum";
                break;
            case 5:
                strDiv1 = "Diamond";
                break;
        }
        return strDiv1;
    }
    String getStartDivisionForBoost()
    {
        String strDiv2 = "";
        switch (Int32.Parse(DropDownList4.SelectedValue))
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

    String getStartLpForBoost()
    {
        String strDiv3 = "";
        switch (Int32.Parse(DropDownList5.SelectedValue))
        {
            case 1:
                strDiv3 = "0-20";
                break;
            case 2:
                strDiv3 = "21-40";
                break;
            case 3:
                strDiv3 = "41-60";
                break;
            case 4:
                strDiv3 = "61-80";
                break;
            case 5:
                strDiv3 = "81-100";
                break;
        }
        return strDiv3;
    }

    String getFinalLeagueForBoost()
    {
        String str = "";
        switch (Int32.Parse(DropDownList6.SelectedValue))
        {
            case 1:
                str = "Bronze";
                break;
            case 2:
                str = "Silver";
                break;
            case 3:
                str = "Gold";
                break;
            case 4:
                str = "Platinum";
                break;
            case 5:
                str = "Diamond";
                break;
        }
        return str;
    }
    String getFinalDivisionForBoost()
    {
        String str = "";
        switch (Int32.Parse(DropDownList7.SelectedValue))
        {
            case 1:
                str = "I";
                break;
            case 2:
                str = "II";
                break;
            case 3:
                str = "III";
                break;
            case 4:
                str = "IV";
                break;
            case 5:
                str = "V";
                break;
        }
        return str;
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

    void gettimeremaining()
    {
        if (final_price <= 0)
        { timeremaininglb.Text = "-"; }
        else if (final_price <= 12)
        { timeremaininglb.Text = "10 hours"; }
        else if (final_price <= 20)
        { timeremaininglb.Text = "15 hours"; }
        else if (final_price <= 28)
        { timeremaininglb.Text = "22 hours"; }
        else if (final_price <= 38)
        { timeremaininglb.Text = "1 Day"; }
        else if (final_price <= 70)
        { timeremaininglb.Text = "2 Days"; }
        else if (final_price <= 95)
        { timeremaininglb.Text = "3 Days"; }
        else if (final_price <= 140)
        { timeremaininglb.Text = "4 Days"; }
        else if (final_price <= 200)
        { timeremaininglb.Text = "5 Days"; }
        else if (final_price <= 310)
        { timeremaininglb.Text = "6 Days"; }
        else if (final_price <= 390)
        { timeremaininglb.Text = "7 Days"; }
        else if (final_price <= 450)
        { timeremaininglb.Text = "8 Days"; }
        else if (final_price <= 500)
        { timeremaininglb.Text = "9 Days"; }
        else if (final_price <= 600)
        { timeremaininglb.Text = "10 Days"; }
        else if (final_price <= 700)
        { timeremaininglb.Text = "14+ Days"; }
        else if (final_price <= 900)
        { timeremaininglb.Text = "20+ Days"; }
        else { timeremaininglb.Text = "23+ Days"; }
    }

    void emfanisi_DropDownList7()
    {
        if (Int32.Parse(DropDownList6.SelectedValue) == 6)
        {
            DropDownList7.Visible = false;
        }
        else
        {
            DropDownList7.Visible = true;
        }
    }
    protected void imageallagi3(object sender, EventArgs e)
    {
        allagi_ikonas3();
        ipologismos_posou_gia_option1_boost();
        gettimeremaining();
    }

    int sum_val(int a, int b)
    {
        int sum = 0;
        for (int i = 1; i < a; i++)
        {
            sum += 5;
        }
        for (int i = 6; i > b; i--)
        {
            sum += 1;
        }
        return sum;
    }

    double get_price_division(int a)
    {
        final_price = 0.0;
        for (int i = 1; i < a; i++)
        {
            if ((i < a) && (i < 5))
            {
                final_price += 8;
                final_price = final_price * 1.01;
            }
            else if ((i < a) && (i < 10))
            {
                final_price += 11;
                final_price = final_price * 1.015;
            }
            else if ((i < a) && (i < 15))
            {
                final_price += 13;
                final_price = final_price * 1.019;
            }
            else if ((i < a) && (i < 20))
            {
                final_price += 20;
                final_price = final_price * 1.022;
            }
            else if ((i < a) && (i < 24))
            {
                final_price += 10;
                final_price = final_price * 1.125;
            }
            else if ((i < a) && (i < 25))
            {
                final_price += 105;
            }
            else if ((i < a) && (i < 26))
            {
                final_price += 156;
            }
        }
        return final_price;
    }

    void ipologismos_posou_gia_option1_boost()
    {
        int startval = sum_val(Int32.Parse(DropDownList3.SelectedValue), Int32.Parse(DropDownList4.SelectedValue));
        int endval = sum_val(Int32.Parse(DropDownList6.SelectedValue), Int32.Parse(DropDownList7.SelectedValue));
        final_price = get_price_division(endval) - get_price_division(startval);
        if (check_errors_final_price(final_price) == false)
        {
            if (CheckBox3.Checked == true)
            {
                final_price = final_price * 1.5;
            }
            if (Int32.Parse(DropDownList5.SelectedValue) != 1)
            {
                for (int i = 1; i < Int32.Parse(DropDownList5.SelectedValue); i++)
                {
                    final_price = final_price * 0.97;
                }
            }
            //ekptosi stis times tou eloboost24, na tin bgalo tin ekptosi otan i selida anevei
            final_price = final_price * 1.15;
            Label5.Text = final_price.ToString("#.#") + " Euro";
            double fake_price = final_price * 1.30;
            Labeldeltext2.Text = fake_price.ToString("#") + "Euro";
        }
        else
        {
            Labeldeltext2.Text = "";
            final_price = 0;
            Label5.Text = "Invalid Price";
        }
    }

    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        ipologismos_posou_gia_option1_boost();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label6.Text = "";
        if (final_price != 0)
        {
            //string business = "nuser1@gmail.com";
            string itemName = " Boosting from league: " + getStartLeagueForBoost() + " " + getStartDivisionForBoost() + " " + getStartLpForBoost() + " to " + " " + getFinalLeagueForBoost() + " " + getFinalDivisionForBoost() + " " + getCheckToBoostEanEinaiDuoEpistrofiString() + " " + getSoloFlexCheck() + " " + getserver();
            string itemAmount = final_price.ToString("#.##", CultureInfo.GetCultureInfo("en-GB"));
            string currencyCode = "EUR";

            Session["payment_amt"] = itemAmount;
            Session["BRANDNAME"] = "DivisionBoost.eu";
            Session["item_name"] = itemName;
            Session["currency_code"] = currencyCode;
            Session["StartLeague"] = getStartLeagueForBoost();
            Session["StartDivision"] = getStartDivisionForBoost();
            Session["StartLp"] = getStartLpForBoost();
            Session["EndLeague"] = getFinalLeagueForBoost();
            Session["EndDivision"] = getFinalDivisionForBoost();
            Session["SoloFlex"] = getSoloFlexCheckReturnInt();
            Session["DuoNoDuo"] = getCheckToBoostEanEinaiDuoEpistrofiInt();
            Session["ServerName"] = Int32.Parse(DropDownServer.SelectedValue);
            Session["OrderType"] = 0;
            Session["GamesNumber"] = "";
            Response.Redirect("~/Checkout/CheckoutDetails.aspx");
        }
        else
        {
            Label6.Text = ("Unacceptable - check your Order");
        }
    }
}