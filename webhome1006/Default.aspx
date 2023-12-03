<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webhome1006.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            font-size: medium;
            color: #3399FF;
            background-color: #C3B0A1;
        }
        .auto-style4 {
            font-size: medium;
            font-weight: bold;
            background-color: #CCFFCC;
        }
        .auto-style11 {
            margin-left: 22px;
        }
        .auto-style12 {
            margin-left: 27px;
        }
        .auto-style13 {
            text-align: center;
        }
    </style>
</head>
<body style="background-image: url('alex-gruber-O5fzde2UcvM-unsplash.jpg'); background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background-position: center center; font-weight: 700; font-size: xx-large; color: #006600; height: 50px; position: relative; font-family: 微軟正黑體; left: 0px; top: 0px;">
    <form id="form1" runat="server" style="position: relative">
        <div style="text-align: center">
            歡迎來到茶水間</div>
        <table class="auto-style1" style="position: relative">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">
                    <asp:Label ID="account" runat="server" style="font-size: large" Text="帳號"></asp:Label>
                    <asp:TextBox ID="accountTB" runat="server" CssClass="auto-style11"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">
                    <asp:Label ID="password" runat="server" style="font-size: large" Text="密碼"></asp:Label>
                    <asp:TextBox ID="passwordTB" runat="server" CssClass="auto-style12" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13"><strong>
                    <asp:Button ID="login" runat="server" CssClass="auto-style4" Text="登入" Width="95px" OnClick="LoginBT_click" Font-Names="微軟正黑體" />
                </strong>
                    <asp:LinkButton ID="Shop" runat="server" CssClass="auto-style3" Visible="False" PostBackUrl="~/Store.aspx">進入商店</asp:LinkButton>
                </td>
                <td>
                    
                    &nbsp;</td>
            </tr>
        </table>
        <asp:DetailsView runat="server" Width="350px" Height="50px" ID="ClientDetailview" EmptyDataText="帳號密碼錯誤" Visible="False" DataSourceID="clientDataSource"></asp:DetailsView>

        <asp:SqlDataSource ID="clientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT user_name, user_money, user_phone FROM userData WHERE (user_name = @user_name) AND (user_password = @user_password)">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTB" PropertyName="Text" Name="user_name" Type="String"></asp:ControlParameter>
                <asp:ControlParameter ControlID="passwordTB" PropertyName="Text" Name="user_password" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
    </body>
                
</html>
