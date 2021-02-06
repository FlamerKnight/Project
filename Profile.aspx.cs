using Project.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ShopperID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                DatabaseMgmt objdbMgmt = new DatabaseMgmt();
                SqlDataReader dR;
                objdbMgmt.Connect();

                string strSqlCmd;
                strSqlCmd = $"select address,email,phone, passwd from Shopper where ShopperID='{Session["ShopperId"]}'";
                dR = objdbMgmt.ExecuteSelect(strSqlCmd);

                if(displayNameCheckBox.Checked == true)
                {

                }
                NameLabel.Text = (string)Session["Name"];
                if (dR.Read())
                {
                    PasswordLabel.Text = dR["Passwd"].ToString().Trim();
                    AddressLabel.Text = dR["address"].ToString();
                    EmailLabel.Text = dR["email"].ToString();
                    PhoneLabel.Text = dR["phone"].ToString();
                }
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            
            if (displayNameCheckBox.Checked == true)
            {
                displaynameTextBox.Visible = true;
                displayNameLabel.Visible = false;
            }
            else
            {
                displayNameLabel.Text = "Enable the Display Name setting to use this feature.";
                displayNameLabel.Visible = true;
                displaynameTextBox.Visible = false;
            }
            
            NameLabel.Visible = false;
            PasswordLabel.Visible = false;
            AddressLabel.Visible = false;
            EmailLabel.Visible = false;
            PhoneLabel.Visible = false;

            nameTextBox.Text = NameLabel.Text;
            pswTextBox.Text = PasswordLabel.Text.ToString();
            addressTextbox.Text = AddressLabel.Text;
            emailTextbox.Text = EmailLabel.Text;
            phoneTextBox.Text = PhoneLabel.Text;

            nameTextBox.Visible = true;
            pswTextBox.Visible = true;
            addressTextbox.Visible = true;
            emailTextbox.Visible = true;
            phoneTextBox.Visible = true;

            ConfirmButton.Visible = true;
            backButton.Visible = true;
            EditButton.Visible = false;
            msgLabel.Text = "";
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            int temp;
            string sqlcmd = $"update shopper set address = '{addressTextbox.Text}', email = '{emailTextbox.Text}', passwd = '{pswTextBox.Text}', phone = '{phoneTextBox.Text}' where shopperid = '{Session["ShopperId"]}'";
            DatabaseMgmt dbObj = new DatabaseMgmt();
            temp = dbObj.ExecuteNonQuery(sqlcmd);
            
            //Read the Database.
            DatabaseMgmt objdbMgmt = new DatabaseMgmt();
            SqlDataReader dR;
            objdbMgmt.Connect();
            
            string strSqlCmd;
            strSqlCmd = $"select address,email,phone, passwd from Shopper where ShopperID='{Session["ShopperId"]}'";
            
            dR = dbObj.ExecuteSelect(strSqlCmd);
            NameLabel.Text = (string)Session["Name"];
            if (dR.Read())
            {
                AddressLabel.Text = dR["address"].ToString();
                EmailLabel.Text = dR["email"].ToString();
                PhoneLabel.Text = dR["phone"].ToString();
            }
           
             int other;
            string sqlcommands = $"Insert into shopper (DisplayName) VALUES ('{displaynameTextBox.Text}')" + $"Select DisplayName from ShopperID where ShopperID = '{Session["ShopperID"]}'";

            if (displayNameCheckBox.Checked == true)
            {
                DatabaseMgmt db = new DatabaseMgmt();    
                other = db.ExecuteNonQuery(sqlcommands);
                
                objdbMgmt.Connect();
            
                string strSqlCmds;
                strSqlCmds = $"select DisplayName from Shopper where ShopperID='{Session["ShopperId"]}'";
                dR = db.ExecuteSelect(strSqlCmds);
                if(dR.Read()){
                displayNameLabel.Text = dR["DisplayName"].ToString();
                }
            }

                else
                {
                    displayNameLabel.Text = "Unused";
                }
            
            msgLabel.Text = "Updated Information!";

            NameLabel.Visible = true;
            PasswordLabel.Visible = true;
            AddressLabel.Visible = true;
            EmailLabel.Visible = true;
            PhoneLabel.Visible = true;

            
            nameTextBox.Visible = false;
            pswTextBox.Visible = false;
            addressTextbox.Visible = false;
            emailTextbox.Visible = false;
            phoneTextBox.Visible = false;
            
            if (displaynameTextBox.Visible == true)
            {
                displaynameTextBox.Visible = false;
            }
            
            ConfirmButton.Visible = false;
            backButton.Visible = false;
            EditButton.Visible = true;

        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            NameLabel.Visible = true;
            PasswordLabel.Visible = true;
            AddressLabel.Visible = true;
            EmailLabel.Visible = true;
            PhoneLabel.Visible = true;

            nameTextBox.Visible = false;
            pswTextBox.Visible = false;
            addressTextbox.Visible = false;
            emailTextbox.Visible = false;
            phoneTextBox.Visible = false;

            ConfirmButton.Visible = false;
            backButton.Visible = false;
            EditButton.Visible = true;

            msgLabel.Text = "Discarded Changes.";
        }
        
        protected void DisplayName_Checked(object sender, EventArgs e)
        {
            if(displayNameCheckBox.Checked == true)
            {
                
            }
        }
        
    }
}