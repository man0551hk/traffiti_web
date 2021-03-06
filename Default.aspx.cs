﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    public string photo1 = "";
    public string m_photo1 = "";
    public string photo2 = "";
    public string m_photo2 = "";

    List<string> fileList = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(2000);
        Response.Redirect("RecentlyList.aspx");
        if (!IsPostBack)
        {
            RandomImage();
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
}