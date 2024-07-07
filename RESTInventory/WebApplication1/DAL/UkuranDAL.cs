using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class UkuranDAL : ConnectionStringHelper
    {
        public List<UkuranModel> getUkuranModel()
        {
            List<UkuranModel> data = new List<UkuranModel>();
            string sql = "select * from ukuran";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<UkuranModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }
        public int insert(UkuranModel ukuranModel)
        {
            string sql = @"INSERT INTO `inventory`.`ukuran`
                            (`Ukuran`,
                            `Keterangan`)
                            VALUES
                            (@Ukuran,
                            @Keterangan);";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Ukuran = ukuranModel.Ukuran,
                    Keterangan = ukuranModel.Keterangan,
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Update(UkuranModel ukuranModel,int Id)
        {
            string sql = @"UPDATE `inventory`.`ukuran`
                    SET
                    `Ukuran` = @Ukuran,
                    `Keterangan` = @Keterangan
                    WHERE `ID` = @Id;";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Id = Id,
                    Ukuran = ukuranModel.Ukuran,
                    Keterangan = ukuranModel.Keterangan,
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Delete(int Id)
        {
            string sql = @"DELETE FROM `inventory`.`ukuran`
                    WHERE `ID` = @Id;";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Id = Id,
                });
                connection.Close();

            }
            return affectedRows;
        }
    }
}