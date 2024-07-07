using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class BahanDAL : ConnectionStringHelper
    {
        public List<BahanModel> GetBahanModels()
        {
            List<BahanModel> data = new List<BahanModel>();
            string sql = "select * from jenis_bahan";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<BahanModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }
        public int insert(BahanModel bahanModel)
        {
            string sql = @"INSERT INTO `inventory`.`jenis_bahan`
                            (`Nama_Bahan`,
                            `Keterangan`)
                            VALUES
                            (@Nama_Bahan,
                            @Keterangan);
                            ;";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Nama_Bahan = bahanModel.Nama_Bahan,
                    Keterangan = bahanModel.Keterangan,
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Update(BahanModel bahanModel, int Id)
        {
            string sql = @"UPDATE `inventory`.`jenis_bahan`
                SET
                `Nama_Bahan` = @Nama_Bahan,
                `Keterangan` = @Keterangan
                WHERE `ID` = @Id;";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Id = Id,
                    Nama_Bahan = bahanModel.Nama_Bahan,
                    Keterangan = bahanModel.Keterangan,
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Delete(int Id)
        {
            string sql = @"DELETE FROM `inventory`.`jenis_bahan`
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