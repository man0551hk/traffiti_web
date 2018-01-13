<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="row" style ="padding-top:10px; background-color:#fff">
    <div class="col-md-12">
        <a href ="javascript:history.back();"><span class="oi oi-arrow-thick-left"></span></a>
    </div>
</div>
<div class ="row" style ="padding-top:10px; background-color:#fff">
    <div class="col" style="padding-left:5px;"><h5>Account</h5></div>

</div>
<div class="row" style="border-bottom:2px solid #f8eded;background-color:#fff">
    <div class="col">
        <img src="<%=author.profile_pic %>" class="rounded-circle" alt="profile_pic" width="100" />
    </div>
    <div class="col">
        <font style ="font-size:24px;color:#000"><%=author.author_name %></font>
    </div>
</div>

</asp:Content>

