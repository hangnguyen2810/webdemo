<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageDangNhap.master" AutoEventWireup="true"
    CodeFile="OrderInfor.aspx.cs" Inherits="OrderInfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main orderinfor">
        <div class="container">
            <div class="content-inner detail-content">
                <div class="float-left width50">
                    <h3 class="hoadon-thanhtoan">
                        Hóa Đơn Thanh Toán</h3>
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="290px" DataSourceID="SqlDataSource1"
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                        CellPadding="4" GridLines="Horizontal" AutoGenerateRows="False">
                        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="makh" HeaderText=" Mã Khách hàng" SortExpression="makh" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="nguoidat" HeaderText="Người Đặt" SortExpression="nguoidat" />
                            <asp:BoundField DataField="hinhthucthanhtoan" HeaderText="Hình thức thanh toán" SortExpression="hinhthucthanhtoan" />
                            <asp:BoundField DataField="trangthai" HeaderText="Trạng Thái" SortExpression="trangthai" />
                            <asp:BoundField DataField="tongtien" HeaderText="Tổng Tiền" SortExpression="tongtien" />
                            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                            <asp:BoundField DataField="sdt" HeaderText="Số ĐT" SortExpression="sdt" />
                            <asp:BoundField DataField="ngaythang" HeaderText="Ngày Đặt" SortExpression="ngaythang" DataFormatString="{0:dd/MM/yyyy}" />
                        </Fields>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString9 %>"
                        
                        SelectCommand="SELECT [makh], [nguoidat], [hinhthucthanhtoan], [trangthai], [tongtien], [diachi], [sdt], [ngaythang] FROM [HOA_DON] WHERE ([mahoadon] = @mahoadon)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
           <div class="float-left width50">
                    <h3>
                        Món Ăn Đã Đặt</h3>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" CellPadding="4"
                        AutoGenerateColumns="False" DataKeyNames="machitiet" ForeColor="#333333" GridLines="None"
                        Height="153px" Width="306px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="machitiet" HeaderText="Mã Chi Tiết" 
                                SortExpression="machitiet" InsertVisible="False" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="mahoadon" HeaderText="Mã Hóa Đơn" 
                                SortExpression="mahoadon" />
                             <asp:BoundField DataField="tenmonan" HeaderText="Món Ăn" SortExpression="tenmonan" />
                            <asp:BoundField DataField="soluong" HeaderText="Số Lượng" 
                                SortExpression="soluong" />


                        </Columns>
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString10 %>"
                        SelectCommand="SELECT machitiet,mahoadon,[tenmonan], [soluong] FROM [CT_HOA_DON] inner join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan WHERE ([mahoadon] = @mahoadon)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" Text="Tiếp Tục Đặt Hàng" OnClick="Button1_Click"
                        Width="200px" />
                </div>
                     <div class="clear-fix">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
