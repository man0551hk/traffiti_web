using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class RecentlyList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            LoadData();
        }
    }

    public void LoadData()
    {
        ApiClass apiClass = new ApiClass();
        string url = "http://api.traffiti.co/api/Wall/GetWall";
        string json = "{'pageNum': 1, 'lang_id': 1}";
        string result = apiClass.PostCallApi(url, json);
        JavaScriptSerializer js = new JavaScriptSerializer();
        List<Wall> wallList = js.Deserialize <List<Wall>>(result);
        wallRepeater.DataSource = wallList;
        wallRepeater.DataBind();
    }
}