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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    ProductBLL allproduct = new ProductBLL();
                    ListView1.DataSource = allproduct.RetrieveProductByCategory("Textbooks/Resources");
                    ListView1.DataBind();
                    ListView2.DataSource = allproduct.RetrieveProductByCategory("Electronics");
                    ListView2.DataBind();
                    ListView3.DataSource = allproduct.RetrieveProductByCategory("Stationery");
                    ListView3.DataBind();
                    ListView4.DataSource = allproduct.RetrieveProductByCategory("Foods & Services");
                    ListView4.DataBind();
                    ListView5.DataSource = allproduct.RetrieveProductByCategory("Household Appliances");
                    ListView5.DataBind();
                    ListView6.DataSource = allproduct.RetrieveProductByCategory("Kitchen Appliances");
                    ListView6.DataBind();
                    ListView7.DataSource = allproduct.RetrieveProductByCategory("Board Games");
                    ListView7.DataBind();
                    ListView8.DataSource = allproduct.RetrieveProductByCategory("Women's Fashion");
                    ListView8.DataBind();
                    ListView9.DataSource = allproduct.RetrieveProductByCategory("Men's Fashion");
                    ListView9.DataBind();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                }
        }
        protected void lb_EditAccount_click(object sender, EventArgs e)
        {
            Response.Redirect("EditAccount.aspx");
        }
        protected void item_click(object sender, EventArgs e)
        {
            LinkButton lb1 = (LinkButton)sender;
            Session["id"] = lb1.CssClass;
            Response.Redirect("ProductView.aspx");
        }
        protected void bn_engineering_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("engineering"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Science_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("science"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Business_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("business"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Humanities_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("humanities"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Computing_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("computing"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Social_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("social"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Accountancy_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("accountacy"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Maths_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("math"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_Arts_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("art and design"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_computer_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("computer"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_tv_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("tv"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_audio_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("audio"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_part_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("part"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_preorder_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode("pyp"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + searchText);
        }

        protected void bn_getstationery_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Stationery"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_viewbook_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Textbooks/Resources"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_electronic_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Electronics"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_stationery_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Stationery"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_service_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Foods & Services"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_household_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Household Appliances"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_kitchen_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Kitchen Appliances"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_women_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Women's Fashion"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_men_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Men's Fashion"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_games_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("Board Games"); // URL encode in case of special characters
            Response.Redirect("CategoryView.aspx?srch=" + category);
        }

        protected void bn_case_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("case"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_notebook_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("notebook"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_paper_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("paper"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_pen_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("pen"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_baked_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("baked"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_instant_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("instant"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_packaged_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("packaged"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }

        protected void bn_drinks_Click(object sender, EventArgs e)
        {
            var category = Server.UrlEncode("drink"); // URL encode in case of special characters
            Response.Redirect("SearchResult.aspx?srch=" + category);
        }
    }
}