using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class BahanModel
    {
        public string ID { get; set; }
        public string Nama_Bahan { get; set; }
        public string Keterangan { get; set; }

    }

    public class ResultBahanModel
    {
        public int code { get; set; }
        public string message { get; set; }
        public List<BahanModel> data { get; set; }
    }
}