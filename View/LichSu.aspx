<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageDangNhap.master" AutoEventWireup="true"
    CodeFile="LichSu.aspx.cs" Inherits="LichSu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner detail-content">
                <h2 style="color: #FF6600; text-align: center;">
                    Lịch Sử Mua Hàng</h2>
                <ul class="search float-right">
                    <li>
                        <asp:TextBox ID="txtsearch1" runat="server" 
                            OnTextChanged="txtsearch_TextChanged" ToolTip="Nhập mã hóa đơn hoặc ngày tháng"></asp:TextBox></li>
                    <li>
                        <asp:Button ID="btnsearch" runat="server" Text="search" OnClick="btnsearch_Click"
                            Width="100px" /></li>
                    <div class="clear-both">
                    </div>
                </ul>
                <div class="clear-fix">
                </div>
                <asp:GridView ID="GrLichSu" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    Height="195px" Width="989px" CellPadding="4" ForeColor="#333333" GridLines="None"
                    AllowPaging="True" DataKeyNames="mahoadon">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="mahoadon" HeaderText="Mã HĐ" SortExpression="mahoadon"
                            InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="makh" HeaderText="makh" SortExpression="makh" Visible="False" />
                        <asp:BoundField DataField="ngaythang" HeaderText="Ngày Mua" SortExpression="ngaythang"
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="sdt" HeaderText="Số ĐT" SortExpression="sdt" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa Chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="tongtien" HeaderText="Tổng Tiền" SortExpression="tongtien" />
                        <asp:BoundField DataField="nguoidat" HeaderText="Họ Tên" SortExpression="nguoidat" />
                        <asp:BoundField DataField="hinhthucthanhtoan" HeaderText="Hình Thức Thanh Toán" SortExpression="hinhthucthanhtoan" />
                        <asp:BoundField DataField="trangthai" HeaderText="Trạng Thái" SortExpression="trangthai" />
                        <asp:BoundField DataField="chuthich" HeaderText="Chú Thích" SortExpression="chuthich" />
                        <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="LichSuCT.aspx?mahoadon={0}"
                            NavigateUrl="~/View/LichSuCT.aspx" Text="Chi tiết" />
                    </Columns>
                    <EmptyDataTemplate>
                        Không có bản ghi.
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString34 %>"
                    SelectCommand="SELECT [mahoadon], [makh], [ngaythang], [sdt], [diachi], [tongtien], [nguoidat], [hinhthucthanhtoan], [trangthai], [chuthich] FROM [HOA_DON]"
                    DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" InsertCommand="INSERT INTO [HOA_DON] ([makh], [ngaythang], [sdt], [diachi], [tongtien], [nguoidat], [hinhthucthanhtoan], [trangthai], [chuthich]) VALUES (@makh, @ngaythang, @sdt, @diachi, @tongtien, @nguoidat, @hinhthucthanhtoan, @trangthai, @chuthich)"
                    UpdateCommand="UPDATE [HOA_DON] SET [makh] = @makh, [ngaythang] = @ngaythang, [sdt] = @sdt, [diachi] = @diachi, [tongtien] = @tongtien, [nguoidat] = @nguoidat, [hinhthucthanhtoan] = @hinhthucthanhtoan, [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
                    <DeleteParameters>
                        <asp:Parameter Name="mahoadon" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="makh" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="ngaythang" />
                        <asp:Parameter Name="sdt" Type="String" />
                        <asp:Parameter Name="diachi" Type="String" />
                        <asp:Parameter Name="tongtien" Type="Double" />
                        <asp:Parameter Name="nguoidat" Type="String" />
                        <asp:Parameter Name="hinhthucthanhtoan" Type="String" />
                        <asp:Parameter Name="trangthai" Type="String" />
                        <asp:Parameter Name="chuthich" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="makh" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="ngaythang" />
                        <asp:Parameter Name="sdt" Type="String" />
                        <asp:Parameter Name="diachi" Type="String" />
                        <asp:Parameter Name="tongtien" Type="Double" />
                        <asp:Parameter Name="nguoidat" Type="String" />
                        <asp:Parameter Name="hinhthucthanhtoan" Type="String" />
                        <asp:Parameter Name="trangthai" Type="String" />
                        <asp:Parameter Name="chuthich" Type="String" />
                        <asp:Parameter Name="mahoadon" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
