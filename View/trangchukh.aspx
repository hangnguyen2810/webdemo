<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master" AutoEventWireup="true"
    CodeFile="trangchukh.aspx.cs" Inherits="trangchukh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
.button
{
    opacity:0.8;
}
.button:hover
{
    opacity:1;
    
}

</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">

</div> 

    <div class="content-main">
        <div class="container">
            <div class="content-inner">
                <div class="float-left width50">
                    <div class="col-inner">
                        <img src="../anhmonan/thuonghieu.jpg" alt="Alternate Text" />
                    </div>
                </div>
                <div class="float-left width50">
                    <div class="col-inner">
                        <div class="title-content">
                            <h2>
                            CÂU CHUYỆN</h2>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <span style="color:Red; padding-top:0px; font-size:larger">thương hiệu Hatoyama </span> 
                            
                            <img src="../anhmonan/title-line.png" alt="Alternate Text" />
                        </div>
                        <div class="info">
                            <p>
                                Mỗi khát vọng cháy bỏng đều là khởi nguồn của một câu chuyện thú vị. Nhà hàng hải
                                sản Nhật Hatoyama (Japanese Fresh Seafood Restaurant) bắt đầu câu chuyện của mình
                                bằng khát vọng tột bậc đưa tinh hoa ẩm thực Nhật tới thực khách Việt. Khát vọng
                                đó được nhen nhóm từ niềm đam mê bất tận, cùng quyết tâm hiện thực hóa ước mơ lớn
                                trong cuộc đời của bếp trưởng tài hoa.
                            </p>
                            <a href="DetailTrangChu.aspx">Xem thêm</a>
                        </div>
                    </div>
                </div>
             <div class="clear-fix">
              <div class="container" style="color: #000000; top: 12px; left: 0px; height: 345px;">
                        <div class="col-4">
                            <div class="title" style="font-family: 'Courier New', Courier, monospace; font-size: x-large;
                                color: #800000; font-weight: bold;">
                                MÓN- ĂN</div>
                            &amp; THỰC ĐƠN
                            <div class="content-footer">
                                <p>
                                    <img src="../anhmonandacsac/monan.jpg" alt="" /></p>
                                <p>
                                    Những món ăn độc đáo tại Hatoyama được chế biến bởi Chef Kyo Nguyen – đầu bếp hơn
                                    20 năm kinh nghiệm với khoảng thời gian dài tu nghiệp tại Nhật. Chef Kyo Nguyen
                                    đã từng phục vụ nguyên Thủ...&nbsp;&nbsp;</p>
                                <p>
                                    &nbsp;</p>
                            </div>
                            <a href="DetailMonAn.aspx" shape="rect" 
                    style="color:#FFCC66; background-color:#000000; height: 28px; width: 306px; text-align:right">See more...</a>
                        </div>
                        <div class="col-4">
                            <div class="title" style="font-family: 'Courier New', Courier, monospace; font-size: x-large;
                                color: #800000; font-weight: bold;">
                                MENU<br />
                            </div>
                            &amp; ĐẶT MÓN
                            <div class="content-footer">
                                <p>
                                    <img src="../anhmonandacsac/datmon.jpg" alt="" />
                                    <br />
                                </p>
                                <p>
                                    Quý khách vui lòng nhấp "Chi tiết" Để cập nhật từng chương trình ưu đãi của nhà
                                    hàng Hatoyama
                                </p>
                                <p>
                                    &nbsp;</p>
                                <p>
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button
                                     class="button" ID="btnchitiet" CommandName="Đặt món" runat="server" Text="Chi tiết" BackColor="#C50202"
                                    Width="137px" onclick="chitiet_Click" /></p>
                                </div>
                        </div>
                        <div class="col-4" style="background-color: #990000">
                            <div class="title" style="font-family: 'Courier New', Courier, monospace; font-size: x-large;
                                color: #FFFFFF; font-weight: bold;">
                                ĐẶT- BÀN<br />
                            </div>
                            &amp; NHẬN ƯU ĐÃI
                            <div class="content-footer">
                                <img src="../anhmonandacsac/chaomung.png" alt="map" />
                                <p style="color: #FFFFFF">
                                    Quý khách vui lòng đặt bàn trước để giữ chỗ và được phục vụ tốt nhất! Vì sự hài
                                    lòng của thực khách là tôn chỉ cho mọi hoạt động của chúng tôi.
                                </p>
                                <p>
                                    &nbsp;</p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button class="button" ID="Datmon" CommandName="Đặt món" runat="server" 
                                    Text="Đặt Bàn Ngay" BackColor="#C50202"
                                    Width="130px" onclick="Datmon_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
