using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        InitializeCulture();
    }

    protected void InitializeCulture()
    {
        string language = "zh-hk";

        //switch (Customer_Kernel.GetLanguageCode().ToLower())
        //{
        //    case "en":
        //        language = "en-us";
        //        break;
        //    case "tc":
        //        language = "zh-hk";
        //        break;
        //    case "sc":
        //        language = "zh-cn";
        //        break;
        //}
        Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
    }
}
