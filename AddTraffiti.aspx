<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddTraffiti.aspx.cs" Inherits="AddTraffiti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="row" style ="padding-top:10px; background-color:#fff">
    <div class="col-md-12">
        <a href ="javascript:history.back();"><span class="oi oi-arrow-thick-left"></span></a>
    </div>
</div>
<div class ="row" >
    <div class ="col-md-12" style="color:#000;margin:10px;padding:10px;background-color:#fff">
        <asp:TextBox runat="server" ID ="content" TextMode="MultiLine" Height="300" Width="100%" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label runat="server" ID="locationText"></asp:Label>
        <div id="imagesDiv">
            <asp:Repeater runat ="server" ID ="tempImageRepeater">
                <ItemTemplate>
                    <asp:Image runat="server" Width="60" ImageUrl ='<%#Eval("photo_path") %>'/>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />

           

     <%----%>


        <asp:FileUpload runat ="server" ID="imagesUploader" CssClass="form-control" Multiple="Multiple" onchange="this.form.submit()" />
        <br />
        <asp:Button runat="server" ID="postBtn" Text="Post" OnClick="postBtn_Click" CssClass="btn btn-primary" />
    </div>
</div>

<script type="text/javascript">
    function initMap()
    {
        var map = new google.maps.Map();
        alert(map);
    }


   
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDLnmGm_kFXPikv3hzOjYTVYNcqGQnsFA&language=zh&callback=initMap" type="text/javascript"></script>
</asp:Content>

