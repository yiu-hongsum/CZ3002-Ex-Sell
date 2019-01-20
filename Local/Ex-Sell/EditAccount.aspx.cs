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
    public partial class EditAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    AccountBLL accBLL = new AccountBLL();
                    string email = Session["email"].ToString();
                    tb_email.Text = email;
                    tb_name.Text = accBLL.getCurrentAccount(email).Name.ToString();
                    tb_phone.Text = accBLL.getCurrentAccount(email).PhoneNo.ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void bn_update_Click(object sender, EventArgs e)
        {
            string email = tb_email.Text;
            string password = tb_password.Text;
            string cpassword = tb_cpassword.Text;
            string name = tb_name.Text;
            string phoneno = tb_phone.Text;

            AccountBLL accBLL = new AccountBLL();

            if ((password == cpassword) && password != "")
            {
                lb_msg.Text = accBLL.UpdateAccount(email, password, name, phoneno);
            }
            else if (password != cpassword)
            {
                lb_msg.Text = "Password entered is not the same. Please enter password and confirm password!";
            }
            else if (password == "" && cpassword == "")
            {
                lb_msg.Text = accBLL.UpdateAccount(email, name, phoneno);
            }
        }

        protected void bn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}