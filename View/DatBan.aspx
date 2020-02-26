<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageDangNhap.master" AutoEventWireup="true"
    CodeFile="DatBan.aspx.cs" Inherits="DatBan"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">

</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">

    <div class="content-main lienhe">
        <div class="container">
            <div class="content-inner detail-content">
                <h2>
                    Liên hệ đặt bàn</h2>
                <img src="../anhmonan/title-line.png" alt="Alternate Text" />
                <div class="float-left width50">
                    <p>
                        CÔNG TY CỔ PHẦN ẨM THỰC VIỆT NHẬT<br />
                        Nhà hàng hải sản Nhật Hatoyama<br />
                        Add: Số 8 Vạn Phúc, Ba Đình, Hà Nội<br />
                        Hotline: 091 799 22 88<br />
                    </p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d70864.6030973043!2d105.85088871521248!3d21.018199940482926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1zTmjDoCBow6BuZyBIYXRveWFtYQ!5e0!3m2!1svi!2s!4v1564199952283!5m2!1svi!2s"
                        height="300px" width="448px" frameborder="0" style="border: 0" allowfullscreen="">
                    </iframe>
                </div> 
                       
                <div class="float-left width50">
                    <table runat="server" id="lienhedatban">
                     <tr>
                            <td>
                                Họ và tên (*)
                            </td>
                            <td>
                                <asp:TextBox ID="txten" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txten" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please fill the required field</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email (*)
                            </td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtemail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please fill the required field</asp:RequiredFieldValidator>
                               

                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số điện thoại (*)
                            </td>
                            <td>
                                <asp:TextBox ID="txtdienthoai" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtdienthoai" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please fill the required field</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator class="error" ID="rdt2" ControlToValidate="txtdienthoai"
                                    runat="server" ForeColor="Red" ValidationExpression="\d{10}" Display="Static">Please fill your phone number</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số người (*)
                            </td>
                            <td>
                                <asp:TextBox ID="txtsonguoi" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator3" runat="server"
                                 ControlToValidate="txtsonguoi" ErrorMessage="RequiredFieldValidator" 
                                    Display="Dynamic" ForeColor="Red">Please fill the required field</asp:RequiredFieldValidator><br />
                           <asp:RangeValidator ID="ranSoluong" runat="server" 
                                    ErrorMessage="RangeValidator" Text="Số Lượng không hợp lệ" MinimumValue="1" 
                                    MaximumValue="100" ControlToValidate="txtsonguoi" Display="Dynamic" ForeColor="Red" 
                                    Type="Integer"></asp:RangeValidator>
                           </td>
                        </tr>
                         <tr>
                            <td>
                                Giờ đặt bàn
                            </td>
                            <td>
                                <asp:TextBox ID="txtgio" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ngày đặt bàn (*)
                            </td>
                            <td><asp:RequiredFieldValidator class="error" ID="rngay" runat="server"
                                 ControlToValidate="txtngay" ErrorMessage="RequiredFieldValidator" 
                                    Display="Dynamic" ForeColor="Red">Please fill the required field</asp:RequiredFieldValidator><br />
                    
                                <asp:TextBox ID="txtngay" runat="server"></asp:TextBox>
                                  <br />
                                  <asp:CompareValidator ID="cmdngay" runat="server" 
                                    ErrorMessage="Ngày đặt không hợp lệ" ControlToValidate="txtngay" 
                                    ForeColor="Red" Operator="GreaterThanEqual" Type="Date">Ngày đặt không hợp lệ</asp:CompareValidator> 
                           
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Yêu cầu khác
                            </td>
                            <td>
                                <asp:TextBox ID="txtyeucau" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnDatBan" runat="server" Text="Gửi Đặt Bàn" OnClick="btnDatBan_Click"
                                    Width="200px" />
                            </td>
                        </tr>
                    
                    </table>
                    <br />
                    <asp:Label ID="lblLoi" runat="server"></asp:Label>
                    <br />
                    <br />
                </div>
                <div class="clear-fix" style="text-align: center"><h3>
                        Đối với chúng tôi, sự hài lòng của khách hàng là tôn chỉ của mọi hoạt động.
                    </h3>
                </div>
            </div>
        </div>
    </div>
     <div class="container" 
        style="color: #000000; top: 0px; left: 0px; height: 390px;">
            <div class="col-4">
                <div class="title" 
                    
                    style="font-family: 'Courier New', Courier, monospace; font-size: x-large; color: #800000; font-weight: bold;">
                    MÓN- ĂN</div>
                    &amp; THỰC ĐƠN
                <div class="content-footer">
                    <p>
                        <img src="../anhmonandacsac/monan.jpg" alt="" /></p>
                    <p>
                        Những món ăn độc đáo tại Hatoyama được chế biến bởi Chef Kyo Nguyen – đầu bếp hơn
                        20 năm kinh nghiệm với khoảng thời gian dài tu nghiệp tại Nhật. Chef Kyo Nguyen
                        đã từng phục vụ nguyên Thủ...&nbsp;&nbsp;</p></div>
                    &nbsp;<a href="DetailMonAn.aspx" shape="rect" 
                    style="color: #FFCC66; background-color: #000000; height: 28px; width: 306px; text-align: right; font-size: small;">See more...</a></div>
       <div class="col-4">
            <div class="title" 
                
                style="font-family: 'Courier New', Courier, monospace; font-size: x-large; color: #800000; font-weight: bold;">
                KHÔNG- GIAN<br /></div>
                &amp; VĂN HÓA NHẬT
            <div class="content-footer">
                <p>
                    <img src="../anhmonandacsac/khonggian.jpg"  alt="" />
                    <br />
                </p>
                <p>
                    Tọa lạc trên con phố Vạn Phúc trung tâm bậc nhất tại Hà Nội, Nhà hàng hải sản Nhật
                    Hatoyama (Japanese Fresh Seafood Restaurant) là điểm hẹn mới cho thực khách Việt
                    trót “phải lòng” với nền ẩm thực tinh tế của đất...
                </p>
                <a href="Detailkhgian.aspx" 
                    
                    style="color: #FFCC66; background-color: #000000; height: 28px; width: 306px; text-align: right; font-size: small;">See more...</a></div>
        </div>
    
    <div class="col-4">
        <div class="title" 
            
            style="font-family: 'Courier New', Courier, monospace; font-size: x-large; color: #800000; font-weight: bold;">
            CHÀO- MỪNG<br /> </div>
