<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="HoaDon.aspx.cs" Inherits="HoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
.input
{
    border-radius:10px;
}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <h2>
        Danh sách hóa đơn</h2>
    <div class="header-main">
        <asp:Button ID="Button1" runat="server" Text="Đặt chỗ" PostBackUrl="~/admin/DatCho.aspx" />
        <br />
        <br />
       
        <asp:Button ID="ThemMonAn" runat="server" Text="Đơn Ship" PostBackUrl="~/admin/DonHang.aspx" />
      <ul class="search">
            <li >
                <asp:TextBox ID="txtsearch" runat="server" OnTextChanged="txtsearch_TextChanged"
                    ToolTip="Nhập mã nv thu ngân ,trạng thái hoặc mã hóa đơn"></asp:TextBox></li>
            <li>
                <asp:Button ID="btnsearch" runat="server" Text="search" OnClick="btnsearch_Click" /></li>
            <div class="clear-both">
            </div>
        </ul><br /><br />
         <ul class="search">
            <li>
                <asp:TextBox ID="txtngay" runat="server" OnTextChanged="txtsearch_TextChanged" 
                    Width="165px" style="-moz-border-radius: 6px;-webkit-border-radius: 6px;margin-right: 5px;" 
                    Height="28px"></asp:TextBox></li>
            <li>
                <asp:Button ID="Button2" runat="server" Text="Lọc dữ liệu" OnClick="btnloc_Click" /></li>
            <div class="clear-both">
            </div>
        </ul>
      
        <asp:GridView ID="grDs" runat="server" AutoGenerateColumns="False" DataKeyNames="mahoadon"
            DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" 
            Width="785px" CellPadding="4" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="mahoadon" HeaderText="Mã hóa đơn" InsertVisible="False"
                    ReadOnly="True" SortExpression="mahoadon" />
                <asp:BoundField DataField="ngaythang" HeaderText="Ngày đặt" SortExpression="ngaythang"
                    DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="manv" HeaderText="Nhân Viên" SortExpression="manv" />
                <asp:BoundField DataField="nguoidat" HeaderText="Khách hàng" SortExpression="nguoidat"
                    ReadOnly="True" />
                <asp:BoundField DataField="sdt" HeaderText="Số điện thoại" SortExpression="sdt" ReadOnly="True" />
                <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" ReadOnly="True" />
                <asp:BoundField DataField="tongtien" HeaderText="Tổng tiền" SortExpression="tongtien"
                    ReadOnly="True" />
                <asp:BoundField DataField="trangthai" HeaderText="Trạng thái" SortExpression="trangthai" />
                <asp:BoundField DataField="chuthich" HeaderText="Chú thích" SortExpression="chuthich" />
                <asp:BoundField DataField="hinhthucthanhtoan" HeaderText="Hình thức TT" SortExpression="hinhthucthanhtoan"
                    ReadOnly="true" />
                <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="CTHoaDon.aspx?mahoadon={0}"
                    NavigateUrl="~/admin/CTHoaDon.aspx" Text="Chi tiết" />

                      <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="GuiEmail.aspx?mahoadon={0}"
                    NavigateUrl="~/admin/GuiEmail.aspx" Text="Gửi Mail" />

                <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa không?')"
                            Visible="false"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" EditText="Sửa" />
            </Columns>
            <EmptyDataTemplate>
                Không có bản ghi
            </EmptyDataTemplate>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString14 %>"
            SelectCommand="SELECT * FROM [HOA_DON] order by ngaythang desc " DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon"
            UpdateCommand="UPDATE [HOA_DON] SET [trangthai] = @trangthai, [manv] = @manv,[chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
        </asp:SqlDataSource>
        <div class="clear-both">
        </div>
    </div>
    <asp:Label ID="lblthongbao" runat="server" Text=""></asp:Label>
</asp:Content>
