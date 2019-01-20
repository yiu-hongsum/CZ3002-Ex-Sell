using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
namespace Ex_Sell.WebPage
{
    public partial class OwnListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    lb_username.Text = "Welcome Back, </br>" + Session["name"].ToString();
                    ProductBLL allproduct = new ProductBLL();
                    ListView1.DataSource = allproduct.RetrieveProductByOwner(Session["userid"].ToString());
                    ListView1.DataBind();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void lb_new_click(object sender, EventArgs e)
        {
            Response.Redirect("NewListing.aspx");
        }
        protected void item_click(object sender, EventArgs e)
        {
            string temp = Session["Login"].ToString();
            LinkButton lb1 = (LinkButton)sender;
            Session["id"] = lb1.CssClass;
            Response.Redirect("ProductView.aspx");
        }
    }
}