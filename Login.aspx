<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            margin:10px;
             background-color:#464646;     
        }
        #loginScreen {
            background-image: url(<%=photo2%>);
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            background-color:#464646;     
            display: flex;
            align-items: center;   
            position: relative;  
        }
    </style>


<%--<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1558355577612796',
            cookie: true,
            xfbml: true,
            version: '2.2'
        });

        FB.AppEvents.logPageView();

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script>
    FB.getLoginStatus(function (response) {
        //statusChangeCallback(response);
        console.log(response);
    });

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
           // statusChangeCallback(response);
        });
    }
</script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.12&appId=1558355577612796&autoLogAppEvents=1';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

        <div class="row" id ="loginScreen">
        <div class = "col-md-12" style = "color:white;display:table-cell;text-align:center;vertical-align:middle;z-index:3;">
           <img src = "images/Unknown-person.gif" alt="loginImage" class="img-thumbnail" />
           <br />
           <h3><%=(string)GetLocalResourceObject("Login")%></h3>
            <br />
            <asp:TextBox runat="server" ID="loginName" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID ="loginNameRF" ControlToValidate ="loginName" ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox runat="server" ID="password" Textmode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID ="passwordRF" ControlToValidate ="password" ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <asp:Button runat="server" ID="loginBtn" CssClass="btn btn-primary" Width ="200" OnClick ="loginBtn_Click"/>
            <br />
            
            
<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true"></div>
            <br />
            <a href ="forgotPassword.aspx" style ="color:#fff;"><h4><%=(string)GetLocalResourceObject("ForgetPassword")%></h4></a>
            <br />
            <a href ="CreateAccount.aspx" style ="color:#fff;"><h4><%=(string)GetLocalResourceObject("CreateAccount")%></h4></a>
        </div>
    </div>
</asp:Content>

