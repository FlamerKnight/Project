<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project.Register" %>
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
            .auto-style2 {
                text-align:center;
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
            .auto-style6 {
                width: 562px;
                text-align: right;
                vertical-align: top;
                height: 43px;
            }
            .auto-style7 {
                width: 408px;
                text-align: left;
                height: 43px;
            }
            .auto-style8 {
                width: 562px;
                text-align: right;
                vertical-align: top;
                height: 24px;
            }
            .auto-style9 {
                width: 408px;
                text-align: left;
                height: 24px;
            }
            .auto-style10 {
                text-align: right;
                vertical-align: top;
                height: 24px;
            }
        </style>
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
                <td style="text-align:center;text-shadow:3px;"colspan="2" class="auto-style5">Registration</td>
            </tr>
            <tr>
                <td class="leftcolumn">Name</td>
                <td class="rightcolumn">
                    <asp:TextBox ID="nameTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="nameTextBox" ErrorMessage="Please enter your Name" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="leftcolumn">Password</td>
                <td class="rightcolumn">
                    <asp:TextBox ID="pswTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="pswValidator" runat="server" ControlToValidate="pswTextBox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    Retype Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="pswReTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="pswReValidator" runat="server" ControlToValidate="pswReTextBox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="passwordCValidator" runat="server" ControlToCompare="pswTextBox" ControlToValidate="pswReTextbox" ErrorMessage="CompareValidator"></asp:CompareValidator>
                    </td>
            </tr>
            <tr>
                <td class="leftcolumn">
                    Address</td>
                <td class="rightcolumn">
                    <asp:TextBox ID="addressTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="addressValidator" runat="server" ControlToValidate="addressTextbox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    Email</td>
                <td class="auto-style9">
                    <asp:TextBox ID="emailTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailTextbox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    Phone:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="phoneTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="phoneValidator" runat="server" ControlToValidate="phoneTextbox" ErrorMessage="Please enter your password" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                </td>
            </tr>
                   <tr>
                <td class="auto-style8">
                    Security Question:</td>
                <td class="auto-style9">

                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True">What is your pet name?</asp:ListItem>
                        <asp:ListItem>Where did your parents meet?</asp:ListItem>
                        <asp:ListItem>test</asp:ListItem>
                    </asp:DropDownList>

                    <asp:TextBox ID="SecurityTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SecurityTextbox" ErrorMessage="Please enter your answer." ForeColor="#FF5050"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style10" colspan="2">
                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                        <asp:LinkButton CSSClass="button" ID="RegisterButton" runat="server" OnClick="RegisterButton_Click">Register</asp:LinkButton>
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
