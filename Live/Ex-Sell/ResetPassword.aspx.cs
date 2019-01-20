using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using DataAccessLayer;

namespace Ex_Sell.WebPage
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bn_reset_Click(object sender, EventArgs e)
        {
            string email = tb_email.Text;
            AccountBLL accBLL = new AccountBLL();
            if (accBLL.verifyUser(email) != null)
            {
                lb_msg.Text = accBLL.ForgetPassword(email);
            }
        }
    }
}