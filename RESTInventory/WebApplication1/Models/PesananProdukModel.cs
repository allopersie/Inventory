using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class PesananProdukModel
    {
        public string ID { get; set; }
        public DateTime Tanggal { get; set; }
        public string Warna { get; set; }
        public int Jenis_Bahan_ID { get; set; }
        public int Ukuran_ID { get; set; }
        public int qtyStok { get; set; }
        public DateTime Created { get; set; }
        public string createdby { get; set; }
        public int Id_Produk { get; set; }
        public string Ukuran { get; set; }
        public string Nama_Bahan { get; set; }
        public int qtyPesan { get; set; }
       
    }
}