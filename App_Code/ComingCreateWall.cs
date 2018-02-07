using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

/// <summary>
/// Summary description for ComingCreateWall
/// </summary>
/// 
[DataContract]
public class ComingCreateWall
{
    [DataMember] 
    public int wall_id { set; get; }
    [DataMember] 
    public int author_id { set; get; }
    [DataMember] 
    public string location { set; get; }
    [DataMember] 
    public string lat { set; get; }
    [DataMember] 
    public string lon { set; get; }
    [DataMember] 
    public string message { set; get; }
    [DataMember] 
    public List<string> photoList { set; get; }
    [DataMember] 
    public List<string> publishList { set; get; }
}