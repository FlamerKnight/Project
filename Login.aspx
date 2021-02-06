<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="overall">

        <table class="auto-style3">
            <tr>
                <td style="text-align:center;text-shadow:3px;font-size:20px;"colspan="2">Login</td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td class="auto-style1">
                    <asp:TextBox ID="emailTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter Email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password</td>
                <td class="auto-style1">
                    <asp:TextBox ID="pswTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pswTextBox" ErrorMessage="Please enter Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                        <asp:LinkButton CSSClass="button" ID="loginButton" runat="server" OnClick="loginButton_Click">Login</asp:LinkButton>
                    <br />
                        <asp:LinkButton CSSClass="button" ID="ResetButton" runat="server" OnClick="resetButton_Click" CausesValidation="False">Forgot your username/password?</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">
                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                    <br />
                    <asp:HyperLink ID="suggestionHyperLink" runat="server" NavigateUrl="~/ResetEmailorPassword.aspx" Visible="False">[suggestionHyperLink]</asp:HyperLink>
                </td>
            </tr>
        </table>

    </div>
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
            height: 300px;
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

        .auto-style1 {
            width: 408px;
        }
        .auto-style2 {
            text-align:center;
        }
        .auto-style3 {
            width: 480px;
            height: 197px;
        }
        .auto-style4 {
            width: 562px;
            text-align: right;
            vertical-align:top;
    }




        .auto-style5 {
            text-align: center;
            height: 26px;
        }




        </style>
    </asp:Content>
