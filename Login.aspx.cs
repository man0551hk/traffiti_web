using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public string photo1 = "";
    public string m_photo1 = "";
    public string photo2 = "";
    public string m_photo2 = "";
    List<string> fileList = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        loginName.Attributes.Add("placeholder", (string)GetLocalResourceObject("Email"));
        password.Attributes.Add("placeholder", (string)GetLocalResourceObject("Password"));
        loginBtn.Text = (string)GetLocalResourceObject("LoginBtn");

        CheckAccessKey();
    }

    private void CheckAccessKey()
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
            if (!string.IsNullOrEmpty(author.access_key) && author.author_id > 0)
            {
                HttpCookie myCookie = new HttpCookie("AccessKey");
                //myCookie.Domain = "traffiti.co";
                myCookie.Value = author.access_key;
                //myCookie["accessKey"] = author.access_key;
                myCookie.Expires = DateTime.Now.AddMonths(1);
                Response.Cookies.Add(myCookie);
                Session["author_id"] = author.author_id;
                Response.Redirect("ProfilePage.aspx");
            }
        }
    }

    private void RandomImage()
    {
        string[] fileEntries = Directory.GetFiles(Server.MapPath("gallery"));
        fileList = fileEntries.ToList();
        for (int i = 0; i < fileList.Count; i++)
        {
            if (!fileList[i].Contains(".jpg") && !fileList[i].Contains(".jpeg"))
            {
                fileList.RemoveAt(i);
            }
        }

        var rnd = new Random();
        List<string> result = fileList.OrderBy(item => rnd.Next()).ToList();

        photo1 = result[0].Replace(@"C:\Traffiter", "").Replace(@"C:\www", "").Replace(@"\", "/");
        photo2 = result[1].Replace(@"C:\Traffiter", "").Replace(@"C:\www", "").Replace(@"\", "/");

        m_photo1 = result[0].Replace(@"gallery\", @"gallery\mobile\").Replace(@"C:\www", "").Replace(@"C:\Traffiter", "").Replace(@"\", "/");
        m_photo2 = result[1].Replace(@"gallery\", @"gallery\mobile\").Replace(@"C:\www", "").Replace(@"C:\Traffiter", "").Replace(@"\", "/");
    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        if (loginName.Text == "" || password.Text == "")
        {

        }
        else
        {
            ApiClass apiClass = new ApiClass();
            string url = "http://api.traffiti.co/api/Author/AuthorLogin";
            string json = "{'authorLogin': '" + loginName.Text + "', 'authorPassword': '" + password.Text + "'}";
            string result = apiClass.PostCallApi(url, json);
            JavaScriptSerializer js = new JavaScriptSerializer();
            Author author = js.Deserialize<Author>(result);
            if (!string.IsNullOrEmpty(author.access_key) && author.author_id > 0)
            {
                HttpCookie myCookie = new HttpCookie("AccessKey");
                //myCookie.Domain = "traffiti.co";
                myCookie.Value = author.access_key;
                //myCookie["accessKey"] = author.access_key;
                myCookie.Expires = DateTime.Now.AddMonths(1);
                Response.Cookies.Add(myCookie);
                Session["author_id"] = author.author_id;
                Response.Redirect("ProfilePage.aspx");
            }
        }
    }
}