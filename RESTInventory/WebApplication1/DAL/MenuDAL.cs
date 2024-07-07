using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class MenuDAL : ConnectionStringHelper
    {
        public List<MenuModel> GetMenus(int roleID)
        {
            List<MenuModel> data = new List<MenuModel>();
            string sql = @"  SELECT `rolemenu_vw`.`ID`,
                            `rolemenu_vw`.`ID_Menu`,
                            `rolemenu_vw`.`Module`,
                            `rolemenu_vw`.`PageName`,
                            `rolemenu_vw`.`ID_Role`,
                            `rolemenu_vw`.`RoleName`,
                            `rolemenu_vw`.`IsCanView`,
                            `rolemenu_vw`.`IsCanAdd`,
                            `rolemenu_vw`.`IsCanEdit`,
                            `rolemenu_vw`.`IsCanDelete`,
                            `rolemenu_vw`.`IsCanApprove`,
                            `rolemenu_vw`.`IsCanTerminate`,
                            `rolemenu_vw`.`IsCanVerify`
                        FROM `inventory`.`rolemenu_vw`
                        where id_role=@roleID;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                var parameters = new { roleID = roleID };

                data = connection.Query<MenuModel>(sql, new { roleID = roleID }).ToList();
                connection.Close();
            }
            return data;
        }
    }
}