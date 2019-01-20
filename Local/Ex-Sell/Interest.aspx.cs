using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
namespace Ex_Sell
{
    public partial class Interest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    ProductBLL prodBLL = new ProductBLL();
                    ListView1.DataSource = prodBLL.RetrieveProductByInterest(Session["userid"].ToString());
                    ListView1.DataBind();
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
    }
}