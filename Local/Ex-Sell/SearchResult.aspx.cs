using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace Ex_Sell.WebPage
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    ProductBLL allproduct = new ProductBLL();
                    if (!String.IsNullOrEmpty(Request.QueryString["srch"]))
                    {
                        //perform search and display results
                        lb_category.Text = "Result for '" + Request.QueryString["srch"] + "'";
                        ListView1.DataSource = allproduct.RetrieveProductBySearch(Request.QueryString["srch"]);
                        ListView1.DataBind();
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
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

        protected void ddl_sort_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductBLL allproduct = new ProductBLL();
            ListView1.DataSource = allproduct.RetrieveProductBySearchSort(Request.QueryString["srch"], ddl_sort.SelectedValue.ToString());
            ListView1.DataBind();
        }
    }
}