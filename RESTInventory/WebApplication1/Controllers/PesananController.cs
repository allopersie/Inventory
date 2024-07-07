using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebApplication1.Controllers
{
   
    public class PesananController : ApiController
    {

        public List<PesananModel> GetPesanans()
        {
            List<PesananModel> pesananModel = (new PesananDAL()).GetPesananModels();
            return pesananModel;
        }


        [HttpPost]
        public HttpResponseMessage InsertPesanan(PesananModel pesananModel)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new PesananDAL()).insert(pesananModel);

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

        public HttpResponseMessage UpdatePesanan(PesananModel pesananModel, int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new PesananDAL()).Update(pesananModel,Id);

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
            int i = (new PesananDAL()).Delete(Id);

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
