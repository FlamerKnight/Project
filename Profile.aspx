<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project.Profile" %>
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
            .auto-style10 {
                text-align: right;
                vertical-align: top;
                height: 24px;
            }
            .auto-style11 {
                width: 119px;
                text-align: right;
                vertical-align: top;
                height: 27px;
            }
            .auto-style12 {
                width: 351px;
                text-align: left;
                height: 27px;
            }
            .auto-style13 {
                width: 119px;
                text-align: right;
                vertical-align: top;
                height: 49px;
            }
            .auto-style14 {
                width: 351px;
                text-align: left;
                height: 49px;
            }
            .BackButton {
                height: 29px;
            }
            .auto-style16 {
                width: 119px;
                text-align: right;
                vertical-align: top;
            }
            .auto-style17 {
                width: 351px;
                text-align: left;
            }
            .auto-style18 {
                width: 119px;
                text-align: right;
                vertical-align: top;
                height: 24px;
            }
            .auto-style19 {
                width: 351px;
                text-align: left;
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
                <td style="text-align:center;text-shadow:3px;"colspan="2" class="auto-style5">Profile</td>
            </tr>
                       <tr>
                <td class="auto-style16">Display Name:</td>
                <td class="auto-style17">
                    <asp:Label ID="displayNameLabel" runat="server" Text="Unused" CssClass="DisplayNameLabel"></asp:Label>
                    <asp:TextBox ID="displaynameTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Visible="False"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter a name which is between 7 to 15 letters" ControlToValidate="displaynameTextBox" ForeColor="Red" MaximumValue="15" MinimumValue="7" Visible="False"></asp:RangeValidator>
                    <br />
                    <br />
                    <br />
                    <asp:CheckBox ID="displayNameCheckBox" runat="server" Text="Use your Display Name" OnCheckedChanged ="DisplayName_Checked" />

                </td>
            </tr>
            <tr>
                <td class="auto-style16">Name:</td>
                <td class="auto-style17">
                    <asp:Label ID="NameLabel" runat="server" Text="Name" CssClass="NameLabel"></asp:Label>
                    <asp:TextBox ID="nameTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Password: </td>
                <td class="auto-style12">
                    <asp:Label ID="PasswordLabel" runat="server" Text="Password" CssClass="PasswordLabel"></asp:Label> 
                    <asp:TextBox ID="pswTextBox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password" Visible="False" SkinID="*" CssClass="pswTextBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    Address:</td>
                <td class="auto-style14">
                    <asp:Label ID="AddressLabel" runat="server" Text="Address" CssClass="AddressLabel"></asp:Label>
                    <asp:TextBox ID="addressTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    Email:</td>
                <td class="auto-style19">

                    <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="emailTextbox" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Visible="False"></asp:TextBox>

                    <br />

                    </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    Phone: </td>
                <td class="auto-style19">
                    <asp:Label ID="PhoneLabel" runat="server" Text="Phone" CssClass="PhoneLabel"></asp:Label>

                    <asp:TextBox ID="phoneTextBox" runat="server" Visible="False"></asp:TextBox>
                    <br />

                    <br />
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style10" colspan="2">
                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                        <asp:Button ID="backButton" runat="server" CssClass="BackButton" OnClick="backButton_Click" Text="Back" Visible="False" />
                      <asp:Button ID="EditButton" runat="server" CssClass="EditButton" OnClick="EditButton_Click" Text="Edit Information" />
        <asp:Button ID="ConfirmButton" runat="server" CssClass="ConfirmButton" Text="Update Information" OnClick="Update_Click" Visible="False" />
                </td>
            </tr>
        </table>
          <td class="auto-style2" colspan="2">
              </td>
    </div>

</asp:Content>
