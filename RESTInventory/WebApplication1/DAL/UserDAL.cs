using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class UserDAL : ConnectionStringHelper
    {
        public UsersModel GetUsers(string UserName)
        {
            UsersModel data = new UsersModel();
            string sql = @" SELECT `userrole`.`UserID`,
                            `userrole`.`UserName`,
                            `userrole`.`URoleID`,
                            `userrole`.`RoleName`
                        FROM `inventory`.`userrole`
                        where UserName=@userName;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                var parameters = new { userName = UserName };
                
                data = connection.Query<UsersModel>(sql, new { userName = UserName }).FirstOrDefault();
                connection.Close();
            }

            return data;
        }
    }
}