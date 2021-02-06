<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ResetEmailorPassword.aspx.cs" Inherits="Project.ResetEmailorPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <style>
            .overall{
                background-color: snow;
                width: 480px;
                height: 188px;
                border:1px solid #dadce0;
                border-radius:10px;
                margin:0 auto;
                box-shadow:5px;
           
                justify-content: center;
                align-items: center;
                height: auto;
            }

            .button{
                background-color: white;
                border:1px solid #dadce0;
                padding: 10px;
                display: inline-block;
                margin: 4px 2px;
                border-radius:10px;
                color:black;
                text-align: center;
                text-decoration: none;

            }

            .button a{
                color:black;
                text-align: center;
                text-decoration: none;
            }

            .rightcolumn {
                width: 408px;
                text-align:left;
            }
            .auto-style3 {
                width: 480px;
                height: 197px;
            }
            .leftcolumn {
                width: 562px;
                text-align: right;
                vertical-align:top;
        }
            .auto-style5 {
                font-size: 20px;
                height: 55px;
            }
            .BackButton {
                height: 29px;
            }
                .auto-style6 {
                    height: 32px;
                }
                .auto-style7 {
                    height: 24px;
                }
                .auto-style8 {
                    width: 562px;
                    text-align: right;
                    vertical-align: top;
                    height: 71px;
                }
                .auto-style9 {
                    width: 408px;
                    text-align: left;
                    height: 71px;
                }
                .answerEmailViewTextBox {
                    height: 23px;
                }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">


            <asp:View ID="SuccessView" runat="server" >
                <asp:Label ID="Label1" runat="server" Text="Details Changed."></asp:Label>
                <br />
                <asp:Button ID="BacktoLoginButton" runat="server" Text="Back to Login" OnClick="BacktoLogin_Click" />
            </asp:View>
            <asp:View ID="EmailChangeView" runat="server">
                <table class="auto-style3">
            <tr>
                <td style="text-align:center;text-shadow:3px;"colspan="2" class="auto-style5">Change Email</td>
            </tr>
            <tr>
                <td class="leftcolumn">Email: </td>
                <td class="rightcolumn">
                    <asp:TextBox ID="emailChangeViewTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailChangeViewTextBox" ErrorMessage="Please enter your Email" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />

                </td>
            <tr>
                <td class="leftcolumn">&nbsp;</td>
                <td class="rightcolumn">
                    <asp:Button ID="EmailtoContinueButton" runat="server" Text="Continue" OnClick="EmailContinueButton_Click" />
                </td>
            </tr>
            </asp:View>
            <asp:View ID="OptionsView" runat="server">
                <asp:Button ID="forgotEmailButton" runat="server" Text="Forgot Email" OnClick="ForgotEmailButton_Click" />
                <br />
                <br />
                <br />

                <asp:Button ID="forgotPasswordButton" runat="server" Text="Forgot Password" OnClick="ForgotPasswordButton_Click" />
            </asp:View>
            <asp:View ID="ErrorView" runat="server">
                <asp:Label ID="ErrorLabel" runat="server" Text="Error, Incorrect or Unavailable information!"></asp:Label>
                <br />
                <br />
                <asp:Button ID="returnButton" runat="server" Text="Back" OnClick="ReturnButton_Click" />
                <asp:Button ID="okayButton" runat="server" Text="Edit" OnClick="OkayButton_Click" style="height: 29px; width: 42px" />
            </asp:View>
            <asp:View ID="EmailView" runat="server">
     <div class="overall">

        <table class="auto-style3">
            <tr>
                <td style="text-align:center;text-shadow:3px;"colspan="2" class="auto-style5">Email Recovery</td>
            </tr>
            <tr>
                <td class="leftcolumn">Name: </td>
                <td class="rightcolumn">
                    <asp:TextBox ID="nameEmailViewTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" OnTextChanged="getAnswer_Changed" AutoPostBack="True"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="nameDetailsValidator" runat="server" ControlToValidate="nameEmailViewTextBox" ErrorMessage="Please enter your Name" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />

                </td>
            </tr>
                        <tr>
                <td class="leftcolumn">Enter Password: </td>
                <td class="rightcolumn">
                    <asp:TextBox ID="passwordEmailViewTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" onTextChanged="getAnswer_Changed" AutoPostBack="True"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="passwordEmailViewTextBox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />

                </td>
                    <tr>
                        <td align="center" colspan="2" class="auto-style7">Security Question: 
                        <asp:Label ID="QuestionEmailLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Answer: </td>
                <td class="auto-style9">
                    <asp:TextBox ID="answerEmailViewTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CssClass="answerEmailViewTextBox"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="answerEmailViewTextBox" ErrorMessage="Please enter your Security Question!" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />

                </td>
            </tr>
            <tr>
                <td class="leftcolumn">&nbsp;</td>
                <td class="rightcolumn">
                    <asp:Button ID="continueButton" runat="server" Text="Continue" OnClick="ContinueButton_Click" />
                </td>
            </tr>
            </asp:View>
            <asp:View ID="PasswordChangeView" runat="server">
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">Change Your Password</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" OnClick="ChangePasswordPushButton_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="CancelPushButton_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                </asp:ChangePassword>
            </asp:View>
            <asp:View ID="PasswordView" runat="server">
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">Forgot Your Password?</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">Enter your Password and security question to change your password.</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style6">
                                                <asp:Label ID="EmailLabel" runat="server"> Email Detail:</asp:Label>
                                            </td>
                                            <td class="auto-style6">
                                                <asp:TextBox ID="emailDetailsTextBox" runat="server" CssClass="emailDetailsTextBox" onTextChanged="EmailDetailsChanged_Changed" AutoPostBack="True"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailDetailsTextBox" ErrorMessage="Your email is required." ToolTip="Email is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                            </td>

                                        </tr>
                                                                                <tr>
                                            <td align="center" colspan="2" class="auto-style7">Security Question: 
                                                <asp:Label ID="SecurityQnLabel" runat="server" Text="Label"></asp:Label>
                                                                                    </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="answerLabel" runat="server"> Answer:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="AnswerTextBox" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AnswerTextBox" ErrorMessage="Your Answer is required." ToolTip="Answer is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="PasswordFormSubmitButton" runat="server" CommandName="Submit" OnClick="PasswordFormSubmitButton_Click" Text="Submit" ValidationGroup="PasswordRecovery1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                </asp:PasswordRecovery>
            </asp:View>
        </asp:MultiView>
  </asp:Content>
