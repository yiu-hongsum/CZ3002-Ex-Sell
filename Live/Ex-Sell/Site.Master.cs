using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using DataAccessLayer;

namespace Ex_Sell
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string temp = Convert.ToString(Session["Login"]);
            if (!IsPostBack)
            {
                if (Convert.ToString(Session["Login"]) == "true")
                {

                    navigationBar.InnerHtml = "";
                    navigationBar.InnerHtml = "<li class='pull-left'><a href='Operator.aspx'>Live Support</a></li><li class='pull-left'><a href='Interest.aspx'>My Interests</a></li><li class='pull-left'><a href='Home.aspx'>Home</a></li><li class='pull-left'><a href='EditAccount.aspx'> Profile </a></li><li class='pull-left'><a href='OwnListing.aspx'>My Listings </a></li><li class='pull-left'><a href='NewListing.aspx'> Sell </a></li><li class='pull-left'><a href='Logout.aspx'> Log Out </a></li>";
                }
                else
                {
                    navigationBar.InnerHtml = "";
                    navigationBar.InnerHtml = "<li class='pull-left'><button type='button' style='margin-top:10px;background-color:rgba(0,0,0,0);color:white;' data-toggle='modal' data-target='#myModal'>Login</button></li>";
                }

            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode(txtSearchMaster.Text); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }
        protected void lb_reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword.aspx");
        }
        protected void bn_login_Click(object sender, EventArgs e)
        {
            string email = tb_email.Text.ToLower();
            string password = tb_password.Text;
            AccountBLL accBLL = new AccountBLL();
            accBLL.getUser(email, password);
            //string ID = accBLL.getUser(userID, password).Account_ID.ToString();
            if (accBLL.getUser(email, password) != null)
            {
                //string test = accBLL.getUser(email, password).Name.ToString();
                Session["name"] = accBLL.getUser(email, password).Name.ToString();
                //string temp = Session["name"].ToString();
                Session["email"] = email;
                Session["userid"] = accBLL.getUser(email, password).UserID.ToString();
                Session["Login"] = "true";
                Response.Redirect("Home.aspx");
            }
            else
            {
                lb_msg.Text = "Username/Password is wrong.";
            }
        }
    }
}