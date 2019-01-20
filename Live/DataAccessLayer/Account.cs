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
    public class Account
    {
        private string _connStr = Properties.Settings.Default.DBConnStr;
        private int userid;
        private string email = "";
        private string name = "";
        private string password="";
        private string phoneno = "";

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string PhoneNo
        {
            get { return phoneno; }
            set { phoneno = value; }
        }
        public int UserID
        {
            get { return userid; }
            set { userid = value; }
        }
        public Account()
        {
        }
        public Account(string email)
        {
            this.email = email;
        }
        public Account(int userid, string email, string name, string password, string phoneno)
        {
            this.userid = userid;
            this.email = email;
            this.name = name;
            this.password = password;
            this.phoneno = phoneno;
        }
        public Account(string email, string name, string password, string phoneno)
        {
            this.email = email;
            this.name = name;
            this.password = password;
            this.phoneno = phoneno;
        }
        public Account(string email, string name, string phoneno)
        {
            this.email = email;
            this.name = name;
            this.phoneno = phoneno;
        }

        public Account(string email, string password)
        {
            this.email = email;
            this.password = password;
        }

        public Account getUser(string email, string password)
        {
            Account UserFound = null;

            string queryStr = "SELECT * FROM usertable WHERE Email=@email and Password=@password";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);


            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                userid = Convert.ToInt32(dr["ID"]);
                email = dr["Email"].ToString();
                password = dr["Password"].ToString();
                name = dr["Name"].ToString();
                phoneno = dr["PhoneNo"].ToString();

                UserFound = new Account(userid, email, name, password, phoneno);

            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            return UserFound;
        }
        public int CreateUser()
        {
            string queryStr = " INSERT INTO usertable (Name, Email, Password, PhoneNo) VALUES(@Name, @Email, @Password, @PhoneNo)";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@PhoneNo", phoneno);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();
            return nofRow;
        }

        public string SearchUser()
        {   //Checking if user exist.
            string queryStr = "SELECT count(*) FROM usertable WHERE Email = @Email";
            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);

            cmd.Parameters.AddWithValue("@Email", email);
            conn.Open();
            string returnvalue = "";
            returnvalue = cmd.ExecuteScalar().ToString();
            conn.Close();

            return returnvalue;
        }

        public Account verifyUser(string email)
        {
            Account UserFound = null;

            string queryStr = "SELECT * FROM usertable WHERE Email=@email";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@email", email);

            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                email = dr["Email"].ToString();
                UserFound = new Account(email);

            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            return UserFound;
        }

        public int ResetPassword()
        {
            string queryStr = "Update usertable set Password=@Password where Email=@Email";
            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);

            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();
            return nofRow;
        }
        public int UpdateAccount(string email, string name, string password, string phoneno)
        {
            string queryStr = "Update usertable set Password=@Password, Name=@Name, PhoneNo=@PhoneNo where Email=@Email";
            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@PhoneNo", phoneno);

            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();
            return nofRow;
        }
        public int UpdateAccount(string email, string name, string phoneno)
        {
            string queryStr = "Update usertable set Name=@Name, PhoneNo=@PhoneNo where Email=@Email";
            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@PhoneNo", phoneno);

            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();
            return nofRow;
        }
        public Account getUserDetails(string email)
        {
            Account UserFound = null;

            string queryStr = "SELECT * FROM usertable WHERE Email=@email";

            MySqlConnection conn = new MySqlConnection(_connStr);
            MySqlCommand cmd = new MySqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@email", email);
            //cmd.Parameters.AddWithValue("@password", password);


            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                email = dr["Email"].ToString();
                //password = dr["Password"].ToString();
                name = dr["Name"].ToString();
                phoneno = dr["PhoneNo"].ToString();
                UserFound = new Account(email, name, phoneno);

            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            return UserFound;
        }
    }
}
