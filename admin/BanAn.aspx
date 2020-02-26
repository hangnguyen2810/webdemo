<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="BanAn.aspx.cs" Inherits="admin_BanAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <h2>
        Bàn Ăn</h2>
    <div class="header-main">
        <asp:Button ID="themban" runat="server" Text="Quản Lý Bàn Ăn" PostBackUrl="~/admin/QLBanAn.aspx" />
        
        <div class="clear-both" style="text-align: center">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="maban" DataSourceID="SqlDataSource1"
                RepeatColumns="5" Height="269px" BorderColor="#DEBA84" BorderStyle="None" BackColor="#DEBA84" 
                BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" OnItemDataBound="DataList1_ItemDataBound">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"/>
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    <asp:Label ID="mabanLabel" runat="server" Text='<%# Eval("maban") %>' Font-Size="Large"
                        Font-Bold="True"/>
                    <br />
                    <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("trangthai")%>' Enabled="True"
                        Visible="False" />
                    <br />
                    <asp:Label ID="sochoLabel" runat="server" Text='<%# Eval("socho")+" chỗ" %>' Font-Size="Small" />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("maban", "~/Admin/CTBanAn.aspx?maban={0}") %>'
                        BackColor="#FF3300">Chi tiết</asp:HyperLink>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString26 %>"
        DeleteCommand="DELETE FROM [BAN_AN] WHERE [maban] = @maban" InsertCommand="INSERT INTO [BAN_AN] ([maban], [trangthai], [socho]) VALUES (@maban, @trangthai, @socho)"
        SelectCommand="SELECT * FROM [BAN_AN]" UpdateCommand="UPDATE [BAN_AN] SET [socho] = @socho, [trangthai] = @trangthai WHERE [maban] = @maban">
        <DeleteParameters>
            <asp:Parameter Name="maban" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="maban" Type="String" />
            <asp:Parameter Name="socho" Type="Int32" />
            <asp:Parameter Name="trangthai" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="socho" Type="Int32" />
            <asp:Parameter Name="trangthai" Type="Boolean" />
            <asp:Parameter Name="maban" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
