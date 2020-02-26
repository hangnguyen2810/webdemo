<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master"
    AutoEventWireup="true" CodeFile="DoiNgu.aspx.cs" Inherits="DoiNgu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 286px;
            height: 106px;
        }
        .style2
        {
            width: 278px;
            height: 106px;
        }
        .style3
        {
            width: 229px;
            height: 106px;
        }
        .style4
        {
            width: 220px;
            height: 106px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner">
                <div class="float-left width50">
                    <div class="col-inner">
                        <img src="../anhthanhvien/doingu.jpg" width="400" height="450" alt="Alternate Text" />
                    </div>
                </div>
                <div class="float-left width50">
                    <div class="col-inner">
                        <div class="title-content">
                            <h2>
                                Đội Ngũ
                            </h2>
                        </div>
                        <div class="info">
                            <p>
                                Chúng tôi hiểu rằng chất lượng sản phẩm và dịch vụ được quyết định bởi cái “Tâm”
                                của những người làm nghề. Bởi vậy, Hatoyama quy tụ đội ngũ nhân viên chuyên nghiệp,
                                nhiệt tình, yêu nghề, đặc biệt là có sự am hiểu, có tình yêu lớn đối với văn hóa
                                ẩm thực Nhật Bản cũng như văn hóa của người Việt Nam. Là cầu nối giữa tinh hoa ẩm
                                thực Nhật Bản với những thực khách Việt Nam, Cán bộ nhân viên của Hatoyama luôn
                                phục vụ khách hàng theo nguyên tắc 3T3K tức là Tươi cười – Trung thực – Tận tâm,
                                Không nài ép khách – Không dối lừa khách – Không tranh cãi với khách. Đối với chúng
                                tôi, sự hài lòng của khách hàng là tôn chỉ của mọi hoạt động.</p>
                        </div>
                    </div>
                </div>
                <div class="clear-fix">
                    <h3 style="text-align: center">
                        Đối với chúng tôi, sự hài lòng của khách hàng là tôn chỉ của mọi hoạt động.
                    </h3>
                    <p style="text-align: center">
                        &nbsp;</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom" style="text-align: center; background-color: #000000;
        color: #FFFFFF">
        <h3 style="font-size: x-large; text-align: left;">
            &nbsp;</h3>
        <marquee width="100%" behavior="scroll">  
                        <h3 style="font-size: x-large; text-align: left; font-style: italic;">
                            Hatoyama đưa tinh hoa ẩm thực Nhật tới thực khách</h3></marquee>
        <p style="font-size: x-large; text-align: left;">
            &nbsp;</p>
        <p style="font-size: x-large; text-align: left;">
            &nbsp;</p>
        <p style="font-size: x-large; text-align: left;">
            <span style="color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif;
                font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                background-color: rgb(0, 0, 0); text-decoration-style: initial; text-decoration-color: initial;
                display: inline !important; float: none;">Linh hồn của Hatoyama là cái “TÂM” và
                “TẦM” của vị bếp trưởng Kyo Nguyễn, người đã có 20 năm kinh nghiệm trong nghề, từng
                phục vụ cho Thủ tướng Nhật Bản. Anh đã truyền cảm hứng và dẫn dắt đội ngũ nhân viên
                trong việc phục vụ khách hàng. Cùng các thành viên của HĐQT là những người yêu ẩm
                thực, khâm phục tinh hoa văn hóa Nhật Bản và am hiểu về con người Việt Nam, chúng
                tôi mong muốn xây dựng nên một Hatoyama là nơi giao thoa văn hóa Việt – Nhật.</span></p>
        <br />
        <br />
        <br />
    </div>
    </div>
</asp:Content>
