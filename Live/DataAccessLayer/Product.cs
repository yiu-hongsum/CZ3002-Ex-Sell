using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace DataAccessLayer
{
    public class Product
    {
        private string _connStr = Properties.Settings.Default.DBConnStr;
        private int productid;
        private string productname = "";
        private string productdetails = "";
        private int productquantity;
        private string imageid = "";
        private string timestamp = "";
        private int userid;
        private string username = "";
        private string email = "";
        private string category = "";
        private double price;
        private int contact;
        public Product() { }

        public Product(int prod_id)
        {
            productid = prod_id;
        }
        public int ProductID
        {
            get { return productid; }
            set { productid = value; }
        }
        public string ProductName
        {
            get { return productname; }
            set { productname = value; }
        }
        public int ProductQuantity
        {
            get { return productquantity; }
            set { productquantity = value; }
        }
        public string ProductDetails
        {
            get { return productdetails; }
            set { productdetails = value; }
        }
        public string ImageID
        {
            get { return imageid; }
            set { imageid = value; }
        }
        public string TimeStamp
        {
            get { return timestamp; }
            set { timestamp = value; }
        }
        public int UserID
        {
            get { return userid; }
            set { userid = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Category
        {
            get { return category; }
            set { category = value; }
        }
        public double Price
        {
            get { return price; }
            set { price = value; }
        }

        public int Contact { get => contact; set => contact = value; }

        public Product(string prod_name, int prod_quantity, double pprice, string prod_description, string pcategory, string img_id, string datetime, int user_id)
        {
            productname = prod_name;
            productquantity = prod_quantity;
            price = pprice;
            productdetails = prod_description;
            category = pcategory;
            timestamp = datetime;
            imageid = img_id;
            userid = user_id;
        }
        public Product(int prod_id, string prod_name, int prod_quantity, double pprice, string prod_description, string pcategory, string img_id, string datetime, int user_id, string user_name)
        {
            productid = prod_id;
            productname = prod_name;
            productquantity = prod_quantity;
            price = pprice;
            productdetails = prod_description;
            category = pcategory;
            timestamp = datetime;
            imageid = img_id;
            userid = user_id;
            username = user_name;
        }
        public Product(int prod_id, string prod_name, int prod_quantity, double pprice, string prod_description, string pcategory, string img_id, string datetime, int user_id, string user_name, int phone)
        {
            productid = prod_id;
            productname = prod_name;
            productquantity = prod_quantity;
            price = pprice;
            productdetails = prod_description;
            category = pcategory;
            timestamp = datetime;
            imageid = img_id;
            userid = user_id;
            username = user_name;
            contact = phone;
        }
        public Product(int prod_id, string prod_name, int prod_quantity, double pprice, string prod_description, string pcategory, string img_id, string datetime, string email, string user_name, int phone)
        {
            productid = prod_id;
            productname = prod_name;
            productquantity = prod_quantity;
            price = pprice;
            productdetails = prod_description;
            category = pcategory;
            timestamp = datetime;
            imageid = img_id;
            this.email = email;
            username = user_name;
            contact = phone;
        }
        public Product(int prod_id, string prod_name, int prod_quantity, double pprice, string prod_description, string pcategory, string img_id, string datetime, int user_id)
        {
            productid = prod_id;
            productname = prod_name;
            productquantity = prod_quantity;
            price = pprice;
            productdetails = prod_description;
            category = pcategory;
            timestamp = datetime;
            imageid = img_id;
            userid = user_id;
        }
        public Product(int prod_id, int user_id)
        {
            productid = prod_id;
            userid = user_id;
        }

        public int ProductInsert()
        {
            string queryStr = "INSERT INTO producttable(ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID)"
                + "VALUES(@ProductName, @ProductQuantity, @Price, @ProductDetails, @Category, @ImageID, @TimeStamp, @UserID)";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductName", productname);
            cmd.Parameters.AddWithValue("@ProductQuantity", productquantity);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@ProductDetails", productdetails);
            cmd.Parameters.AddWithValue("@Category", category);
            cmd.Parameters.AddWithValue("@ImageID", imageid);
            cmd.Parameters.AddWithValue("@TimeStamp", timestamp);
            cmd.Parameters.AddWithValue("@UserID", userid);

            conn.Open();
            int noRow = 0;
            noRow = cmd.ExecuteNonQuery();
            conn.Close();
            return noRow;
        }

      
        public List<Product> RetrieveProduct()
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                ProductAll.Add(new Product(ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }
        
        public List<Product> RetrieveProductByCategory(string category)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID where p.category=@category ORDER BY TimeStamp DESC LIMIT 5";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@category", category);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                Username = dr["Name"].ToString();
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }
        public Product getProduct(string prodid)
        {
            Product prod = new Product();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID WHERE ProductID = @ProductID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductID", prodid);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                Username = dr["Name"].ToString();
                Contact = Convert.ToInt32(dr["PhoneNo"].ToString());

                prod = new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username, Contact);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prod;
        }
        public int CheckProductCountByCategory(string category)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "Select count(ProductID) FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID where p.category=@category";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@category", category);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            int count=0;

            while (dr.Read())
            {
               
                count = Convert.ToInt32(dr["count(ProductID)"]);
                //ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return count;
        }

        public List<Product> RetrieveProductBySearch(string prodname)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID where p.ProductName LIKE CONCAT('%', @prodname ,'%')";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@prodname", prodname);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                Username = dr["Name"].ToString();
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }
        public List<Product> RetrieveProductBySearchSort(string prodname, string sortby)
        {
            List<Product> ProductAll = new List<Product>();
            string order = sortby;
            string queryStr = "SELECT * FROM producttable WHERE ProductName LIKE CONCAT('%', @prodname ,'%') ORDER BY " + sortby;

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@prodname", prodname);
            //cmd.Parameters.AddWithValue("@sortby", sortby);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }

        public List<Product> RetrieveProductByOwner(string userid)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID where p.UserID=@UserID ORDER BY TimeStamp";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@UserID", userid);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                Username = dr["Name"].ToString();
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }

        public List<Product> RetrieveProductByInterest(string userid)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN interesttable i ON i.ProductID=p.ProductID where i.BuyerID=@BuyerID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@BuyerID", userid);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }

        public string getInterest()
        {   //Checking if user exist.
            string queryStr = "SELECT count(*) FROM interesttable WHERE ProductID = @ProductID AND BuyerID=@BuyerID";
            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);

            cmd.Parameters.AddWithValue("@ProductID", productid);
            cmd.Parameters.AddWithValue("@BuyerID", userid);
            conn.Open();
            string returnvalue = "";
            returnvalue = cmd.ExecuteScalar().ToString();
            conn.Close();

            return returnvalue;
        }
        public Product getOwner(string prodid)
        {
            Product prod = new Product();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID  WHERE p.ProductID = @ProductID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductID", prodid);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                Email = dr["Email"].ToString();
                Username = dr["Name"].ToString();
                Contact = Convert.ToInt32(dr["PhoneNo"].ToString());

                prod = new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, Email, Username, Contact);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prod;
        }
        public int CreateInterest(string ownerid, int prodid, int buyerid)
        {
            string queryStr = "INSERT INTO interesttable(OwnerID, ProductID, BuyerID) VALUES(@OwnerID, @ProductID, @UserID)";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@OwnerID", Convert.ToUInt32(ownerid));
            cmd.Parameters.AddWithValue("@ProductID", prodid);
            cmd.Parameters.AddWithValue("@UserID", buyerid);

            conn.Open();
            int noRow = 0;
            noRow = cmd.ExecuteNonQuery();
            conn.Close();
            return noRow;
        }

        public Product getInterestID(int prodid, int buyerid)
        {
            Product prod = new Product();
            string queryStr = "SELECT ID FROM interesttable WHERE ProductID = @ProductID AND BuyerID=@UserID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductID", prodid);
            cmd.Parameters.AddWithValue("@UserID", buyerid);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ID"]);
                prod = new Product(ProductID);
            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            return prod;
        }

        public void RemoveInterest(int prodid)
        {
            string queryStr = "DELETE FROM interesttable WHERE ID=@ID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ID", prodid);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
        }
        /*
          public int ProductUpdate(string prodId, string prodName, string prodDetails, string category, string image, string barcode)
        {
            int nofRow = 0;

            string queryStr = "UPDATE Product SET ProductName= @ProductName, ProductDetails = @ProductDetails, ShopID=@ShopID, ImageID=@ImageID, Barcode=@Barcode WHERE ProductID= @ProductID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductName", prodName);
            cmd.Parameters.AddWithValue("@ProductDetails", prodDetails);
            cmd.Parameters.AddWithValue("@ProductID", prodId);
            cmd.Parameters.AddWithValue("@ShopID", category);
            cmd.Parameters.AddWithValue("@ImageID", image);
            cmd.Parameters.AddWithValue("@Barcode", barcode);
            conn.Open();

            nofRow = cmd.ExecuteNonQuery();

            conn.Close();



            return nofRow;
        }*/
        public int ProductUpdate()
        {
            string queryStr = "UPDATE producttable SET ProductName = @ProductName, ProductQuantity=@ProductQuantity, ProductDetails=@ProductDetails, Category=@Category, ImageID=@ImageID, TimeStamp=@TimeStamp WHERE ProductID=@ProductID AND UserID=@UserID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductID", productid);
            cmd.Parameters.AddWithValue("@ProductName", productname);
            cmd.Parameters.AddWithValue("@ProductQuantity", productquantity);
            cmd.Parameters.AddWithValue("@ProductDetails", productdetails);
            cmd.Parameters.AddWithValue("@Category", category);
            cmd.Parameters.AddWithValue("@ImageID", imageid);
            cmd.Parameters.AddWithValue("@TimeStamp", timestamp);
            cmd.Parameters.AddWithValue("@UserID", userid);

            conn.Open();
            int noRow = 0;
            noRow = cmd.ExecuteNonQuery();
            conn.Close();
            return noRow;
        }
        public void DeleteProduct(int prodid)
        {
            string queryStr = "DELETE FROM producttable WHERE ProductID=@ProductID";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProductID", prodid);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
        }
        public List<Product> RetrieveAllProductByCategory(string category)
        {
            List<Product> ProductAll = new List<Product>();

            string queryStr = "SELECT * FROM producttable p INNER JOIN usertable u ON p.UserID=u.ID where p.category=@category ORDER BY TimeStamp DESC";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@category", category);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                ProductID = Convert.ToInt32(dr["ProductID"]);
                ProductName = dr["ProductName"].ToString();
                ProductQuantity = Convert.ToInt32(dr["ProductQuantity"]);
                Price = Convert.ToDouble(dr["Price"]);
                ProductDetails = dr["ProductDetails"].ToString();
                Category = dr["Category"].ToString();
                ImageID = dr["ImageID"].ToString();
                TimeStamp = dr["TimeStamp"].ToString();
                UserID = Convert.ToInt32(dr["UserID"]);
                Username = dr["Name"].ToString();
                ProductAll.Add(new Product(ProductID, ProductName, ProductQuantity, Price, ProductDetails, Category, ImageID, TimeStamp, UserID, Username));
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ProductAll;
        }

    }
}
