using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class BahanController : ApiController
    {
        public List<BahanModel> GetBahanModels()
        {
            ResultBahanModel resultBahan = new ResultBahanModel();
            List<BahanModel> bahanModel = (new BahanDAL()).GetBahanModels();
            if (bahanModel.Count > 0)
            {
                resultBahan.code = 200;
                resultBahan.message = "success";
                resultBahan.data = bahanModel;
            }
            else
            {
                resultBahan.code = 400;
                resultBahan.message = "data not found";
                resultBahan.data = bahanModel;
            }
            return bahanModel;
        }

        public HttpResponseMessage InsertBahan(BahanModel bahanModel)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            int i = (new BahanDAL()).insert(bahanModel);
            if( i > 0)
            {
                httpResponse.StatusCode = HttpStatusCode.OK;
            }
            else
            {
                httpResponse.StatusCode = HttpStatusCode.BadRequest;
            }

            return httpResponse;
        }

        public HttpResponseMessage UpdateBahan(BahanModel bahanModel, int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            int i = (new BahanDAL()).Update(bahanModel,Id);
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

        public HttpResponseMessage DeleteBahan(int Id)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            int i = (new BahanDAL()).Delete( Id);
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
