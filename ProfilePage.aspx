<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .headerCover {
            background-image:url(<%=author.cover_pic %>);
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
                            <%=(string)GetLocalResourceObject("fans")%>
                        </div>
                        <div class ="col" style ="font-size:20px;color:#fff">
                            <%=author.follows %>
                            <br />
                            <%=(string)GetLocalResourceObject("follows")%>
                        </div>
                    </div>
                    <div class ="row">
                        <div class ="col" style="text-align:right;">
                            <br /><br />
                            <a href ="editProfile.aspx" class ="rounded" style ="text-decoration:none;font-size:20px;color:#fff;border:1px solid #fff;padding:3px;"><%=(string)GetLocalResourceObject("editProfile")%></a>
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
            <%=(string)GetLocalResourceObject("favorite")%>
        </div>
        <div class="col" style ="border:1px solid gray;text-align:center;padding-top:10px;">
            <span class="oi oi-list"></span>
            <br />
            <%=(string)GetLocalResourceObject("myplan")%>
        </div>
        <div class="col" style ="border:1px solid gray;text-align:center;padding-top:10px;">
            <span class="oi oi-calendar"></span>
            <br />
            <%=(string)GetLocalResourceObject("calendar")%>
        </div>
    </div>

    <asp:Repeater runat="server" ID ="wallRepeater">
        <ItemTemplate>
            <div class ="row" style="color:#fff;padding:5px;background-color: rgba(23, 32, 42, 0.8);">
                <div class ="col">
                    <div class ="row">
                        <div class="col">
                            <%# DataBinder.Eval(Container.DataItem, "location") %>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "date_text") %>
                        </div>
                    </div>
                    <div class ="row" style="padding-top:5px;">
                        
                            <%# DataBinder.Eval(Container.DataItem, "photos") %>
                
                    </div>
                    <div class ="row" style="padding-top:5px;padding-bottom:5px;">
                        <div class ="col-md-12">
                            <span class="oi oi-thumb-up"></span> <%# DataBinder.Eval(Container.DataItem, "fav_count") %>
                            &nbsp;
                            <span class="oi oi-heart"></span> <%# DataBinder.Eval(Container.DataItem, "like_count") %>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>



</asp:Content>

