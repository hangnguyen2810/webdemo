<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master" AutoEventWireup="true"
    CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner detail-content">
                <h2 style="color: #FF6600">
                    Món Ăn Đã Đặt</h2>
                <p style="color: #CC3300">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    (Miễn Phí vận chuyển khi đặt đơn hàng &gt; 500,000VNĐ)</p>
                <br />
                <br />
                <asp:GridView ID="grGioHang" runat="server" AutoGenerateColumns="False"
                    OnRowCommand="grGioHang_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None"
                    BackColor="#FF5050" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="mamon" HeaderText="Mã món" />
                        <asp:TemplateField HeaderText="Tên món">
                            <ItemTemplate>
                                <asp:Label ID="lblTenmon" runat="server" Text='<%# Eval("tenmon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="gia" HeaderText="Giá" />
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
                                <asp:TextBox ID="txtsoluong" runat="server" Text='<%# Eval("soluong") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="thanhtien" HeaderText="Thành Tiền" />
                        <asp:ButtonField Text="Cập nhật" ButtonType="Button" CommandName="Select" />
                    </Columns>
                    <EmptyDataTemplate>
                        Không có món ăn trong giỏ hàng
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:Label ID="lblTongtien" runat="server" ForeColor="Black"></asp:Label>
                <br />
                <asp:Button ID="btntieptuc" runat="server" Text="Tiếp tục đặt món" Width="119px"
                    OnClick="btntieptuc_Click" BackColor="#C50202" />
                <asp:Button ID="btnXoagiohang" runat="server" Text="Xóa giỏ hàng" Width="111px" OnClick="btnXoagiohang_Click"
                    BackColor="#C50202" />
                <asp:Button ID="btnThanhtoan" runat="server" Text="Thanh Toán" Width="107px" OnClick="btnThanhtoan_Click"
                    BackColor="#C50202" />
            </div>
        </div>
    </div>
</asp:Content>
