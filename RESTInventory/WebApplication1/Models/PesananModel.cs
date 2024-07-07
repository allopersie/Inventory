using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    
    public class PesananModel
    {
        public string ID { get; set; }
        public DateTime Tanggal { get; set; }
        public string Warna { get; set; }
        public int Jenis_Bahan_ID { get; set; }
        public int Ukuran_ID { get; set; }
        public int Quantity { get; set; }
        public DateTime Created { get; set; }
        public string createdby { get; set; }
        public int Id_Produk { get; set; }
        public string Ukuran { get; set; }
        public string Nama_Bahan { get; set; }
    }
    public class ResultPesananModel
    {
        public int code { get; set; }
        public string message { get; set; }
        public List<PesananModel> data { get; set; }
    }
}