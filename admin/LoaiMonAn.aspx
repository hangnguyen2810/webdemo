<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="LoaiMonAn.aspx.cs" Inherits="LoaiMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>Danh sách các loại món ăn</h2>
    <div class="header-main">
        <asp:Button ID="themloaimonan" runat="server" Text="Thêm mới" PostBackUrl="~/admin/ThemLoaiMonAn.aspx"/>
        <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" ToolTip="Nhập mã hoặc tên " ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" 
                            onclick="btnsearch_Click1" /></li>
                </ul>
        <div class="clear-both">
        </div>
    </div>
        <asp:GridView ID="grdloai" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maloaimonan" 
        DataSourceID="SqlDataSource1" CellPadding="4"  
    GridLines="None">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="maloaimonan" HeaderText="Mã Loại Món" 
                ReadOnly="True" SortExpression="maloaimonan" />
            <asp:BoundField DataField="tenloaimonan" HeaderText="Loại Món Ăn" 
                SortExpression="tenloaimonan" />
            <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
            <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Xóa"  OnClientClick="return confirm('Bạn có chắc chắn muốn xóa không?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="maloaimonan" DataNavigateUrlFormatString="SuaLoaiMonAn.aspx?maloaimonan={0}" Text="Sửa" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString22 %>" 
        DeleteCommand="DELETE FROM [LOAI_MON_AN] WHERE [maloaimonan] = @maloaimonan" 
        InsertCommand="INSERT INTO [LOAI_MON_AN] ([maloaimonan], [tenloaimonan], [mota]) VALUES (@maloaimonan, @tenloaimonan, @mota)" 
        SelectCommand="SELECT * FROM [LOAI_MON_AN]" 
        UpdateCommand="UPDATE [LOAI_MON_AN] SET [tenloaimonan] = @tenloaimonan, [mota] = @mota WHERE [maloaimonan] = @maloaimonan">
        <DeleteParameters>
            <asp:Parameter Name="maloaimonan" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="maloaimonan" Type="String" />
            <asp:Parameter Name="tenloaimonan" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenloaimonan" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
            <asp:Parameter Name="maloaimonan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
 </asp:Content>

