using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSupport
{
    public partial class OperatorLogin : System.Web.UI.Page
    {
        //public static bool operator_online = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_btn_Click(object sender, EventArgs e)
        {
            if (tb_password.Text == "admin" && tb_user.Text == "admin")
            {
                //Session.Abandon();
                Session["OperatorOnline"] = true;
                //operator_online = true;
                string temp = Session["OperatorOnline"].ToString();
                HttpCookie myCookie = new HttpCookie("UsernameCookie");
                myCookie.Value = "Operator";
                Response.Cookies.Add(myCookie);
                Response.Redirect("OnlineSupport.aspx", true);
                //Server.Transfer("onlinesupport.aspx");
            }
            else
            {
                lb_msg.Text = "Username/Password is wrong! Please try again!";
            }
        }
    }
}