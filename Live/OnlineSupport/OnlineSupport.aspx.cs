using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSupport
{
    public partial class OnlineSupport : System.Web.UI.Page
    {
        public static string user;
        public static bool operator_online;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.Count > 0)
            {
                user = Request.Form["Name"];
            }
            else if (Session["OperatorOnline"] != null)
            {
                operator_online = true;
            }

        }

        protected void bn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.Scheme + "://" + ConfigurationManager.AppSettings["ExSellHost"] + "Home.aspx");
        }
    }
}