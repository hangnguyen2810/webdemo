<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="CTBanAn.aspx.cs" Inherits="admin_CTBanAn" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1
        {
            width: 328px;
        }
        .style2
        {
            height: 29px;
            width: 161px;
        }
        .style3
        {
            width: 161px;
        }
        .style4
        {
            height: 32px;
        }
        .style5
        {
            height: 46px;
        }
        .style6
        {
            width: 161px;
            height: 46px;
        }
        .button:hover
        {
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="style1">
                        <asp:Panel ID="Panel1" runat="server" BorderColor="#FF9933" BorderStyle="Double"
                            Width="312px">
                            <asp:Panel ID="Panel5" runat="server" BorderColor="#FF9933">
                                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="137px" AutoGenerateRows="False"
                                    DataKeyNames="maban" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <Fields>
                                        <asp:BoundField DataField="maban" HeaderText="Bàn: " ReadOnly="True" SortExpression="maban" />
                                    </Fields>
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                </asp:DetailsView>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblLich" runat="server" Text="Hôm nay"></asp:Label>
                                &nbsp;</asp:Panel>
                            <h3 style="border-style: outset; color: #FF9900; height: 50px; width: 310px; font-size: x-large;"
                                dir="ltr">
                                Order
                            </h3>
                            <table>
                                <tr>
                                    <td class="style3">
                                        Thu Ngân
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddrthungan" runat="server" AutoPostBack="True" Height="24px"
                                            Width="161px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        <asp:Label ID="Label1" runat="server" Text="Loại Món"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:DropDownList ID="ddrLoai" runat="server" Height="24px" Width="161px" OnSelectedIndexChanged="ddrLoai_SelectedIndexChanged"
                                            AutoPostBack="True" OnLoad="ddrLoai_Load">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label3" runat="server" Text="Món Ăn"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:DropDownList ID="ddrMon" runat="server" Width="161px" OnSelectedIndexChanged="ddrMon_SelectedIndexChanged"
                                            AutoPostBack="True" OnLoad="ddrMon_Load" Height="24px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label4" runat="server" Text="Đơn Giá"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:DropDownList ID="ddrGia" runat="server" Height="24px" Width="80px" AutoPostBack="True">
                                        </asp:DropDownList>
                                        VNĐ
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <asp:Label ID="Label5" runat="server" Text="Số Lượng"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txtSL" runat="server" Height="24px" Width="80px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSL"
                                            ErrorMessage="Nhập Số lượng" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="ranSoluong" runat="server" ErrorMessage="RangeValidator"
                                            Text="Số Lượng không hợp lệ" MinimumValue="1" MaximumValue="100" ControlToValidate="txtSL"
                                            Display="Dynamic" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" align="center">
                                    </td>
                                    <td class="style4" align="center">
                                        <asp:Button  class="button" ID="btnThem" runat="server" Text="+ Thêm Món" OnClick="btnThem_Click"
                                            BackColor="#FFF7E7" BorderColor="#FFCC66" BorderStyle="Solid" Height="33px" Width="96px" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:Panel ID="Panel3" runat="server">
                                <table>
                                    <caption>
                                        <h3 style="border-style: outset; color: #FF9900; width: 358px;">
                                            Thông Tin Khách Hàng
                                        </h3>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="radiodatban" runat="server" Text="Đặt trước/Gộp HĐ" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtmahd" runat="server" Height="24px" Width="160px" ToolTip="Nhập mã HĐ đã có"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="Họ Tên"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:TextBox ID="txtHt" runat="server" Height="24px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label8" runat="server" Text="Số ĐT"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:TextBox ID="txtDT" runat="server" Height="24px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label9" runat="server" Text="Địa Chỉ"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:TextBox ID="txtDC" runat="server" Height="24px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                <asp:Button class="button" ID="btnXemTT" runat="server" BackColor="#C50202" BorderStyle="Double"
                                                    ForeColor="White" Height="34px" OnClick="btnXem_Click" Text="Xem Hóa Đơn" Width="109px" />
                                            </td>
                                            <td class="style6">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button  class="button" ID="btnIn" runat="server" BackColor="#C50202" BorderStyle="Double" ForeColor="White"
                                                    Height="34px" OnClick="btncapnhat_Click" Text="Cập nhật" Width="109px" />
                                            </td>
                                            <td class="style6">
                                                <asp:Button  class="button" ID="btnThanhtoan" runat="server" BackColor="#C50202" BorderStyle="Double"
                                                    ForeColor="White" Height="34px" OnClick="btnThanhtoan_Click" Text="Thanh Toán"
                                                    Width="109px" />
                                            </td>
                                        </tr>
                                    </caption>
                                </table>
                                <p style="text-align: center; font-weight: normal; font-size: large;">
                                    <asp:Label ID="lblThongBao" runat="server"></asp:Label></p>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server">
                                <h3 style="color: #FF9900">
                                    Món Đã Order
                                </h3>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="maban,machitiet"
                                    OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="mahoadon" HeaderText="Mã HĐ" SortExpression="mahoadon"
                                            ReadOnly="False" InsertVisible="False" />
                                        <asp:BoundField DataField="machitiet" HeaderText="machitiet" ReadOnly="True" SortExpression="machitiet"
                                            InsertVisible="False" Visible="False" />
                                        <asp:BoundField DataField="maban" HeaderText="Bàn" SortExpression="maban" ReadOnly="true" />
                                           <asp:BoundField DataField="mamonan" HeaderText="mamonan" SortExpression="mamonan"
                                            Visible="False" />
                                        <asp:BoundField DataField="tenmonan" HeaderText="Món ăn" SortExpression="tenmonan"
                                            ReadOnly="true" />
                                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong"
                                            ReadOnly="False" />
                                        <asp:BoundField DataField="gia" HeaderText=" Đơn Giá" SortExpression="gia" ReadOnly="true" />
                                        <asp:BoundField DataField="Thành tiền" HeaderText="Thành tiền" ReadOnly="True" SortExpression="Thành tiền" />
                                        <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Text="Sửa"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                    Text="Xóa" OnClientClick= "return confirm('Bạn muốn xóa món?')"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="InHD.aspx?mahoadon={0}"
                                            NavigateUrl="InHD.aspx" Text="In HĐ" />
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
                                Tổng tiền:
                                <asp:Label ID="lblTong" runat="server"></asp:Label>
                                &nbsp;VNĐ
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString27 %>"
                                    SelectCommand="select HOA_DON.mahoadon, machitiet,maban,CT_HOA_DON.mamonan,tenmonan,soluong,gia,soluong*gia as 'Thành tiền' from CT_HOA_DON inner join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan inner join HOA_DON on HOA_DON.mahoadon=CT_HOA_DON.mahoadon WHERE [maban] = @maban and trangthai=N'Đang ăn'"
                                    DeleteCommand="DELETE FROM [CT_HOA_DON] WHERE [machitiet] = @machitiet" UpdateCommand="UPDATE [CT_HOA_DON] SET [soluong] = @soluong, [mahoadon]=@mahoadon WHERE [machitiet] = @machitiet">
                                    <DeleteParameters>
                                        <asp:Parameter Name="machitiet" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="maban" QueryStringField="maban" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="mahoadon" Type="Int32" />
                                        <asp:Parameter Name="mamonan" Type="String" />
                                        <asp:Parameter Name="soluong" Type="Int32" />
                                        <asp:Parameter Name="machitiet" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString28 %>"
                                    SelectCommand="SELECT [maban] FROM [BAN_AN] WHERE ([maban] = @maban)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="maban" QueryStringField="maban" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:Timer ID="Timer1" runat="server" Interval="60000000">
            </asp:Timer>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:SqlDataSource ID="SqlDsDonhang" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString29 %>"
                DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" InsertCommand="INSERT INTO [HOA_DON] ([makh], [manv], [ngaythang], [sdt], [diachi], [tongtien], [nguoidat], [hinhthucthanhtoan], [trangthai], [chuthich]) VALUES (@makh, @manv, @ngaythang, @sdt, @diachi, @tongtien, @nguoidat, @hinhthucthanhtoan, @trangthai, @chuthich);SELECT @mahoadon=SCOPE_IDENTITY()"
                OnInserted="SqlDsDonhang_Inserted" SelectCommand="SELECT * FROM [HOA_DON]" UpdateCommand="UPDATE [HOA_DON] SET [makh] = @makh,[manv] = @manv, [ngaythang] = @ngaythang, [sdt] = @sdt, [diachi] = @diachi, [tongtien] = @tongtien, [nguoidat] = @nguoidat, [hinhthucthanhtoan] = @hinhthucthanhtoan, [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon"
                OnUpdated="SqlDsDonhang_Updated">
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
            <asp:SqlDataSource ID="SqlChitiet" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString30 %>"
                DeleteCommand="DELETE FROM [CT_HOA_DON] WHERE [machitiet] = @machitiet" InsertCommand="INSERT INTO [CT_HOA_DON] ([mahoadon],[maban], [mamonan], [soluong]) VALUES (@mahoadon,@maban, @mamonan, @soluong)"
                SelectCommand="SELECT * FROM [CT_HOA_DON] WHERE ([mahoadon] = @mahoadon)" UpdateCommand="UPDATE [CT_HOA_DON] SET [mahoadon] = @mahoadon,[maban]=@maban, [mamonan] = @mamonan, [soluong] = @soluong WHERE [machitiet] = @machitiet">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
