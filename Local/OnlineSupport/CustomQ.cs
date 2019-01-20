﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineSupport
{
    public class CustomQ<T> : Queue<T>
    {
        public CustomQ()
            : base()
        {
        }

        public CustomQ(int capacity)
            : base(capacity)
        {
        }

        /// <summary>
        /// removes item from queue
        /// </summary>
        /// <param name="q">waiting users</param>
        /// <param name="value">item to be removed</param>
        /// <returns>modified 'Queue' object</returns>
        public static Queue<T> RemoveItem(Queue<T> q, T value)
        {
            Queue<T> queue = new Queue<T>();
            foreach (T item in q)
            {
                if (!Comparer<T>.Equals(item,value))
                    queue.Enqueue(item);
            }
            
            return queue;
        }
    }
}