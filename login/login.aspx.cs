using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class login_login : System.Web.UI.Page
{
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=nuser1;Pwd=pass;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Response.Redirect("../index.aspx");
        }

    }


    protected void bt_login_Click(object sender, EventArgs e)
    {
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        DataTable dt1 = new DataTable();
        MySqlDataAdapter da = new MySqlDataAdapter();

        try
        {
            MySqlCommand cmd = new MySqlCommand("SELECT `id`, `username`, `email`, `account_type` FROM `accounts` WHERE `username`=@UserName and password=@password;", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@UserName", text_username.Text);
            cmd.Parameters.AddWithValue("@Password", text_password.Text);
            da.SelectCommand = cmd;
            da.Fill(dt1);
            Session["id"] = dt1.Rows[0][0].ToString();
            Session["user"] = dt1.Rows[0][1].ToString();
            Session["email"] = dt1.Rows[0][2].ToString();
            Session["account_type"] = dt1.Rows[0][3].ToString();
            Response.Redirect("../Index.aspx");
            con.Close();
        }
        catch
        {
            text_username.Text = "";
            text_password.Text = "";
            con.Close();
            label_wrong_user_pass.Text = "Invalid username or password";
        }
    }
}