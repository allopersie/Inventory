using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class ConnectionStringHelper
    {
        public string GetConnection()
        {
            string myConnectionString;

            myConnectionString = "server=localhost;uid=root;" +
                "pwd=;database=inventory;ConvertZeroDatetime=true;AllowZeroDateTime=true;Allow User Variables=True";
            return myConnectionString;
        }
    }
}