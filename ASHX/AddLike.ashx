<%@ WebHandler Language="C#" Class="AddLike" %>

using System;
using System.Web;

public class AddLike : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (!String.IsNullOrEmpty(context.Request.Form["wall_id"]))
        {
            context.Response.Write(context.Request.Form["wall_id"]);
        }
        else
        {
            context.Response.Write("empty");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}