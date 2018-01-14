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
    <div class="col" style="padding-left:5px;"><h5><asp:Literal runat="server" ID="accountLabel"></asp:Literal></h5></div>

</div>
<div class="row" style="border-bottom:2px solid #f8eded;background-color:#fff;padding-bottom:5px;">
    <div class="col">
        <img src="<%=author.profile_pic %>" class="rounded-circle" alt="profile_pic" width="50" />
    </div>
    <div class="col">
        <font style ="font-size:12px;color:#000"><%=author.author_name %></font><br />
        <font style ="font-size:12px;color:#000"><%=author.email %></font><br />
    </div>
    <div class="col">
        <asp:Button runat="server" ID="logoutBtn" Text="logout" CssClass="btn btn-danger"  OnClick="logoutBtn_Click"/>
    </div>
</div>

<div class="row" style="border-bottom:2px solid #f8eded;background-color:#fff;padding-top:5px;padding-bottom:5px;">
    <div class="col">
        <asp:Literal runat="server" ID="presetLangLabel"></asp:Literal>
    </div>
    <div class="col">
        <asp:DropDownList runat="server" ID ="presetLang" CssClass="form-control" OnSelectedIndexChanged="presetLang_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
       
    </div>
</div>

</asp:Content>

