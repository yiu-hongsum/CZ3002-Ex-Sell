using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Net.Mail;
using System.Net;

namespace BusinessLogicLayer
{
    public class ProductBLL
    {

        public List<Product> RetrieveProduct()
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProduct();
            return allProduct;
        }
        public List<Product> RetrieveProductByCategory( string category)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProductByCategory(category);
            return allProduct;
        }
        public List<Product> RetrieveAllProductByCategory(string category)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveAllProductByCategory(category);
            return allProduct;
        }

        public string CreateProduct(string prod_name, int prod_quantity, double prod_price, string prod_description, string category, string img_id, string datetime, int userid)
        {
            string returnMessage = "";

            if (prod_name.Length > 200)
                returnMessage += "Product name exceeds 200 chars!<br /";
            if (prod_name.Length == 0)
                returnMessage += "Product name cannot be blank <br />";

            if (prod_quantity.Equals(null))
                returnMessage += "Quantity cannot be blank!<br />";

            double price;
            if (Double.TryParse(prod_price.ToString(), out price))
            { }
            else
            {
                returnMessage += "Price must be numeric<br />";
            }
            if (prod_description.Length > 1000)
                returnMessage += "Product Description exceed 200 chars!<br /";

            if (returnMessage.Length == 0)
            {
                Product prod = new Product(prod_name, prod_quantity, prod_price, prod_description, category, img_id, datetime, userid);
                int noRow = prod.ProductInsert();
                if (noRow > 0)
                {
                    returnMessage = "Product Created successfully.";
                }
                else
                    returnMessage = "Error! Please try again.";
            }
            return returnMessage;
        }
        public Product getProduct(string id)
        {
            Product prod = new Product();
            return prod.getProduct(id);
        }
        public int CheckProductCountByCategory(string category)
        {
            Product prod = new Product();
            return prod.CheckProductCountByCategory(category);
        }
        public List<Product> RetrieveProductBySearch(string prod_name)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProductBySearch(prod_name);
            return allProduct;
        }
        public List<Product> RetrieveProductBySearchSort(string prod_name, string sortby)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProductBySearchSort(prod_name, sortby);
            return allProduct;
        }
        public List<Product> RetrieveProductByOwner(string userid)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProductByOwner(userid);
            return allProduct;
        }
        public List<Product> RetrieveProductByInterest(string userid)
        {
            List<Product> allProduct = new List<Product>();
            Product productDAL = new Product();
            allProduct = productDAL.RetrieveProductByInterest(userid);
            return allProduct;
        }
        public string getInterest(int prodid, int userid)
        {
            Product productDAL = new Product(Convert.ToInt32(prodid), Convert.ToInt32(userid));
            int temp = Convert.ToInt32(productDAL.getInterest());
            if(temp == 0 )
            {
                return "1";
            }
            else
            {
                return "0";
            }
        }
        public string CreateInterest(int prodid, int buyid, string buyeremail)
        {
            //userid here is buyid
            string returnMessage = "";
            Product prodDAL = new Product();
            string temp = prodid.ToString();
            string ownerid = prodDAL.getOwner(temp).ProductID.ToString();
            string owneremail= prodDAL.getOwner(temp).Email.ToString();
            string prodname = prodDAL.getOwner(temp).ProductName.ToString();
            Account accDAL = new Account();
            string buyercontact = accDAL.getUserDetails(buyeremail).PhoneNo.ToString();
            string buyername= accDAL.getUserDetails(buyeremail).Name.ToString();
            int noRow = prodDAL.CreateInterest(ownerid, prodid, buyid);
            if (noRow > 0)
            {
                returnMessage = "1";
                SendEmail(owneremail, "Someone is Interested in your Product", buyername + " is interested in " + prodname + ". You may contact " + buyername + " at " + buyercontact + " or " + buyeremail);
            }
            else
                returnMessage = "0";

            return returnMessage;

        }
        protected string SendEmail(string toAddress, string subject, string body)
        {
            string result = "Message Sent Successfully..!!";
            string senderID = "ntu.exsell@gmail.com";// use sender’s email id here..
            const string senderPassword = "%TGB6yhn^YHN5tgb"; // sender password here…  %TGB6yhn^YHN5tgb
            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // smtp server address here…
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,
                };
                MailMessage message = new MailMessage(senderID, toAddress, subject, body);
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                result = "Error sending email.!!!";
            }
            return result;
        }

        public void RemoveInterest(int prodid, int buyid)
        {
            //userid here is buyid
            
            Product prodDAL = new Product();
            int ID = Convert.ToInt32(getInterestID(prodid, buyid).ProductID.ToString());
            prodDAL.RemoveInterest(ID);
        }
        public Product getInterestID(int prodid, int buyid)
        {
            Product prod = new Product();
            return prod.getInterestID(prodid, buyid);
        }

        public string UpdateProduct(int prod_id, string prod_name, int prod_quantity, double prod_price, string prod_description, string category, string img_id, string datetime, int userid)
        {
            string returnMessage = "";

            if (prod_name.Length > 200)
                returnMessage += "Product name exceeds 200 chars!<br /";
            if (prod_name.Length == 0)
                returnMessage += "Product name cannot be blank <br />";

            if (prod_quantity.Equals(null))
                returnMessage += "Quantity cannot be blank!<br />";

            double price;
            if (Double.TryParse(prod_price.ToString(), out price))
            { }
            else
            {
                returnMessage += "Price must be numeric<br />";
            }
            if (prod_description.Length > 1000)
                returnMessage += "Product Description exceed 200 chars!<br /";



            if (returnMessage.Length == 0)
            {
                Product prod = new Product(prod_id, prod_name, prod_quantity, prod_price, prod_description, category, img_id, datetime, userid);
                int noRow = prod.ProductUpdate();
                if (noRow > 0)
                {
                    returnMessage = "Product Updated successfully.";
                }
                else
                    returnMessage = "Error! Please try again.";
            }
            return returnMessage;
        }
        public void DeleteProduct(int prodid)
        {
            //userid here is buyid

            Product prodDAL = new Product();
            prodDAL.DeleteProduct(prodid);
        }
    }
}
