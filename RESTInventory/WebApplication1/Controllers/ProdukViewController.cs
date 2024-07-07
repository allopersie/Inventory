using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class ProdukViewController : ApiController
    {
        public List<ProdukModel> GetPesanans()
        {
            List<ProdukModel> pesananModel = (new ProdukDAL()).GetProdukVWModels();
            return pesananModel;
        }
    }
}
