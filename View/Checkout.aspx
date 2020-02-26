<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageDangNhap.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
      
    <div class="content-main checkout">
        <div class="container">
            <div class="content-inner detail-content">
                <h2>
                    Thông tin đặt hàng</h2>
                <img src="../anhmonan/title-line.png" alt="Alternate Text" />
                <div class="content">
                    <div class="float-left width40">
                        <div class="content_dathang">
                            <h3 style="color: #FF9900">
                                Địa chỉ giao hàng</h3>
                            <table runat="server" class="dc-giaohang">
                                <tr>
                                    <td class="style1">
                                        Tên người nhận
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTenNguoiNhan" runat="server" Width="220px"></asp:TextBox>
                                        <asp:RequiredFieldValidator class="error" ID="reqNguoiNhan" runat="server" ControlToValidate="txtTenNguoiNhan"
                                            ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập tên</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        Địa chỉ
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtdc" runat="server" Width="220px"></asp:TextBox>
                                        <asp:RequiredFieldValidator class="error" ID="reqDC" runat="server" ControlToValidate="txtdc"
                                            ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập địa chỉ</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        Điện thoại
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtdt" runat="server" OnTextChanged="TextBox2_TextChanged" Width="220px"></asp:TextBox>
                                        <asp:RequiredFieldValidator class="error" ID="reqDT" runat="server" ControlToValidate="txtdt"
                                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" Display="Dynamic">Cần nhập SĐT</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator class="error" ID="rdt2" ControlToValidate="txtdt"
                                            runat="server" ForeColor="Red" ValidationExpression="\d{10}" Display="Dynamic">Bạn phải nhập vào 10 số</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                            <h3 style="color: #FF9900">
                                Thông tin thanh toán</h3>
                            <br />
                         <asp:CheckBox ID="chkTructiep" runat="server" OnCheckedChanged="chkTructiep_CheckedChanged" /> 
                            Thanh toán khi nhận hàng
                            <asp:Table ID="Table1" runat="server" class="table_dathang">
                                <asp:TableRow>
                                    <asp:TableCell>
                Ngân hàng
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="150px">
                                            <asp:ListItem Value="VietComBank"></asp:ListItem>
                                            <asp:ListItem Value="ViettinBank"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                Mã thẻ
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtmathe" runat="server" Width="150px"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div class="float-left width60">
                        <div class="content_bangdathang" style="color: #000000">
                            <h3 style="color: #FF9900">
                                Món ăn đã đặt
                            </h3>
                            <asp:GridView ID="grvdsdat" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="mamon" HeaderText="Mã Món ăn" />
                                    <asp:TemplateField HeaderText="Tên món ăn">
                                        <ItemTemplate>
                                            <asp:Label ID="lblhang" runat="server" Text='<%# Eval("tenmon") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="gia" HeaderText="Giá" />
                                    <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                                    <asp:BoundField DataField="thanhtien" HeaderText="Thành tiền" />
                                </Columns>
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
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblPhiship" runat="server"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblTongTien" runat="server"></asp:Label>
                            <br />
                            <asp:Button ID="btnDatHang" runat="server" Text="Đặt hàng" OnClick="btnDatHang_Click"
                                Style="margin-left: 52" BackColor="#C50202" Width="150px" />
                        </div>
                    </div>
                    <div class="clear-fix">
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDsDonhang" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString7 %>"
                    SelectCommand="SELECT * FROM [HOA_DON]" OnInserted="SqlDsMonan_Inserted" OnSelecting="SqlDsMonan_Selecting"
                    DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" 
                    InsertCommand="INSERT INTO [HOA_DON] ([makh], [manv], [ngaythang], [sdt], [diachi], [tongtien], [nguoidat], [hinhthucthanhtoan], [trangthai], [chuthich]) VALUES (@makh, @manv, @ngaythang, @sdt, @diachi, @tongtien, @nguoidat, @hinhthucthanhtoan, @trangthai, @chuthich);SELECT @mahoadon=SCOPE_IDENTITY()"
                    UpdateCommand="UPDATE [HOA_DON] SET [makh] = @makh,  [manv] = @manv, [ngaythang] = @ngaythang, [sdt] = @sdt, [diachi] = @diachi, [tongtien] = @tongtien, [nguoidat] = @nguoidat, [hinhthucthanhtoan] = @hinhthucthanhtoan, [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
                    <DeleteParameters>
                        <asp:Parameter Name="mahoadon" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mahoadon" Type="Int32" Direction="Output" DefaultValue="0" />
                        <asp:Parameter Name="makh" Type="Int32" />
                        <asp:Parameter Name="manv" Type="Int32" />
                        <asp:Parameter Name="ngaythang" DbType="Date" />
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
                        <asp:Parameter Name="manv" Type="Int32" />
                        <asp:Parameter Name="ngaythang" DbType="Date" />
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
                <asp:SqlDataSource ID="SqlDschitietdon" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString8 %>"
                    SelectCommand="SELECT * FROM [CT_HOA_DON] WHERE ([mahoadon] = @mahoadon)" DeleteCommand="DELETE FROM [CT_HOA_DON] WHERE [machitiet] = @machitiet"
                    InsertCommand="INSERT INTO [CT_HOA_DON] ([mahoadon],[maban], [mamonan], [soluong]) VALUES (@mahoadon,@maban, @mamonan, @soluong)"
                    UpdateCommand="UPDATE [CT_HOA_DON] SET [mahoadon] = @mahoadon, [maban] = @maban, [mamonan] = @mamonan, [soluong] = @soluong WHERE [machitiet] = @machitiet"
                    OnSelecting="SqlDschitietdon_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="machitiet" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mahoadon" Type="Int32" />
                         <asp:Parameter Name="maban" Type="String" />
                        <asp:Parameter Name="mamonan" Type="String" />
                        <asp:Parameter Name="soluong" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mahoadon" Type="Int32" />
                        <asp:Parameter Name="maban" Type="String" />
                        <asp:Parameter Name="mamonan" Type="String" />
                        <asp:Parameter Name="soluong" Type="Int32" />
                        <asp:Parameter Name="machitiet" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
