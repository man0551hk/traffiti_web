<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddTraffiti.aspx.cs" Inherits="AddTraffiti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
      #map {
        display:none;
        /*height:300px;*/
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="row" style ="padding-top:10px; background-color:#fff">
    <div class="col-md-12">
        <a href ="javascript:history.back();"><span class="oi oi-arrow-thick-left"></span></a>
    </div>
</div>
<div class ="row" >
    <div class ="col-md-12" style="color:#000;margin:10px;padding:10px;background-color:#fff">
        <asp:UpdatePanel runat="server" ID ="wallPanel" UpdateMode ="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:TextBox runat="server" ID ="content" TextMode="MultiLine" Height="300" Width="100%" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label runat="server" ID="locationText"></asp:Label>
                <asp:HiddenField runat="server" ID="hiddenLocation" />
                <asp:HiddenField runat="server" ID="lat" />
                <asp:HiddenField runat="server" ID="lon" />
                <div id="imagesDiv">
                    <asp:Repeater runat ="server" ID ="tempImageRepeater">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="60" ImageUrl ='<%#Eval("photo_path") %>'/>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <br />

                <asp:FileUpload runat ="server" ID="imagesUploader" CssClass="form-control" Multiple="Multiple" onchange="this.form.submit()" />
                <br />
                <asp:Button runat="server" ID="postBtn" Text="Post" OnClick="postBtn_Click" CssClass="btn btn-primary" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID ="postBtn" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</div>

    <div id="map"></div>
    <script>
        // Note: This example requires that you consent to location sharing when
        // prompted by your browser. If you see the error "The Geolocation service
        // failed.", it means you probably did not give permission for the browser to
        // locate you.
        var map, infoWindow;
        function initMap() {
           
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -34.397, lng: 150.644 },
                zoom: 10
            });
            var geocoder = new google.maps.Geocoder;
            infoWindow = new google.maps.InfoWindow;
          
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                  
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    geocoder.geocode({ 'location': pos }, function (results, status) {
                        if (status === 'OK') {
                            if (results[0]) {
                                document.getElementById('<%=lat.ClientID%>').value = pos.lat;
                                document.getElementById('<%=lon.ClientID%>').value = pos.lng;
                                document.getElementById('<%=hiddenLocation.ClientID%>').value = results[0].formatted_address;
                                document.getElementById('<%=locationText.ClientID%>').innerHTML = results[0].formatted_address;
                            } else {
                                window.alert('No results found');
                            }
                        } else {
                            window.alert('Geocoder failed due to: ' + status);
                        }
                    });
                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                handleLocationError(false, infoWindow, map.getCenter());
            }
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            console.log('The Geolocation service failed.');
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                                  'Error: The Geolocation service failed.' :
                                  'Error: Your browser doesn\'t support geolocation.');
            infoWindow.open(map);
        }
    </script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDLnmGm_kFXPikv3hzOjYTVYNcqGQnsFA&language=zh&callback=initMap" type="text/javascript"></script>
</asp:Content>

