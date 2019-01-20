using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;

namespace BusinessLogicLayer
{
    public class AccountBLL
    {
        public static string AESEncrypt(string toEncrypt, bool useHashing)
        {
            try
            {
                byte[] keyArray;
                byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

                string key = "Someth1ngSpeci@l";

                keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

                tdes.Key = keyArray;
                tdes.Mode = CipherMode.ECB;
                tdes.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = tdes.CreateEncryptor();

                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

                tdes.Clear();
                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            }
            catch (Exception)
            {
                return null;
            }
        }
        public static string BtyeArrayToString(byte[] ba)
        {
            string hex = BitConverter.ToString(ba);
            return hex.Replace("-", "");
        }

        public Account getUser(string email, string password)
        {
            Account accountIndv = new Account();
            byte[] data = null;
            byte[] password2;

            SHA512 sha = new SHA512CryptoServiceProvider();
            string password3 = AESEncrypt(password, true) + email;
            data = ASCIIEncoding.ASCII.GetBytes(password3);
            password2 = sha.ComputeHash(data);
            string password1 = BtyeArrayToString(password2);
            return accountIndv.getUser(email, password1);
        }
        public Account getCurrentAccount(string email)
        {
            Account accountIndv = new Account();
            return accountIndv.getUserDetails(email);
            //return Account.getUserDetails(Account.Email);
        }

        public string CreateUser(string email, string name, string password, string phone)
        {
            string returnMessage = "";
            if (name.Length == 0)
                returnMessage += "Name cannot be blank!<br />";
            if (password.Length == 0)
                returnMessage += "Password cannot be blank!<br />";

            if (email.Length == 0)
                returnMessage += "Email cannot be blank!<br />";
            if (phone.Length == 0)
                returnMessage += "Phone Number cannot be blank! ";

            Account user = new Account(email);
            int temp = Convert.ToInt32(user.SearchUser());
            if (temp <= 0)
            {
                if (returnMessage.Length == 0)
                {
                    byte[] data = null;
                    byte[] password2;

                    SHA512 sha = new SHA512CryptoServiceProvider();
                    string password3 = AESEncrypt(password, true) + email;
                    data = ASCIIEncoding.ASCII.GetBytes(password3);
                    password2 = sha.ComputeHash(data);
                    string password1 = BtyeArrayToString(password2);

                    Account account = new Account(email, name, password1, phone);

                    int nofRows = account.CreateUser();

                    if (nofRows > 0)
                        returnMessage = "User created successfully.";
                    else
                        returnMessage = "Error! Please try again.";
                }
            }
            else
            {
                returnMessage = "User Exist";
            }
            return returnMessage;
        }
        public Account verifyUser(string email)
        {
            Account accountIndv = new Account();
            return accountIndv.verifyUser(email);
        }
        public string ForgetPassword(string email)
        {
            string returnMessage = "";
            if (verifyUser(email) != null)
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                string randompw = "";
                Random random = new Random();

                for (int i = 0; i < 8; i++)
                {
                    randompw += chars[random.Next(chars.Length)];
                }
                string npassword = randompw.ToString();
                byte[] data = null;
                byte[] password2;

                SHA512 sha = new SHA512CryptoServiceProvider();
                string password3 = AESEncrypt(npassword, true) + email;
                data = ASCIIEncoding.ASCII.GetBytes(password3);
                password2 = sha.ComputeHash(data);
                string password1 = BtyeArrayToString(password2);

                Account account = new Account(email, password1);

                int noofRows = 0;
                noofRows = account.ResetPassword();
                if (noofRows > 0)
                {
                    
                    returnMessage = "New Password is " + npassword;//"Staff record updated successfully.";
                    SendEmail(email, "Reset Password", returnMessage);
                    returnMessage = "New Password has been sent to your email!";
                }
                else
                {
                    returnMessage = "Error! Please try again.";
                }
            }
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
        public string UpdateAccount(string email, string password, string name, string phoneno)
        {
            string returnMessage = "";
            if (verifyUser(email) != null)
            {
                byte[] data = null;
                byte[] password2;

                SHA512 sha = new SHA512CryptoServiceProvider();
                string password3 = AESEncrypt(password, true) + email;
                data = ASCIIEncoding.ASCII.GetBytes(password3);
                password2 = sha.ComputeHash(data);
                string password1 = BtyeArrayToString(password2);
                Account account = new Account(email, name, password1, phoneno);

                int noofRows = 0;
                noofRows = account.UpdateAccount(email, name, password1, phoneno);
                if (noofRows > 0)
                    returnMessage = "Successfully Updated";//"Staff record updated successfully.";
                else
                    returnMessage = "Error! Please try again.";
            }
            return returnMessage;
        }
        public string UpdateAccount(string email, string name, string phoneno)
        {
            string returnMessage = "";
            if (verifyUser(email) != null)
            {
                Account account = new Account(email, name, phoneno);

                int noofRows = 0;
                noofRows = account.UpdateAccount(email, name, phoneno);
                if (noofRows > 0)
                    returnMessage = "Successfully Updated";//"Staff record updated successfully.";
                else
                    returnMessage = "Error! Please try again.";
            }
            return returnMessage;
        }
    }
}