using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class MenuModel
    {
        public string ID { get; set; }
        public string ID_Menu { get; set; }
        public string Module { get; set; }
        public string PageName { get; set; }
        public string ID_Role { get; set; }
        public string RoleName { get; set; }
        public bool IsCanView { get; set; }
        public bool IsCanAdd { get; set; }
        public bool IsCanEdit { get; set; }
        public bool IsCanDelete { get; set; }
        public bool IsCanApprove { get; set; }
        public bool IsCanTerminate { get; set; }
        public bool IsCanVerify { get; set; }

    }
}