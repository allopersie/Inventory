using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class UkuranModel
    {
        public string ID { get; set; }
        public string Ukuran { get; set; }
        public string Keterangan { get; set; }

    }
    public class ResultUkuranModel
    {
        public int code { get; set; }
        public string message { get; set; }
        public List<UkuranModel> data { get; set; }
    }
}