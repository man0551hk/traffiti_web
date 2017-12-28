<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .headerCover {
            background-image:url(https://s3-ap-southeast-1.amazonaws.com/traffiti/client_upload/tokyo.jpg);
            background-position: center center;<a href="font/">font/</a>
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
    <div class ="row">
        <div class ="col-md-12 headerCover">
            <div class ="row" style="padding-top:10px">
                <div class ="col-md-12" style="text-align:right">
                    <a href ="setting.aspx" style ="color:gray;font-size:24px;"><span class="oi oi-cog"></span></a>
                </div>
            </div>
            <div class ="row" style="padding-top:10px">
                <div class ="col" style="text-align:left">
                    <img src="<%=author.profile_pic %>" class="rounded-circle" alt="profile_pic" width="100">
                    <br />
                    <font style ="font-size:24px;color:#fff"><%=author.author_name %></font>
                </div>
                <div class ="col" style="text-align:right;vertical-align:bottom">
                    <div class ="row">
                        <div class ="col" style ="font-size:20px;color:#fff">
                            <%=author.fans %>
                            <br />
                            Fans
                        </div>
                        <div class ="col" style ="font-size:20px;color:#fff">
                            <%=author.follows %>
                            <br />
                            Follow
                        </div>
                    </div>
                    <div class ="row">
                        <div class ="col" style="text-align:right;">
                            <br /><br />
                            <a href ="editProfile.aspx" class ="rounded" style ="font-size:20px;color:#fff;border:1px solid #fff;padding:3px;">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
            <div style="height:20px"></div>
        </div>

    </div>
    <div class ="row" style="background-color:#fff;min-height:70px;">
        <div class="col" style ="border:1px solid gray;text-align:center;padding-top:10px;">
            <span class="oi oi-heart"></span>
            <br />
            Favorite
        </div>
        <div class="col" style ="border:1px solid gray;text-align:center;padding-top:10px;">
            <span class="oi oi-list"></span>
            <br />
            My Plan
        </div>
        <div class="col" style ="border:1px solid gray;text-align:center;padding-top:10px;">
            <span class="oi oi-calendar"></span>
            <br />
            Calendar
        </div>
    </div>

            <div class ="row" style="color:#fff;padding:5px;background-color: rgba(23, 32, 42, 0.8);">
                <div class ="col">
                    <div class ="row">
                        <div class="col">
                           Tokyo
                            <br />
                            2017-01-01
                        </div>
                    </div>
                    <div class ="row" style="padding-top:5px;">
                        <div class="col">
                            <img src="https://s3-ap-southeast-1.amazonaws.com/traffiti/client_upload/tokyo.jpg" class="img-fluid" alt="wall_item_cover">
                        </div>
                        <div class="col">
                            <img src="https://s3-ap-southeast-1.amazonaws.com/traffiti/client_upload/tokyo2.jpg" class="img-fluid" alt="wall_item_cover">
                        </div>
                    </div>
                    <div class ="row" style="padding-top:5px;padding-bottom:5px;">
                        <div class ="col-md-12">
                            <span class="oi oi-thumb-up"></span> 6
                            &nbsp;
                            <span class="oi oi-heart"></span> 4
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>

