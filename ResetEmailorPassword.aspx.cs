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
    public partial class ResetEmailorPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(OptionsView);
        }

        protected void ForgotEmailButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(EmailView);
        }


        protected void ForgotPasswordButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(PasswordView);
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {

        }
        protected void BacktoLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            MultiView1.Visible = false;
        }
        protected void EmailContinueButton_Click(object sender, EventArgs e)
        {
            int temp;
            string sqlcmd = $"update shopper set Email = '{emailChangeViewTextBox.Text}' where passwd = '{Session["passwd"]}'";
            DatabaseMgmt dbObj = new DatabaseMgmt();
            temp = dbObj.ExecuteNonQuery(sqlcmd);

            MultiView1.SetActiveView(SuccessView);
        }

        protected void OkayButton_Click(object sender, EventArgs e)
        {

        }
        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            string Question;

            //Read Database
            DatabaseMgmt dbObj = new DatabaseMgmt();
            SqlDataReader dR;
            dbObj.Connect();

            string strSqlCmd;
            strSqlCmd = $"select SecurityQn, QnAnswer, Email, ShopperID from Shopper where Name='{nameEmailViewTextBox.Text}'";

            dR = dbObj.ExecuteSelect(strSqlCmd);
            if (dR.Read())
            {
                Question = dR["QnAnswer"].ToString();
                if (answerEmailViewTextBox.Text == Question)
                {
                    MultiView1.SetActiveView(EmailChangeView);
                    Session["name"] = nameEmailViewTextBox.Text;
                    Session["passwd"] = passwordEmailViewTextBox.Text;

                }
                else
                {
                    MultiView1.SetActiveView(EmailView);
                    QuestionEmailLabel.Text = "Wrong Answer!";
                }
            }
            else
            {
                MultiView1.SetActiveView(EmailView);
                QuestionEmailLabel.Text = "No Account found!";
            }

        }

        protected void EmailDetailsChanged_Changed(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(PasswordView);
            object returnVal;
            string Name;

            //Read Database
            DatabaseMgmt dbObj = new DatabaseMgmt();
            SqlDataReader dR;
            dbObj.Connect();


            string strSqlCmd;
            strSqlCmd = $"select SecurityQn, ShopperID from Shopper where Email='{emailDetailsTextBox.Text}'";

            dR = dbObj.ExecuteSelect(strSqlCmd);
            if (dR.Read())
            {
                SecurityQnLabel.Text = dR["SecurityQn"].ToString();

            }
            else
            {
                SecurityQnLabel.Text = "No Account found!";
            }
        }

        protected void PasswordFormSubmitButton_Click(object sender, EventArgs e)
        {
            string Question;

            //Read Database
            DatabaseMgmt dbObj = new DatabaseMgmt();
            SqlDataReader dR;
            dbObj.Connect();


            string strSqlCmd;
            strSqlCmd = $"select Name, ShopperID, SecurityQn, QnAnswer from Shopper where Email='{emailDetailsTextBox.Text}'";

            dR = dbObj.ExecuteSelect(strSqlCmd);
            if (dR.Read())
            {
                Question = dR["QnAnswer"].ToString();

                if (AnswerTextBox.Text == Question)
                {
                    MultiView1.SetActiveView(PasswordChangeView);
                    Session["email"] = emailDetailsTextBox.Text;
                }
                else
                {
                    SecurityQnLabel.Text = "Wrong";
                    MultiView1.SetActiveView(PasswordView);

                }

            }
            else
            {
                SecurityQnLabel.Text = "No Account found!";
                MultiView1.SetActiveView(PasswordView);
            }
        }

        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
            int temp;
            string sqlcmd = $"update shopper set passwd = '{ConfirmNewPassword.Text}' where Email = '{Session["email"]}'";
            DatabaseMgmt dbObj = new DatabaseMgmt();
            temp = dbObj.ExecuteNonQuery(sqlcmd);

            MultiView1.SetActiveView(SuccessView);
        }

        protected void CancelPushButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(OptionsView);
        }


        protected void getAnswer_Changed(object sender, EventArgs e) {
            string Question;

            //Read Database
            DatabaseMgmt dbObj = new DatabaseMgmt();
            SqlDataReader dR;
            dbObj.Connect();


            string strSqlCmd;
            strSqlCmd = $"select Name, ShopperID, SecurityQn, QnAnswer from Shopper where Name='{nameEmailViewTextBox.Text}' and passwd = '{passwordEmailViewTextBox.Text}'";

            dR = dbObj.ExecuteSelect(strSqlCmd);
            if (dR.Read())
            {
                MultiView1.SetActiveView(EmailView);
                Question = dR["SecurityQn"].ToString();
                QuestionEmailLabel.Text = Question;
            }
            else {
                QuestionEmailLabel.Text = "No Account found";
                MultiView1.SetActiveView(EmailView);
            }
        }
    }
}