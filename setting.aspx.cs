using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class setting : System.Web.UI.Page
{
    public Author author = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            accountLabel.Text = (string)GetLocalResourceObject("account");
            presetLangLabel.Text = (string)GetLocalResourceObject("presetLang");
            logoutBtn.Text = (string)GetLocalResourceObject("logoutBtn");
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
            GetSetting(author);
        }
    }

    private void GetSetting(Author author)
    {
        langDropDownSetting();
    }

    private void langDropDownSetting()
    {
        string lang = "2"; //default lang
        presetLang.Items.Clear();
        if (Request.Cookies["presetLang"] != null)
        {
            lang = Request.Cookies["PresetLang"].Value;
        }
        ListItem enListItem = new ListItem();
        enListItem.Text = "En";
        enListItem.Value = "1";
        if (lang == "1")
        {
            enListItem.Selected = true;
        }
        presetLang.Items.Add(enListItem);

        ListItem zhListItem = new ListItem();
        zhListItem.Text = "繁體";
        zhListItem.Value = "2";
        if (lang == "2")
        {
            zhListItem.Selected = true;
        }
        presetLang.Items.Add(zhListItem);

        ListItem chListItem = new ListItem();
        chListItem.Text = "简体";
        chListItem.Value = "3";
        if (lang == "3")
        {
            chListItem.Selected = true;
        }
        presetLang.Items.Add(chListItem);
    }

    protected void logoutBtn_Click(object sender, EventArgs e)
    {
        Session["author_id"] = null;
        HttpCookie myCookie = new HttpCookie("AccessKey");
        //myCookie.Domain = "traffiti.co";
        myCookie.Value = "";
        //myCookie["accessKey"] = author.access_key;
        myCookie.Expires = DateTime.Now.AddMonths(-1);
        Response.Cookies.Add(myCookie);
        Session["author_id"] = 0;
        Response.Redirect("Login.aspx");
        
    }
    protected void presetLang_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectLang = presetLang.SelectedValue;
        HttpCookie myCookie = new HttpCookie("PresetLang");
        //myCookie.Domain = "traffiti.co";
        myCookie.Value = selectLang;
        //myCookie["accessKey"] = author.access_key;
        myCookie.Expires = DateTime.Now.AddMonths(1);
        Response.Cookies.Add(myCookie);

        Response.Redirect("setting.aspx");
    }
}