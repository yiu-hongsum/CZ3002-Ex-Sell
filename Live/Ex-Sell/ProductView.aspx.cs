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
    public partial class ProductView : System.Web.UI.Page
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
                    lb_Name.Text = prodBLL.getProduct(prodid).ProductName.ToString();
                    lb_price.Text = prodBLL.getProduct(prodid).Price.ToString();
                    lb_description.Text = prodBLL.getProduct(prodid).ProductDetails.ToString();
                    lb_quantity.Text = prodBLL.getProduct(prodid).ProductQuantity.ToString();
                    lb_username.Text = prodBLL.getProduct(prodid).Username.ToString();
                    lb_category.Text = prodBLL.getProduct(prodid).Category.ToString();
                    string fileName = prodBLL.getProduct(prodid).ImageID.ToString();
                    Image1.ImageUrl = "~/Images/Product/" + fileName;
                    lb_contact.Text= prodBLL.getProduct(prodid).Contact.ToString();

                    ListView1.DataSource = prodBLL.RetrieveProductByCategory(prodBLL.getProduct(prodid).Category.ToString());
                    ListView1.DataBind();
                    if (!IsPostBack)
                    {
                        //not in database
                        if (prodBLL.getInterest(Convert.ToInt32(prodid), Convert.ToInt32(userid)) == "1" &&
                            (prodBLL.getProduct(prodid).UserID.ToString()) != userid)
                        {
                            bn_interest.Visible = true;
                            bn_uninterest.Visible = false;
                            bn_edit.Visible = false;

                        }
                        //if alraedy interested
                        else if (prodBLL.getInterest(Convert.ToInt32(prodid), Convert.ToInt32(userid)) == "0" &&
                            (prodBLL.getProduct(prodid).UserID.ToString()) != userid)
                        {
                            bn_interest.Visible = false;
                            bn_uninterest.Visible = true;
                            bn_edit.Visible = false;
                        }
                        else
                        {
                            bn_interest.Visible = false;
                            bn_uninterest.Visible = false;
                            bn_edit.Visible = true;
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void item_click(object sender, EventArgs e)
        {
            LinkButton lb1 = (LinkButton)sender;
            Session["id"] = lb1.CssClass;
            Response.Redirect("ProductView.aspx");
        }

        protected void bn_interest_Click(object sender, EventArgs e)
        {
            ProductBLL prodBLL = new ProductBLL();
            int prodid = Convert.ToInt32(Session["id"].ToString());
            int buyerid = Convert.ToInt32(Session["userid"].ToString());
            string buyeremail = Session["email"].ToString();
            string msg = prodBLL.CreateInterest(prodid, buyerid, buyeremail);
            if (msg == "1")
            {
                bn_interest.Visible = false;
                bn_uninterest.Visible = true;
            }
            ListView1.DataSource = prodBLL.RetrieveProductByCategory(prodBLL.getProduct(prodid.ToString()).Category.ToString());
            ListView1.DataBind();

        }

        protected void bn_uninterest_Click(object sender, EventArgs e)
        {
            ProductBLL prodBLL = new ProductBLL();
            int prodid = Convert.ToInt32(Session["id"].ToString());
            int buyerid = Convert.ToInt32(Session["userid"].ToString());
            prodBLL.RemoveInterest(prodid, buyerid);
            bn_interest.Visible = true;
            bn_uninterest.Visible = false;
            ListView1.DataSource = prodBLL.RetrieveProductByCategory(prodBLL.getProduct(prodid.ToString()).Category.ToString());
            ListView1.DataBind();
        }
        protected void bn_edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditListing.aspx");
        }
    }
}