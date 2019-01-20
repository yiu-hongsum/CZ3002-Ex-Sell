using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ex_Sell.WebPage
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToString(Session["Login"]) == "true")
            {
                Session.Abandon();
                Session["Login"] = "false";
                Response.Redirect("Login.aspx");

            }
        }
    }
}