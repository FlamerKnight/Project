using Project.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                object returnVal;
                string strName, strAddress, strPhone, strPassword, strEmail, strQuestion, strAnswer;

                int intShopperID = 0;

                strName = nameTextBox.Text;
                strAddress = addressTextbox.Text;
                strPhone = phoneTextbox.Text;
                strEmail = emailTextbox.Text;
                strPassword = pswTextBox.Text.Trim();
               strQuestion = DropDownList1.SelectedValue;
                strAnswer = SecurityTextBox.Text;

                DatabaseMgmt dbObj = new DatabaseMgmt();
                
                string strSqlCmd;
                strSqlCmd = $"select ShopperID from Shopper where Email='{strEmail}'";

                if ((returnVal = (object)dbObj.ExecuteScalar(strSqlCmd)) != null) {
                    intShopperID = Convert.ToInt32(returnVal);
                } else {
                    intShopperID = 0;
                }

                if(intShopperID == 0) {
                    strSqlCmd = $"Insert into Shopper(Name, Address,Phone, Email, Passwd, SecurityQn, QnAnswer) VALUES ('{strName}','{strAddress}'," +
                        $"'{strPhone}','{strEmail}','{strPassword}','{strQuestion}','{strAnswer}')";
                    dbObj.ExecuteNonQuery(strSqlCmd);

                    strSqlCmd = $"select MAX(ShopperID) From Shopper";
                    if ((returnVal = (object)dbObj.ExecuteScalar(strSqlCmd)) != null) {
                        intShopperID = Convert.ToInt32(returnVal);
                    } else {
                        intShopperID = 0;
                    }

                    Session["ShopperID"] = intShopperID;
                    Session["Name"] = strName;
                    Session["Address"] = strAddress;
                    Session["Phone"] = strPhone;
                    Session["Email"] = strEmail;
                    Session["ProfileRetrived"] = 1;
                    msgLabel.Text = "Registration Successful";
                } else {
                    msgLabel.Text = "Please select another email to register";
                }
            } 
        }
    }
}