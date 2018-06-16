using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for AccountManager
/// </summary>
public class AccountManager
{
    static String connectionString = @"Server=db54.grserver.gr;Database=db_divisionboost;Uid=nuser1;Pwd=pass;";
    object obj;
    public static String regerror_message = "";
    public AccountManager()
    {
       
        
         
    }

    public static Boolean IsUsernameValid(string username)
    {
        return Regex.IsMatch(username, @"^(?=.{5,15})");
    }

    public static Boolean IsPassValid(string Passwd)
    {
        return Regex.IsMatch(Passwd, @"^(?=.*[a-z])(?=.*\d).{8,15}$");
    }

    public static Boolean IsEmailValid(string EmailAddr)
    {
        return Regex.IsMatch(EmailAddr, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
    }

    public static void registerAccount(String username, String email, String pass, String pass2)
    {
        if (IsUsernameValid(username))
        {
            if (IsPassValid(pass))
            {
                if ((pass == pass2) && IsEmailValid(email))
                {

                    MySqlConnection con = new MySqlConnection(connectionString);
                    con.Open();
                    DataTable dt1 = new DataTable();
                    MySqlDataAdapter da = new MySqlDataAdapter();
                    try
                    {
                        MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM `accounts` WHERE `username`=@UserName or `email`=@email;", con);
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@UserName", username);
                        cmd.Parameters.AddWithValue("@email", email);
                        da.SelectCommand = cmd;
                        da.Fill(dt1);
                        if (dt1.Rows[0][0].ToString() == "0")
                        {
                            cmd.CommandText = "INSERT INTO accounts (username,password,email,AccDateCreation) VALUES (?username,?password,?email,?AccDateCreation);";
                            cmd.Parameters.AddWithValue("?username", username);
                            cmd.Parameters.AddWithValue("?password", pass);
                            cmd.Parameters.AddWithValue("?email", email);
                            cmd.Parameters.AddWithValue("?AccDateCreation", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                            cmd.ExecuteNonQuery();
                            setregerror_message("");
                            try
                            {
                                using (MailMessage mm = new MailMessage("info@divisionboost.eu", email))
                                {
                                    mm.Subject = "Welcome to DivisionBoost";
                                    string body = "<img src=\"https://divisionboost.eu/images/DBLogo.png \" height=\"55px\" width=\"53px\"></img> </br>Hello " + username + ",";
                                    body += "<br /><br />Welcome to DivisionBoost and thanks for signing up!";
                                    body += "<br />We hope you enjoy this opportunity to trust us for your Boosting! <br /><br />So please don't hesitate to get in contact with us via LiveChat or at support@divisionboost.eu, even if it's just to say Hi! <br />Or you can just reply to this email and one of the team will get back to you.</br></br></br></br>";
                                    body += "<h3><b>Have a great day</b></h3>The DivisionBoost Team";
                                    //body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CS.aspx", "CS_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";

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
                        else
                        {
                            con.Close();
                            setregerror_message("Username or E-mail already exists");
                        }

                        con.Close();
                    }
                    catch
                    {
                        con.Close();
                        setregerror_message("Invalid username or password");
                    }

                }
                else
                {
                    setregerror_message("E-mail or password field are not the same or veiled!");
                }
            }
            else
            {
                setregerror_message("Password must contain at least 8-15 character, one uppercase and one number");
            }
        }
        else
        {
            setregerror_message("Username must contain at least 5-15 character");
        }
    }   
    public static void setregerror_message(String regerror_message1)
    {
        regerror_message = regerror_message1;
    }

    public static string returnregerror()
    {
       return regerror_message;
    }
    
    public static void forgotpassword(String username)
    {
        
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            DataTable dt1 = new DataTable();
            DataTable datat1 = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            MySqlDataAdapter sda1 = new MySqlDataAdapter();
            string ForgotCode = Guid.NewGuid().ToString();

            MySqlCommand cmd = new MySqlCommand("SELECT id,email FROM `accounts` WHERE `username`=@UserName or `email`=@email;", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@UserName", username);
            cmd.Parameters.AddWithValue("@email", username);
            da.SelectCommand = cmd;
            da.Fill(dt1);

        if (dt1.Rows[0][0].ToString() != "")
        {
            try
            {
                MySqlCommand cmd1 = new MySqlCommand("INSERT INTO useractivation (UserId,ForgotCode) VALUES(@UserId, @ForgotCode);");
                cmd1.CommandType = CommandType.Text;
                cmd1.Parameters.AddWithValue("@UserId", dt1.Rows[0][0].ToString());
                cmd1.Parameters.AddWithValue("@ForgotCode", ForgotCode);
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();

            }
            catch
            {
                MySqlCommand cmd2 = new MySqlCommand("SELECT ForgotCode FROM `useractivation` WHERE `UserId`=@id;", con);
                cmd2.CommandType = CommandType.Text;
                cmd2.Parameters.AddWithValue("@id", dt1.Rows[0][0].ToString());
                sda1.SelectCommand = cmd2;
                sda1.Fill(datat1);
                ForgotCode = datat1.Rows[0][0].ToString();
            }
            con.Close();

            using (MailMessage mm = new MailMessage("info@divisionboost.eu", dt1.Rows[0][1].ToString()))
            {
                mm.Subject = "Forgot Account";
                string body = "<img src=\"https://divisionboost.eu/images/DBLogo.png \" height=\"55px\" width=\"53px\"></img> </br>Dear " + username + ",";
                body += "<br /><br />Please click the following link to reset your password";
                body += "<br /><a href = 'https://divisionboost.eu/resetpassword.aspx?ForgotCode=" + ForgotCode + "'>Click here to reset your account.</a>";
                //body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CS.aspx", "CS_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                body += "<br /><br />Please don't hesitate to get in contact with us via LiveChat or at support@divisionboost.eu, even if it's just to say Hi! </br></br></br></br>";
                body += "<h3><b>Have a great day</b></h3>The DivisionBoost Team";
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


    }
}