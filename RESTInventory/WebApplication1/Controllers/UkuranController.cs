using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class UkuranController : ApiController
    {
        public List<UkuranModel> GetUkuran()
        {
            List<UkuranModel> ukuranModel = (new UkuranDAL()).getUkuranModel();
            ResultUkuranModel resultUkuran = new ResultUkuranModel();
            if (ukuranModel.Count > 0)
            {
                resultUkuran.code = 200;
                resultUkuran.message = "success";
                resultUkuran.data = ukuranModel;
            }
            else
            {
                resultUkuran.code = 400;
                resultUkuran.message = "data not found";
                resultUkuran.data = ukuranModel;
            }
            return ukuranModel;
        }

        public HttpResponseMessage InsertUkuran(UkuranModel ukuranModel)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new UkuranDAL()).insert(ukuranModel);

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

        public HttpResponseMessage UpdateUkuran(UkuranModel ukuranModel, int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new UkuranDAL()).Update(ukuranModel, Id);

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

        public HttpResponseMessage DeleteUkuran(int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            int i = (new UkuranDAL()).Delete(Id);

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
