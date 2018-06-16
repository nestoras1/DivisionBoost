using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using MySql.Data.MySqlClient;

public partial class resetpassword : System.Web.UI.Page
{
    String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=username;Pwd=password;";
    object id = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == TextBox2.Text)
        {
            if (TextBox1.Text.Length > 7)
            {
                try
                {
                    string ForgotCode = !string.IsNullOrEmpty(Request.QueryString["ForgotCode"]) ? Request.QueryString["ForgotCode"] : Guid.Empty.ToString();
                    using (MySqlConnection con = new MySqlConnection(connectionString))
                    {
                        MySqlCommand command_activated_id = new MySqlCommand("Select UserId FROM UserActivation WHERE ForgotCode = @ForgotCode", con);
                        con.Open();
                        DataTable dt1 = new DataTable();
                        MySqlDataAdapter da = new MySqlDataAdapter();
                        command_activated_id.CommandType = CommandType.Text;
                        command_activated_id.Parameters.AddWithValue("@ForgotCode", ForgotCode);
                        da.SelectCommand = command_activated_id;
                        da.Fill(dt1);
                        id = dt1.Rows[0][0].ToString();
                        using (MySqlCommand cmd = new MySqlCommand("DELETE FROM UserActivation WHERE ForgotCode = @ForgotCode"))
                        {
                            using (MySqlDataAdapter sda = new MySqlDataAdapter())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("@ForgotCode", ForgotCode);
                                cmd.Connection = con;

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected == 1)
                                {
                                    MySqlCommand command_activated_code = new MySqlCommand("UPDATE Accounts SET password= @Password WHERE id = '" + Convert.ToInt32(id) + "'", con);
                                    command_activated_code.CommandType = CommandType.Text;

                                    command_activated_code.Parameters.AddWithValue("@Password", TextBox1.Text);
                                    command_activated_code.Connection = con;
                                    command_activated_code.ExecuteNonQuery();

                                    //ltMessage.Text = "Activation successful.";
                                }
                                else
                                {
                                    //ltMessage.Text = "Invalid Activation code.";
                                }
                                con.Close();
                            }
                        }
                    }
                    Response.Redirect("~/Index.aspx");
                }
                catch
                {
                    Response.Redirect("~/Index.aspx");
                }
            }
            else
            {
                errormsglb.Text = "Password is too weak";
            }
        }
        else
        {
            errormsglb.Text = "Password don't match";
        }
            
    }
}