using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using BusinessLogicLayer;
using DataAccessLayer;

namespace Ex_Sell.WebPage
{
    public partial class NewListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    ddl_category.Items.Insert(0, new ListItem("Select a Category", "0"));
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void bn_create_Click(object sender, EventArgs e)
        {
            string imagePath = "";
            if ((tb_name.Text != "") && (tb_quantity.Text != "") && (tb_price.Text != "") && (tb_description.Text != "") &&
                (tb_price.Text != ""))
            {
                if (fu_img.HasFile)
                {
                    imagePath = Path.GetFileName(fu_img.FileName);
                    fu_img.SaveAs(Server.MapPath("~/Images/Product/" + fu_img.FileName));
                    ProductBLL prodBLL = new ProductBLL();
                    Product prod = new Product();
                    int userid = Convert.ToInt32(Session["userid"]);
                    string datetime = DateTime.Now.ToString();
                    string msg = prodBLL.CreateProduct(tb_name.Text, Convert.ToInt32(tb_quantity.Text), Convert.ToDouble(tb_price.Text), tb_description.Text, ddl_category.Items[ddl_category.SelectedIndex].Value.ToString(), imagePath, datetime, userid);

                    tb_name.Text = "";
                    tb_description.Text = "";
                    tb_quantity.Text = "";
                    tb_price.Text = "";
                    ddl_category.SelectedIndex = 0;
                    lb_msg.Text = msg;
                }
                else
                {
                    lb_msg.Text = "Please upload an image file! (PNG/JPG/JPEG)";
                    lb_msg.Visible = true;
                }
            }

            else
            {
                lb_msg.Text = "Please enter all fields";
            }
        }
    }
}