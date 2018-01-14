using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using System.Web.Script.Serialization;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCurrentUser();
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        InitializeCulture();
    }

    private void GetCurrentUser()
    {
        if (Request.Cookies["AccessKey"] != null)
        {
            string value = Request.Cookies["AccessKey"].Value;
            ApiClass apiClass = new ApiClass();
            string url = "http://api.traffiti.co/api/Author/AuthorLogin";
            string json = "{'accessKey': '" + value + "'}";
            string result = apiClass.PostCallApi(url, json);
            JavaScriptSerializer js = new JavaScriptSerializer();
            Author author = js.Deserialize<Author>(result);
            Session["author_id"] = author.author_id;
        }
    }

    protected void InitializeCulture()
    {
        string language = "zh-hk";
        string lang = "2"; //default lang
        if (Request.Cookies["PresetLang"] != null)
        {
            lang = Request.Cookies["PresetLang"].Value;
            switch (lang)
            {
                case "1":
                    language = "en-us";
                    break;
                case "2":
                    language = "zh-hk";
                    break;
                case "3":
                    language = "zh-cn";
                    break;
            }
        }

        Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
    }
}
