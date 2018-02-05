using Amazon.S3;
using Amazon.S3.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTraffiti : System.Web.UI.Page
{

    string accessKey = ConfigurationSettings.AppSettings["AWSAccessKey"];
    string secretKey = ConfigurationSettings.AppSettings["AWSSecretKey"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack && imagesUploader.PostedFile != null)
        {
            uploadTemp();
            ShowCurrentTemp();
        }
    }

    public void uploadTemp()
    {
        if (imagesUploader.HasFile)
        {
            //client = new AmazonS3Client(Amazon.RegionEndpoint.APSoutheast1);

            HttpFileCollection uploadedFiles = Request.Files;
            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    string fileName = userPostedFile.FileName;
                    string fileExt = fileName.Substring(fileName.LastIndexOf(".") + 1, fileName.Length - (fileName.LastIndexOf(".") + 1));
                    if (userPostedFile.ContentLength > 0 && userPostedFile.ContentLength < 2048000 && (fileExt.ToLower() == "png" || fileExt.ToLower() == "jpeg" || fileExt.ToLower() == "jpg"))
                    {
                        byte[] fileData = null;
                        Stream fileStream = null;
                        int length = 0;

                        length = userPostedFile.ContentLength;
                        fileData = new byte[length + 1];
                        fileStream = userPostedFile.InputStream;
                        fileStream.Read(fileData, 0, length);
                        MemoryStream stream = new MemoryStream(fileData);

                        UploadImageS3("client_temp/" + Session["author_id"] + "/" + fileName, stream);

                        ApiClass apiClass = new ApiClass();
                        string url = "http://api.traffiti.co/api/Wall/SaveTempPhoto";
                        string json = "{'authorID': " + Session["author_id"] + ", 'photoPath': '" + "client_temp/" + Session["author_id"] + "/" + fileName + "'}";
                        string result = apiClass.PostCallApi(url, json);
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    public class TempPhoto
    {
        public int id { set; get; }
        public string photo_path { set; get; }
    }
    List<TempPhoto> tempPhotoList = new List<TempPhoto>();

    public void ShowCurrentTemp()
    {
        ApiClass apiClass = new ApiClass();
        string url = "http://localhost:57682/api/Wall/GetTempPhoto";
        string json = "{'authorID': " + Session["author_id"] + "}";
        string result = apiClass.PostCallApi(url, json);
        JavaScriptSerializer js = new JavaScriptSerializer();
        tempPhotoList = js.Deserialize<List<TempPhoto>>(result);

        for (int i = 0; i < tempPhotoList.Count; i++)
        {
            tempPhotoList[i].photo_path = "https://s3-ap-southeast-1.amazonaws.com/traffiti/" + tempPhotoList[i].photo_path;
        }

        tempImageRepeater.DataSource = tempPhotoList;
        tempImageRepeater.DataBind();
    }

    protected void postBtn_Click(object sender, EventArgs e)
    {
        //
        ShowCurrentTemp();
        for(int i =0; i < tempPhotoList.Count; i++)
        { 
            
        }
        //if (imagesUploader.HasFile)
        //{
        //    //client = new AmazonS3Client(Amazon.RegionEndpoint.APSoutheast1);
         
        //    HttpFileCollection uploadedFiles = Request.Files;
        //    for(int i = 0;i < uploadedFiles.Count;i++) 
        //    {
        //        HttpPostedFile userPostedFile = uploadedFiles[i];
        //        try 
        //        {
        //            string fileName = userPostedFile.FileName;
        //            string fileExt = fileName.Substring(fileName.LastIndexOf(".") + 1, fileName.Length - (fileName.LastIndexOf(".") + 1));
        //            if (userPostedFile.ContentLength > 0 && userPostedFile.ContentLength < 2048000 && (fileExt.ToLower() == "png" || fileExt.ToLower() == "jpeg" || fileExt.ToLower() == "jpg"))
        //            {
        //                byte[] fileData = null;
        //                Stream fileStream = null;
        //                int length = 0;
       
        //                length = userPostedFile.ContentLength;
        //                fileData = new byte[length + 1];
        //                fileStream = userPostedFile.InputStream;
        //                fileStream.Read(fileData, 0, length);
        //                MemoryStream stream = new MemoryStream(fileData);

        //                UploadImageS3("client_temp/" + Session["author_id"] + "/" + fileName, stream);
        //            }
        //        }
        //        catch (Exception ex)
        //        {
            
        //        }
        //    }
        //}
    }


    /*function geoTest() {
    alert(google.loader.ClientLocation);
    if (google.loader.ClientLocation) {
        var latitude = google.loader.ClientLocation.latitude;
        var longitude = google.loader.ClientLocation.longitude;
        var city = google.loader.ClientLocation.address.city;
        var country = google.loader.ClientLocation.address.country;
        var country_code = google.loader.ClientLocation.address.country_code;
        var region = google.loader.ClientLocation.address.region;

        document.getElementById('<%=locationText.ClientID%>').innerHTML = city;
    }
}
geoTest();*/

//        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDLnmGm_kFXPikv3hzOjYTVYNcqGQnsF&language=zh&callback=initMap">
//</script>
//<script type="text/javascript" src="http://www.google.com/jsapi"></script>
//<script>
//        google.load("language", "zh");
//    </script>

    private void UploadImageS3(string fileName, MemoryStream fileStream)
    {

        try
        {
            AmazonS3 client;
            AmazonS3Config config = new AmazonS3Config().WithCommunicationProtocol(Protocol.HTTP);
            using (client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, config))
            {
                PutObjectRequest request = new PutObjectRequest();
                request.WithBucketName("traffiti");
                request.WithCannedACL(S3CannedACL.PublicRead);
                request.WithKey(fileName).InputStream = fileStream;
                request.AddHeaders(Amazon.S3.Util.AmazonS3Util.CreateHeaderEntry("Cache-Control", "max-age=31536000"));

                S3Response response = client.PutObject(request);
            }

        }
        catch (AmazonS3Exception amazonS3Exception)
        {
            if (amazonS3Exception.ErrorCode != null &&
                (amazonS3Exception.ErrorCode.Equals("InvalidAccessKeyId")
                ||
                amazonS3Exception.ErrorCode.Equals("InvalidSecurity")))
            {
                Console.WriteLine("Check the provided AWS Credentials.");
                Console.WriteLine("For service sign up go to http://aws.amazon.com/s3");
            }
            else
            {
                Console.WriteLine(
                    "Error occurred. Message:'{0}' when writing an object"
                    , amazonS3Exception.Message);
            }
        }    
    }
}