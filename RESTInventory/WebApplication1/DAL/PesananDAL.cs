using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class PesananDAL : ConnectionStringHelper
    {
        public List<PesananModel> GetPesananModels()
        {
            List<PesananModel> data = new List<PesananModel>();
            string sql = @"SELECT `pesanan_vw`.`ID`,
                            `pesanan_vw`.`Tanggal`,
                            `pesanan_vw`.`Warna`,
                            `pesanan_vw`.`Jenis_Bahan_ID`,
                            `pesanan_vw`.`Ukuran_ID`,
                            `pesanan_vw`.`Quantity`,
                            `pesanan_vw`.`Created`,
                            `pesanan_vw`.`createdby`,
                            `pesanan_vw`.`Id_Produk`,
                            `pesanan_vw`.`Ukuran`,
                            `pesanan_vw`.`Nama_Bahan`
                        FROM `inventory`.`pesanan_vw`;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<PesananModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }

        public List<PesananProdukModel> GetPesananProdukModels()
        {
            List<PesananProdukModel> data = new List<PesananProdukModel>();
            string sql = @"SELECT `pesanan_produk_vw`.`ID`,
                        `pesanan_produk_vw`.`Tanggal`,
                        `pesanan_produk_vw`.`Warna`,
                        `pesanan_produk_vw`.`Jenis_Bahan_ID`,
                        `pesanan_produk_vw`.`Ukuran_ID`,
                        `pesanan_produk_vw`.`qtyStok`,
                        `pesanan_produk_vw`.`Created`,
                        `pesanan_produk_vw`.`createdby`,
                        `pesanan_produk_vw`.`Ukuran`,
                        `pesanan_produk_vw`.`Nama_Bahan`,
                        `pesanan_produk_vw`.`qtyPesan`
                    FROM `inventory`.`pesanan_produk_vw`;";

            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                data = connection.Query<PesananProdukModel>(sql).ToList();
                connection.Close();
            }

            return data;
        }
        public int insert(PesananModel pesananModel)
        {
            string sql = @"INSERT INTO `inventory`.`pesanan`
                            (`Tanggal`,
                            `Warna`,
                            `Jenis_Bahan_ID`,
                            `Ukuran_ID`,
                            `Quantity`,
                            `Created`,
                            `createdby`,Id_Produk)
                            VALUES
                            (@Tanggal,
                            @Warna,
                            @Jenis_Bahan_ID,
                            @Ukuran_ID,
                            @Quantity,
                            @Created,
                            @createdby,@Id_Produk);";
            int affectedRows = 0;
            using (var connection = new MySqlConnection(GetConnection()))
            {
                connection.Open();
                affectedRows = connection.Execute(sql, new
                {
                    Tanggal = pesananModel.Tanggal.Date,
                    Warna = pesananModel.Warna,
                    Jenis_Bahan_ID = pesananModel.Jenis_Bahan_ID,
                    Ukuran_ID = pesananModel.Ukuran_ID,
                    Quantity = pesananModel.Quantity,
                    Created = pesananModel.Created.Date,
                    createdby = pesananModel.createdby,
                    Id_Produk = pesananModel.Id_Produk
                });
                connection.Close();

            }
            return affectedRows;
        }

        public int Update(PesananModel pesananModel, int Id)
        {

            string sql = @"UPDATE `inventory`.`pesanan`
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

            string sql = @"DELETE FROM `inventory`.`pesanan`
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