using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePage : System.Web.UI.Page
{
    public Author author = new Author();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["author_id"] != null)
        { }
        else
        {
            GetCurrentUser();
        }
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
            author = js.Deserialize<Author>(result);
        }
    }
}