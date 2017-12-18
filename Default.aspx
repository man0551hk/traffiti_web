<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        #splashScreen {
            background-image: url(<%=photo1%>);
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            background-color:#464646;  
            display: flex;
            align-items: center;   
            position: relative;
        }
        .layer {
            background-color: rgba(128, 128, 128, 0.7);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        @media only screen and (max-width: 767px) {
            #splashScreen {
                background-image: url(<%=m_photo1%>);
            }
            #loginScreen {
                background-image: url(<%=m_photo2%>);
            }
	    }
    </style>
    <div class="row" id ="splashScreen">
        
        <div class = "col-md-12" style = "color:white;display:table-cell;text-align:center;vertical-align:middle;z-index:3;">
            <a href ="Wall.aspx" style="color:#fff;"><h1>Traffiter</h1></a>
        </div>
        <div class="layer"></div>
    </div>


    <script>
        $('#splashScreen').css('height', $(window).height());
        //$('#loginScreen').css('height', $(window).height());
    </script>
</asp:Content>

