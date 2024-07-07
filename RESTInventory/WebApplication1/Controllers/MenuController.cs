using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class MenuController : ApiController
    {
        public List<MenuModel> GetMenus(int id)
        {
            List<MenuModel> menus = (new MenuDAL()).GetMenus(id);
            return menus;
        }
    }
}
