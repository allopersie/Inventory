using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class AuthenticationController : ApiController
    {
        public UsersModel GetUser(string email)
        {
            UsersModel data = (new UserDAL()).GetUsers(email);
            return data;
        }
    }
}
