<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecentlyList.aspx.cs" Inherits="RecentlyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script>
    function addLike(wall_id)
    {
        $.ajax({
            type: "POST",
            url: 'RecentlyList.aspx/AddLike',
            data: "{'wall_id':" + wall_id + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#" + wall_id + "_like").html(msg.d);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function addFav(wall_id)
    {
        alert(wall_id);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <asp:Repeater runat="server" ID="wallRepeater">
        <ItemTemplate>
            <div class ="row" >
                <div class ="col-md-12" style="color:#fff;margin:10px;padding:10px;background-color: rgba(23, 32, 42, 0.8);max-width:98%">
                   <div class ="row" style="padding-bottom:5px;">
                       <div class ="col">
                          <img src='<%# DataBinder.Eval(Container.DataItem, "profile_pic") %>' class="rounded-circle" alt="profile_pic" width ="50"/> 
                           &nbsp;
                          <a href = 'ProfilePage.aspx?author_id=<%# DataBinder.Eval(Container.DataItem, "author_id") %>'><%# DataBinder.Eval(Container.DataItem, "author_name") %></a>
                       </div>
                   </div>                    
                    <div class ="row" style="padding-bottom:5px;">
                        <div class ="col-md-12" style = "text-align:center" >
                            <a href = 'PostDetail.aspx?wall_id=<%# DataBinder.Eval(Container.DataItem, "wall_id") %>'><img src='<%# DataBinder.Eval(Container.DataItem, "photo_path") %>' class="img-fluid" alt="wall_item_cover" /></a>
                        </div>
                   </div>
                    <div class ="row">
                        <div class ="col-md-12">
                            <h5><%# DataBinder.Eval(Container.DataItem, "location") %></h5>        
                        </div>
                    </div>
                    <div class ="row" style="padding-bottom:5px;">
                        <div class ="col-md-12">
                            <font style="color:gray"><%# DataBinder.Eval(Container.DataItem, "date_text") %></font>
                        </div>
                    </div>
                    <div class ="row" style="padding-bottom:5px;">
                        <div class ="col-md-12">
                            <font style="font-size:12px"><%# DataBinder.Eval(Container.DataItem, "content") %></font>
                        </div>
                    </div>
                    <div class ="row" style="padding-bottom:5px;">
                        <div class ="col-md-12">
                            <a href ='javascript:addLike(<%# DataBinder.Eval(Container.DataItem, "wall_id") %>);' style ="color:#fff; text-decoration:none;">
                                <span class="oi oi-thumb-up"></span> <span id ='<%# DataBinder.Eval(Container.DataItem, "wall_id") %>_like'><%# DataBinder.Eval(Container.DataItem, "like_count") %></span>
                            </a>
                            &nbsp;
                            <a href ='javascript:addFav(<%# DataBinder.Eval(Container.DataItem, "wall_id") %>);' style ="color:#fff; text-decoration:none;">
                            <span class="oi oi-heart"></span> <span id ='<%# DataBinder.Eval(Container.DataItem, "fav_count") %>_fav'><%# DataBinder.Eval(Container.DataItem, "fav_count") %></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>
        <FooterTemplate>
            
        </FooterTemplate>
    </asp:Repeater>



</asp:Content>

