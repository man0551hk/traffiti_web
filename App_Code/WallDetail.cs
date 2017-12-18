using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WallDetail
/// </summary>
public class WallDetail
{
    public List<string> contentList { set; get; }
    public List<string> photoList { set; get; }
    public int wall_id { set; get; }
    public string location { set; get; }
    public int author_id { set; get; }
    public string author_name { set; get; }
    public string profile_pic { set; get; }
    public string date_text { set; get; }
    public int like_count { set; get; }
    public int fav_count { set; get; }
}