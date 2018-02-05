<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PostDetail.aspx.cs" Inherits="PostDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
@media (orientation: portrait) { 
    .carousel-item.active,
    .carousel-item-next,
    .carousel-item-prev {
        display: block;
        width:100%;
        height:auto;
    }
}

@media (orientation: landscape) { 
    .carousel-item.active,
    .carousel-item-next,
    .carousel-item-prev {
        display: block;
        width:100%;
        height:96vh;
    }
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="row" style ="padding-top:10px; background-color:#fff">
    <div class="col-md-12">
        <a href ="javascript:history.back();"><span class="oi oi-arrow-thick-left"></span></a>
    </div>
</div>
<div class ="row">
    <div class ="col-md-12" style="color:#fff;margin:10px;padding:10px;background-color: rgba(23, 32, 42, 0.8);">
        <div class ="row" style="padding-bottom:5px;">
            <div class ="col">
                <img src='<%=wallList.profile_pic %>' class="rounded-circle" alt="profile_pic" width ="50"/> 
                &nbsp;
                <a href = 'ProfilePage.aspx?author_id=<%=wallList.author_id %>'><%=wallList.author_name %></a>
            </div>
        </div>
        <div style ="background-color:gray">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <%=imageList %>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-12" style="margin:10px;padding:10px">
                <div class ="row">
                    <div class ="col-md-12">
                        <h5><%=wallList.location %></h5>        
                    </div>
                </div>
                <div class ="row" style="padding-bottom:5px;">
                    <div class ="col-md-12">
                        <font style="color:gray"><%=wallList.date_text %></font>
                    </div>
                </div>
                <div class ="row" style="padding-bottom:5px;">
                    <div class ="col-md-12">
                        <font style="font-size:12px"><%=contentList %></font>
                    </div>
                </div>
                <div class ="row" style="padding-bottom:5px;">
                    <div class ="col-md-12">
                        <span class="oi oi-thumb-up"></span> <%=wallList.like_count %>
                        &nbsp;
                        <span class="oi oi-heart"></span> <%=wallList.fav_count %>
                    </div>
                </div>
            </div>
        </div>
    </div>





</div>
    <script>$('#carouselExampleControls').carousel();</script>
</asp:Content>

<%--    <asp:Repeater runat="server" ID="imageRepeater">
        <ItemTemplate>
            <div class="carousel-item">
              <img class="d-block img-fluid" src='<%#  Container.DataItem.ToString() %>' alt='<%#  Container.DataItem.ToString() %>'>
            </div>
        </ItemTemplate>
    </asp:Repeater>--%>