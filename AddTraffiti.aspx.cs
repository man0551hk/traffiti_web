using Amazon.S3;
using Amazon.S3.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTraffiti : System.Web.UI.Page
{

    string accessKey = "AKIAJMJFGAFFKZ442LIQ";
    string secretKey = "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";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack && imagesUploader.PostedFile != null)
        {
            uploadTemp();
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
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }


    protected void postBtn_Click(object sender, EventArgs e)
    {
        if (imagesUploader.HasFile)
        {
            //client = new AmazonS3Client(Amazon.RegionEndpoint.APSoutheast1);
         
            HttpFileCollection uploadedFiles = Request.Files;
            for(int i = 0;i < uploadedFiles.Count;i++) 
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
                    }
                }
                catch (Exception ex)
                {
            
                }
            }
        }
    }

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