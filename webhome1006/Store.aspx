<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="webhome1006.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            color: #006600;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            font-size: large;
            color: #006600;
        }
        .auto-style4 {
            color: #009933;
        }
        .auto-style6 {
            font-size: medium;
        }
        .auto-style8 {
            font-size: medium;
            color: #003366;
            font-weight: bold;
            background-color: #CCFFCC;
        }
        .auto-style9 {
            color: #003366;
            background-color: #CCFFCC;
        }
        .auto-style10 {
            font-weight: bold;
        }
        .auto-style11 {
            width: 428px;
        }
    </style>
</head>
<body style="background-image: url('alex-gruber-O5fzde2UcvM-unsplash.jpg'); background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background-position: center center; font-family: 微軟正黑體; color: #006600;">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>商店</strong></div>
        <table class="auto-style2">
            <tr>
                <td>
                    <strong>
                    <asp:Label ID="userShowLB" runat="server" Text="顯示使用者資料" Font-Names="微軟正黑體" CssClass="auto-style3"></asp:Label>
                    </strong>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <strong>
                    <asp:Button ID="orderBT" runat="server" CssClass="auto-style8" Font-Names="微軟正黑體" Text="前往訂購" OnClick="orderBT_Click" />
                    <asp:Button ID="truncateTableBT" runat="server" CssClass="auto-style8" Font-Names="微軟正黑體" Text="重建表單" OnClick="truncateTableBT_Click" />
                    </strong>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <strong>
                    <asp:DropDownList ID="DrinkList" runat="server" Font-Names="微軟正黑體" AutoPostBack="True" OnSelectedIndexChanged="drinkList_SelectedIndexChanged" DataSourceID="drinkData" DataTextField="drink_name" DataValueField="drink_id" CssClass="auto-style8">
                    </asp:DropDownList>
                    <asp:Label ID="DrinkPriceLB" runat="server" Text="X元" CssClass="auto-style6"></asp:Label>
                    <asp:Label ID="DrinkQtLB" runat="server" Text="庫存X個" CssClass="auto-style6"></asp:Label>
                    </strong>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style2">
            <tr>
                <td class="auto-style11">
                    <asp:DropDownList ID="cupList" runat="server" CssClass="auto-style10" Font-Names="微軟正黑體" Font-Size="Medium" Visible="False">
                    </asp:DropDownList>
                    <asp:Label ID="cupLB" runat="server" CssClass="auto-style6" Font-Bold="True" Text="杯" Visible="False"></asp:Label>
                    <strong>
                        <asp:DropDownList ID="sweetList" runat="server" CssClass="auto-style10" Font-Names="微軟正黑體" Font-Size="Medium" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>半糖</asp:ListItem>
                        <asp:ListItem>少糖</asp:ListItem>
                        <asp:ListItem>微糖</asp:ListItem>
                        <asp:ListItem>無糖</asp:ListItem>
                    </asp:DropDownList>
                        <asp:DropDownList ID="iceList" runat="server" CssClass="auto-style10" Font-Names="微軟正黑體" Font-Size="Medium" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>少冰</asp:ListItem>
                        <asp:ListItem>去冰</asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                    <asp:Button ID="addItemBT" runat="server" CssClass="auto-style9" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="添加" Visible="False" Enabled="False" OnClick="addItemBT_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Image ID="drinkImage" runat="server" Height="280px" Width="375px" />
                </td>
                <td>
                    <asp:GridView ID="orderItemGridView" runat="server" CssClass="auto-style6" Visible="False" DataSourceID="orderItemDataSource" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Width="500px" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" DataKeyNames="orderItem_id" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="ItemGridView_RowDataBound" OnRowDeleted="ItemGridView_RowDeleted">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="編號" InsertVisible="False" SortExpression="orderItem_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderItem_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderItem_id") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="飲品" SortExpression="drink_name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editDrinkNameList" runat="server" DataSourceID="editSqlDataSource" DataTextField="drink_name" DataValueField="drink_id" SelectedValue='<%# Bind("drink_id", "{0}") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="editSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_id], [drink_name] FROM [drinkTable] WHERE ([drink_id] &gt; @drink_id)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="drink_id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("drink_name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="數量" SortExpression="num">
                                <EditItemTemplate>
                                    <asp:TextBox ID="editCupTB" runat="server" Height="16px" Text='<%# Bind("num") %>' Width="47px" OnTextChanged="editCupTB_TextChanged"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="itemCupLB" runat="server" Text='<%# Bind("num") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="甜度" SortExpression="sweet">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("sweet") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>半糖</asp:ListItem>
                                        <asp:ListItem>少糖</asp:ListItem>
                                        <asp:ListItem>微糖</asp:ListItem>
                                        <asp:ListItem>無糖</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("sweet") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="冰度" SortExpression="ice">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("ice") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>少冰</asp:ListItem>
                                        <asp:ListItem>去冰</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ice") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="小計" SortExpression="subtotal">
                                <EditItemTemplate>
                                    <asp:Label ID="SubTotalLB" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="SubTotalLB" runat="server" Text='<%# Bind("subtotal") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="微軟正黑體" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="drink_id" SortExpression="drink_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("drink_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("drink_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:Label ID="totalLB" runat="server" Font-Bold="True" Font-Names="微軟正黑體" style="font-size: x-large" Text="總價" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="drinkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_id], [drink_name] FROM [drinkTable]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="drinkDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_price], [drink_qt] FROM [drinkTable] WHERE ([drink_id] = @drink_id)" InsertCommand="INSERT INTO orderTable(order_time, order_userphone) VALUES (GETDATE(), @order_userphone)">
            <InsertParameters>
                <asp:SessionParameter Name="order_userphone" SessionField="phone" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DrinkList" PropertyName="SelectedValue" Name="drink_id" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="drinkDetailsView" runat="server" Height="50px" Visible="False" Width="225px" DataSourceID="drinkDataSelect" CssClass="auto-style6">
        </asp:DetailsView>
        <asp:SqlDataSource ID="orderItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO orderItemTable(drink_id, order_id, num, sweet, ice) VALUES (@drink_id, @order_id, @num, @sweet, @ice)" SelectCommand="SELECT orderItemTable.orderItem_id, drinkTable.drink_name, orderItemTable.num, orderItemTable.sweet, orderItemTable.ice, orderItemTable.num * drinkTable.drink_price AS subtotal, orderItemTable.drink_id FROM drinkTable INNER JOIN orderItemTable ON drinkTable.drink_id = orderItemTable.drink_id WHERE (orderItemTable.order_id = @order_id)" DeleteCommand="DELETE FROM orderItemTable WHERE (orderItem_id = @orderItem_id)" UpdateCommand="UPDATE orderItemTable SET num = @num, sweet = @sweet, ice = @ice, drink_id = @drink_id WHERE (orderItem_id = @orderItem_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="orderItemGridView" PropertyName="SelectedDataKey" Name="orderItem_id"></asp:ControlParameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DrinkList" Name="drink_id" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
                <asp:ControlParameter ControlID="cupList" Name="num" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="sweetList" Name="sweet" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="iceList" Name="ice" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="order_id" Name="order_id"></asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="orderItemGridView" PropertyName="SelectedValue" Name="num"></asp:ControlParameter>
                <asp:ControlParameter ControlID="orderItemGridView" PropertyName="SelectedValue" Name="sweet"></asp:ControlParameter>
                <asp:ControlParameter ControlID="orderItemGridView" PropertyName="SelectedValue" Name="ice"></asp:ControlParameter>
                <asp:ControlParameter ControlID="orderItemGridView" PropertyName="SelectedDataKey" Name="orderItem_id"></asp:ControlParameter>
                <asp:ControlParameter ControlID="orderItemGridView" Name="drink_id" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
