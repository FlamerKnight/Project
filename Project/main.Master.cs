﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Project.App_Code;

namespace Project
{
    public partial class main : System.Web.UI.MasterPage
    {
        int itemnum;
        protected void Page_Load(object sender, EventArgs e)
        {

            DatabaseMgmt objdbMgmt = new DatabaseMgmt();
            string strSqlCmd;
            SqlDataReader dR;

            if (Session["ShopperID"] != null) {
                LogoutButton.Visible = true;
                RegisterButton.Visible = false;
                loginsButton.Visible = false;
                SellButton.Visible = true;
                ProfileButton.Visible = true;
                Shopping_cartBtn.Visible = true;
                CheckoutBtn.Visible = true;

                ProfileButton.Text = $"Welcome , {Session["Name"]}";
            } else {
                RegisterButton.Visible = true;
                LogoutButton.Visible = false;
                loginsButton.Visible = true;
                SellButton.Visible = false;
                ProfileButton.Visible = false;
                Shopping_cartBtn.Visible = false;
                CheckoutBtn.Visible = false;
            }

            if (Session["ShopCartId"] != null) {
                strSqlCmd = $"select quantity from shopcartitem where shopcartid = '{Session["ShopCartId"]}'";
                dR = objdbMgmt.ExecuteSelect(strSqlCmd);

                while (dR.Read()) {
                    itemnum = itemnum + int.Parse(dR["quantity"].ToString());
                }
                Shopping_cartBtn.Text = $"Shop Cart ({itemnum})";
            }
                

        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void CatalogButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalog.aspx");
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        //Faster redirect to catalog page
        protected void CatalogStationary_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeProduct.aspx?DeptID=1");
        }



        protected void SellButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sell.aspx");
        }

        protected void CatalogSnacks_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeProduct.aspx?DeptID=2");
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {

        }

        protected void CheckoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shipping.aspx");    
        }

        protected void Shopping_cartBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShopCart.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect($"TypeProduct.aspx?search={tbSearch.Text}");
        }

        protected void CatalogBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeProduct.aspx?DeptID=3");
        }

        protected void CatalogClothes_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeProduct.aspx?DeptID=4");
        }

        protected void CatalogManga_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeProduct.aspx?DeptID=5");
        }
    }
}