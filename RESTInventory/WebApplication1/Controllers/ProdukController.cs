using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class ProdukController : ApiController
    {
        public List<ProdukModel> GetPesanans()
        {
            List<ProdukModel> pesananModel = (new ProdukDAL()).GetProdukModels();
            return pesananModel;
        }

        [HttpPost]
        public HttpResponseMessage InsertPesanan(ProdukModel produkModel)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new ProdukDAL()).insert(produkModel);

            if (i > 0)
            {
                httpResponse.StatusCode = HttpStatusCode.OK;
            }
            else
            {
                httpResponse.StatusCode = HttpStatusCode.BadRequest;
            }
            return httpResponse;
        }

        public HttpResponseMessage UpdatePesanan(ProdukModel produkModel, int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new ProdukDAL()).Update(produkModel, Id);

            if (i > 0)
            {
                httpResponse.StatusCode = HttpStatusCode.OK;
            }
            else
            {
                httpResponse.StatusCode = HttpStatusCode.BadRequest;
            }
            return httpResponse;
        }

        public HttpResponseMessage DeletePesanan(int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new ProdukDAL()).Delete(Id);

            if (i > 0)
            {
                httpResponse.StatusCode = HttpStatusCode.OK;
            }
            else
            {
                httpResponse.StatusCode = HttpStatusCode.BadRequest;
            }
            return httpResponse;
        }
    }
}
