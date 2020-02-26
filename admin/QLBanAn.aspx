<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="QLBanAn.aspx.cs" Inherits="QLBanAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>Bàn Ăn</h2>
    <div class="header-main">
        <asp:Button ID="themban" runat="server" Text="Thêm mới" PostBackUrl="~/admin/Thembanan.aspx" />
        <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" 
                            ToolTip="Nhập mã bàn hoặc số chỗ" ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" 
                            onclick="btnsearch_Click" /></li>
                </ul>
        <div class="clear-both">
        </div>
    </div>
    <asp:GridView ID="grdbanan1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="maban" 
        DataSourceID="SqlDataSource1" CellPadding="4"  
    GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="maban" HeaderText="Mã Bàn" ReadOnly="True" 
                SortExpression="maban" />
            <asp:BoundField DataField="socho" HeaderText="Số Chỗ" SortExpression="socho" />
            <asp:CheckBoxField DataField="trangthai" HeaderText="Trạng thái" 
                SortExpression="trangthai" />
            <asp:TemplateField HeaderText="Chức năng" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Sửa"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Xóa"  OnClientClick="return confirm('Bạn có chắc chắn muốn xóa không?')"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66"  HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString25 %>" 
        DeleteCommand="DELETE FROM [BAN_AN] WHERE [maban] = @maban" 
        InsertCommand="INSERT INTO [BAN_AN] ([maban], [socho], [trangthai]) VALUES (@maban, @socho, @trangthai)" 
        SelectCommand="SELECT * FROM [BAN_AN]" 
        
        UpdateCommand="UPDATE [BAN_AN] SET [socho] = @socho, [trangthai] = @trangthai WHERE [maban] = @maban">
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

