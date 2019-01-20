using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.Threading;


namespace OnlineSupport
{
    public class ChatConnection : PersistentConnection
    {
        //static string group_name = "OnlineSupport";  
        /// <summary>
        /// operator_id is set when operator is online
        /// </summary>
        static string operator_id = string.Empty;
        /// <summary>
        /// sb is for storing message,and when user left the chat,save it to DB or file
        /// </summary>
        static StringBuilder sb = new StringBuilder();
        /// <summary>
        /// operator_added_to_group is set when operator is online
        /// </summary>
        static bool operator_added_to_group = false;
        /// <summary>
        /// max 2 ids for 1-1 chat,other users will be stored in queue object (in memory)
        /// group_ids[0] is for operator
        /// group_ids[1] is for user
        /// </summary>
        static string[] group_ids = { string.Empty, string.Empty };
        /// <summary>
        /// waiting_users is a queue object,contains users connectionId
        /// </summary>
        static Queue<string> waiting_users = new Queue<string>();


        protected override Task OnConnected(IRequest request, string connectionId)
        {

            if (OnlineSupport.operator_online)
            {

                if (!operator_added_to_group)
                {

                    operator_id = connectionId;
                    group_ids[0] = connectionId;

                    operator_added_to_group = true;

                    //Groups.Add(group_ids[0], group_name);
                    //Groups.Add(group_ids[1],group_name);
                    if (string.IsNullOrWhiteSpace(group_ids[1]))
                    {
                        return Connection.Send(connectionId, "No user is connected");
                    }
                    else
                    {
                        return Connection.Broadcast("Operator has joined");
                    }
                }

            }
            else
            {
                //group_ids[1] = connectionId;
                return Connection.Send(connectionId, "Operator is offline now");
            }



            if (string.IsNullOrEmpty(group_ids[1]))
            {
                group_ids[1] = connectionId;
                return Task.Factory.StartNew(() =>
                {
                    Connection.Send(connectionId, "You are now connected to operator");
                    Connection.Send(operator_id, OnlineSupport.user + " has joined");
                });
                //return base.OnConnected(request, connectionId);
            }
            else
            {
                if (operator_id != connectionId)
                {
                    waiting_users.Enqueue(connectionId);
                    return Connection.Send(connectionId, "Sorry operator is in discussion with other user.Please wait...");
                }
                else
                {
                    return base.OnConnected(request, connectionId);
                }
            }


        }

        protected override Task OnReceived(IRequest request, string connectionId, string data)
        {
            if (!OnlineSupport.operator_online)
                return Connection.Send(connectionId, "Operator is offline now");

            if (!string.IsNullOrEmpty(group_ids[0]) && !string.IsNullOrEmpty(group_ids[1]) && !group_ids.Contains(connectionId))
                return Connection.Send(connectionId, "Operator is in discussion with other user.Please wait...");

            if (string.IsNullOrEmpty(group_ids[1]))
            {
                return base.OnReceived(request, connectionId, "");
            }

            //Groups.Add(group_ids[0],group_name); 
            //Groups.Add(group_ids[1],group_name);
            if (connectionId == operator_id)
            {
                data = "Operator : " + data;
            }
            else
            {
                data = OnlineSupport.user + ": " + data;//(String)System.Web.HttpContext.Current.Session["TempChatSession"] + ": " + data;
                // HttpCookie myCookie = HttpRequest.Cookies["UsernameCookie"];
                //string temp = myCookie.Value;
                //data = "User: " + data;
            }
            sb.AppendLine(data);
            return Task.Factory.StartNew(() =>
            {
                Connection.Send(group_ids[0], data);
                /*******
                 * To force end the chat with user, operator can enter "EXIT"
                 *******/
                if (data.Equals("Operator : EXIT"))
                {
                    Connection.Send(group_ids[1], "Disconnected. If you want to chat, please refresh the page.");
                    OnDisconnected(request, group_ids[1]);
                }
                else
                    Connection.Send(group_ids[1], data);
            });

            //return Groups.Send(group_name,data);//not working
            //return base.OnReceived(request, connectionId, data);

        }

        protected override Task OnDisconnected(IRequest request, string connectionId)
        {
            if (!string.IsNullOrEmpty(group_ids[0]) && !string.IsNullOrEmpty(group_ids[1]) && !group_ids.Contains(connectionId))
            {
                waiting_users = CustomQ<string>.RemoveItem(waiting_users, connectionId);
                return base.OnDisconnected(request, connectionId);
            }

            if (string.IsNullOrEmpty(group_ids[1]))
            {
                return base.OnDisconnected(request, connectionId);
            }

            sb.Append("====chat ends====\n");
            string message = sb.ToString();
            sb.Clear();
            SaveChatToFile(message);

            if (connectionId == operator_id)
            {
                OnlineSupport.operator_online = false;
                operator_added_to_group = false;
                group_ids[0] = string.Empty;
                group_ids[1] = string.Empty;
                waiting_users.Clear();
                return Connection.Broadcast("Operator is offline now");
            }
            else
            {
                group_ids[1] = string.Empty;
                if (waiting_users.Count > 0)
                {
                    group_ids[1] = waiting_users.Dequeue();
                    return Task.Factory.StartNew(() =>
                    {
                        Connection.Send(group_ids[1], "You are now connected to operator");
                        Connection.Send(group_ids[0], string.Format("================ " + OnlineSupport.user + " has left the chat ================<br/>A new user has joined"));
                    });
                    //return base.OnConnected(request, connectionId);
                }
                else
                {
                    return Connection.Send(group_ids[0], string.Format("================ " + OnlineSupport.user + " has left the chat ================<br/>There are no users in the queue"));
                }
            }
        }

        public void SaveChatToFile(string message)
        {
            Debug.Write(message);
        }
    }
}