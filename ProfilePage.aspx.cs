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
        {
            GetWall(Convert.ToInt32(Request.QueryString["author_id"]), 1, 1);
        }
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
            GetWall(author.author_id, 1, 1);
        }
    }

    private void GetWall(int authorID, int page, int lang_id)
    {
        ApiClass apiClass = new ApiClass();
        string url = "http://api.traffiti.co/api/Wall/GetProfileWallList";
        string json = "{'pageNum': " + page + ", 'lang_id': " + lang_id + ", 'authorID': " + authorID + "}";
        string result = apiClass.PostCallApi(url, json);
        JavaScriptSerializer js = new JavaScriptSerializer();
        List<WallDetail> wdList = js.Deserialize<List<WallDetail>>(result);

        for (int i = 0; i < wdList.Count; i++)
        { 
            for(int j = 0; j < wdList[i].photoList.Count; j++)
            {
                wdList[i].photos += "<div class=\"col\">";
                wdList[i].photos += "<a href = 'PostDetail.aspx?wall_id=" + wdList[i].wall_id + "'>";
                wdList[i].photos += "<img src=\" "+ wdList[i].photoList[j] + "\" class=\"img-fluid\" alt=\"wall_item_cover\">";
                wdList[i].photos += "</a>";
                wdList[i].photos += "</div>";
            }
        }

        wallRepeater.DataSource = wdList;
        wallRepeater.DataBind();
    }
}