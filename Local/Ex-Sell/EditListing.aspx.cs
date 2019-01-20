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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    string prodid = Session["id"].ToString();
                    string userid = Session["userid"].ToString();
                    ProductBLL prodBLL = new ProductBLL();
                    tb_name.Text = prodBLL.getProduct(prodid).ProductName.ToString();
                    tb_price.Text = prodBLL.getProduct(prodid).Price.ToString();
                    tb_description.Text = prodBLL.getProduct(prodid).ProductDetails.ToString();
                    tb_quantity.Text = prodBLL.getProduct(prodid).ProductQuantity.ToString();
                    ddl_category.SelectedValue = prodBLL.getProduct(prodid).Category.ToString();
                    string fileName = prodBLL.getProduct(prodid).ImageID.ToString();
                    Image1.ImageUrl = "~/Images/Product/" + fileName;
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void bn_update_Click(object sender, EventArgs e)
        {
            string imagePath = "";
            ProductBLL prodBLL = new ProductBLL();
            Product prod = new Product();
            string temp = tb_name.Text;
            if ((tb_name.Text != "") && (tb_quantity.Text != "") && (tb_price.Text != "") && (tb_description.Text != "") &&
                (tb_price.Text != ""))
            {
                if (fu_img.HasFile)
                {

                    imagePath = Path.GetFileName(fu_img.FileName);
                    fu_img.SaveAs(Server.MapPath("~/Images/Product/" + fu_img.FileName));
                }
                else
                {
                    imagePath = Path.GetFileName(Image1.ImageUrl.ToString());
                }

                int userid = Convert.ToInt32(Session["userid"]);
                string datetime = DateTime.Now.ToString();
                string msg = prodBLL.UpdateProduct(Convert.ToInt32(Session["id"].ToString()), tb_name.Text, Convert.ToInt32(tb_quantity.Text), Convert.ToDouble(tb_price.Text), tb_description.Text, ddl_category.Items[ddl_category.SelectedIndex].Value.ToString(), imagePath, datetime, userid);
                lb_msg.Text = msg;
                Image1.ImageUrl = "~/Images/Product/" + imagePath;
            }
            else
            {
                lb_msg.Text = "Please enter all fields";
            }
        }

        protected void bn_delete_Click(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                ProductBLL prodBLL = new ProductBLL();
                prodBLL.DeleteProduct(Convert.ToInt32(Session["id"].ToString()));
                Response.Redirect("OwnListing.aspx");
            }
            else
            {
            }
        }
    }
}