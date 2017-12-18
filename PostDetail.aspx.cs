using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Text;


public partial class PostDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["wall_id"] == null)
        {
            return;
        }
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    public string imageList = string.Empty;
    public string contentList = string.Empty;
    public WallDetail wallList = new WallDetail();
    public void LoadData()
    {
        ApiClass apiClass = new ApiClass();
        string url = "http://api.traffiti.co/api/Wall/GetWallDetail";
        string json = "{'wall_id': " + Request.QueryString["wall_id"] + ", 'lang_id': 1}";
        string result = apiClass.PostCallApi(url, json);
        JavaScriptSerializer js = new JavaScriptSerializer();
        wallList = js.Deserialize<WallDetail>(result);
        StringBuilder sb = new StringBuilder();

        wallList.photoList.Remove("");

        for (int i = 0; i < wallList.photoList.Count; i++)
        {
            if (i == 0)
            {
                sb.AppendLine("<div class=\"carousel-item active\">");
            }
            else
            {
                sb.AppendLine("<div class=\"carousel-item\">");
            }
            sb.AppendLine("<img class=\"d-block img-fluid\" src=\"" + wallList.photoList[i]  + "\" alt=\"" + wallList.photoList[i] + "\">");
            sb.AppendLine("</div>");
        }
        imageList = sb.ToString();

        for (int i = 0; i < wallList.contentList.Count; i++)
        {
            contentList += wallList.contentList[i] + "<br/>";
        }

            

        //imageRepeater.DataSource = wallList.photoList;
        //imageRepeater.DataBind();
    }
}