&nbsp;QUÝ KHÁCH
       
        <div class="content-footer">
            <img src="../anhmonandacsac/chaomung.png" alt="map" />
            <p>
                Love.Fresh "Love.Fresh" là slogan và cũng là tôn chỉ cho mọi hoạt động của Nhà hàng
                hải sản Nhật Hatoyama - Nhà hàng Nhật đẹp nhất Hà Nội. Love - tình yêu: - Nhà hàng
                hải sản Nhật Hatoyama...
            </p>
            <a href="DetailTrangChu.aspx" 
                
                
                style="color: #FFCC66; background-color: #000000; height: 28px; width: 306px; text-align: right; font-size: small;">See more...</a></div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDsDonhang" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString7 %>"
                    SelectCommand="SELECT * FROM [HOA_DON]" OnInserted="SqlDsMonan_Inserted" OnSelecting="SqlDsMonan_Selecting"
                    DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" 
                    InsertCommand="INSERT INTO [HOA_DON] ([makh], [manv], [ngaythang], [sdt], [diachi], [tongtien], [nguoidat], [hinhthucthanhtoan], [trangthai], [chuthich]) VALUES (@makh, @manv, @ngaythang, @sdt, @diachi, @tongtien, @nguoidat, @hinhthucthanhtoan, @trangthai, @chuthich);SELECT @mahoadon=SCOPE_IDENTITY()"
                    UpdateCommand="UPDATE [HOA_DON] SET [makh] = @makh, [manv] = @manv, [ngaythang] = @ngaythang, [sdt] = @sdt, [diachi] = @diachi, [tongtien] = @tongtien, [nguoidat] = @nguoidat, [hinhthucthanhtoan] = @hinhthucthanhtoan, [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
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
</asp:Content>
