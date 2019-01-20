using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineSupport;
using System.Text;
using System.Net;
using System.IO;

namespace Ex_Sell.WebPage
{
    public partial class Operator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Login"] != null && Session["Login"].ToString() == "true")
                {
                    string temp = Session["name"].ToString();
                    //HttpCookie myCookie = new HttpCookie("UsernameCookie");
                    //myCookie.Expires = DateTime.Now.AddDays(1d);
                    //myCookie.Value = temp;
                    //Response.Cookies.Add(myCookie);
                    string onlinesupport = "http://support.ex-sell.tk/OnlineSupport.aspx";
                    ASCIIEncoding encoding = new ASCIIEncoding();
                    string data = string.Format("Name={0}", temp);
                    byte[] bytes = encoding.GetBytes(data);
                    HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(onlinesupport);
                    httpRequest.Method = "POST";
                    httpRequest.ContentType = "application/x-www-form-urlencoded";
                    httpRequest.ContentLength = bytes.Length;
                    using (Stream stream = httpRequest.GetRequestStream())
                    {
                        stream.Write(bytes, 0, bytes.Length);
                        stream.Close();
                    }
                    Response.Redirect(onlinesupport);
                }
            }
        }
    }
}