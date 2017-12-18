<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="CreateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/zh_HK/sdk.js#xfbml=1&version=v2.9&appId=315213855590805";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <div class ="row" style="background:#f8dddd">
        <div class="col-xs-6" style="text-align:center;">

            <a href = "javascript:window.history.back();">back</a>

        </div>
        <div class="col-xs-6" style="text-align:center;padding-left:20px;display:table-cell;">

            <b>Create Account</b>

        </div>
    </div>
    <div class ="row" style="padding-top:15px;">
        <div class ="col-12" style="text-align:center;display:table-cell;">
            <asp:TextBox runat="server" ID="Name" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage ="Please Enter Name" ID="nameValidator"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox runat="server" ID="Email" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button runat="server" ID="SignUpBtn" CssClass="btn btn-info" Width="200" OnClick ="SignUpBtn_Click"></asp:Button>
            <br />
            <div class="fb-login-button" data-width="200" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
        </div>
    </div>
</asp:Content>

