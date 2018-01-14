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
    <div class ="col-md-12" style="color:#fff;margin:10px;padding:10px;background-color:#fff">
        <asp:TextBox runat="server" ID ="content" TextMode="MultiLine" Height="300" Width="100%" CssClass="form-control"></asp:TextBox>
        <br />
        <div id="imagesDiv"></div>
        <asp:FileUpload runat ="server" ID="imagesUploader" CssClass="form-control" Multiple="Multiple" onchange="this.form.submit()" />
        <br />
        <asp:Button runat="server" ID="postBtn" Text="Post" OnClick="postBtn_Click" CssClass="btn btn-primary" />
    </div>
</div>
</asp:Content>

