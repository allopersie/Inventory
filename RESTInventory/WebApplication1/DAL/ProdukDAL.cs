using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class ProdukDAL : ConnectionStringHelper
    {
        public List<ProdukModel> GetProdukModels()
        {
            List<ProdukModel> data = new List<ProdukModel>();

            string sql = @"SELECT `produk`.`ID`,
                    `produk`.`Tanggal`,
                    `produk`.`Warna`,
                    `produk`.`Jenis_Bahan_ID`,
                    `produk`.`Ukuran_ID`,
                    `produk`.`Quantity`,
                    `produk`.`Created`,
                    `produk`.`createdby`
                FROM `inventory`.`produk`;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<ProdukModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }

        public List<ProdukModel> GetProdukVWModels()
        {
            List<ProdukModel> data = new List<ProdukModel>();

            
            string sql = @"SELECT `produk_vw`.`ID`,
                            `produk_vw`.`Tanggal`,
                            `produk_vw`.`Warna`,
                            `produk_vw`.`Jenis_Bahan_ID`,
                            `produk_vw`.`Ukuran_ID`,
                            `produk_vw`.`Quantity`,
                            `produk_vw`.`Created`,
                            `produk_vw`.`createdby`,
                            `produk_vw`.`Ukuran`,
                            `produk_vw`.`Nama_Bahan`
                        FROM `inventory`.`produk_vw`;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<ProdukModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }
        public int insert(ProdukModel produkModel)
        {
            string sql = @"INSERT INTO `inventory`.`produk`
                            (`Tanggal`,
                            `Warna`,
                            `Jenis_Bahan_ID`,
                            `Ukuran_ID`,
                            `Quantity`,
                            `Created`,
                            `createdby`)
                            VALUES
                            (@Tanggal,
                            @Warna,
                            @Jenis_Bahan_ID,
                            @Ukuran_ID,
                            @Quantity,
                            @Created,
                            @createdby);";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Tanggal = produkModel.Tanggal.Date,
                    Warna = produkModel.Warna,
                    Jenis_Bahan_ID = produkModel.Jenis_Bahan_ID,
                    Ukuran_ID = produkModel.Ukuran_ID,
                    Quantity = produkModel.Quantity,
                    Created = produkModel.Created.Date,
                    createdby = produkModel.createdby
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Update(ProdukModel pesananModel, int Id)
        {

            string sql = @"UPDATE `inventory`.`produk`
                        SET
                        `Tanggal` = @Tanggal,
                        `Warna` = @Warna,
                        `Jenis_Bahan_ID` = @Jenis_Bahan_ID,
                        `Ukuran_ID` = @Ukuran_ID,
                        `Quantity` = @Quantity,
                        `Created` = @Created,
                        `createdby` = @createdby
                         WHERE `ID` = @Id;);";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Id = Id,
                    Tanggal = pesananModel.Tanggal.Date,
                    Warna = pesananModel.Warna,
                    Jenis_Bahan_ID = pesananModel.Jenis_Bahan_ID,
                    Ukuran_ID = pesananModel.Ukuran_ID,
                    Quantity = pesananModel.Quantity,
                    Created = pesananModel.Created.Date,
                    createdby = pesananModel.createdby
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Delete(int Id)
        {

            string sql = @"DELETE FROM `inventory`.`produk`
                         WHERE `ID` = @Id;);";
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