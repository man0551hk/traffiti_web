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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            <a href ="forgotPassword.aspx" style ="color:#fff;"><h4><%=(string)GetLocalResourceObject("ForgetPassword")%></h4></a>
            <br />
            <a href ="CreateAccount.aspx" style ="color:#fff;"><h4><%=(string)GetLocalResourceObject("CreateAccount")%></h4></a>
        </div>
    </div>
</asp:Content>

