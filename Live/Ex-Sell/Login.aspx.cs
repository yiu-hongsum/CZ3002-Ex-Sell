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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void bn_signup_Click(object sender, EventArgs e)
        {
            string email = tb_regemail.Text.ToLower() + tb_domain.Text;
            string name = tb_name.Text;
            string password = tb_regpassword.Text;
            string confirm = tb_regcpassword.Text;
            string phone = tb_phone.Text;

            AccountBLL accBLL = new AccountBLL();

            if (password.Equals(confirm))
            {
                lb_msg2.Text = accBLL.CreateUser(email, name, password, phone);
                tb_regemail.Text = "";
                tb_name.Text = "";
                tb_regpassword.Text = "";
                tb_regcpassword.Text = "";
                tb_phone.Text = "";
            }
            else
            {
                lb_msg2.Text = "Password and Confirm Password are not the same!";
            }
        }

        protected void rbl_role_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rbl_role.SelectedIndex == 1)
            {
                tb_domain.Text = "@ntu.edu.sg";
            }
            else
            {
                tb_domain.Text = "@e.ntu.edu.sg";
            }
        }
    }
}