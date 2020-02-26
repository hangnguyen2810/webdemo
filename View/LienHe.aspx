<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master" AutoEventWireup="true"
    CodeFile="LienHe.aspx.cs" Inherits="LienHe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main lienhe">
        <div class="container">
            <div class="content-inner detail-content">
            <h2 class="title-monan">
                Liên hệ
                </h2>
                <img src="../anhmonan/title-line.png" alt="Alternate Text" />
                <div class="float-left width50">
                    LIÊN HỆ TRỰC TIẾP
                <br />
                Nếu bạn có vấn đề gì cần liên hệ trực tiếp với tôi, vui lòng xem thông tin bên dưới:
                <br />
                Điện Thoại: 0948 19 22 88
                <br />
                Email: nhahanghatoyamavn@gmail.com
                </div>
                <div class="float-left width50">
                    <table runat="server" id="Lienhe">
                    <tr>
                        <td>
                            Họ tên(*)
                        </td>
                        <td>
                            <asp:TextBox ID="txthoten" runat="server" />
                            <br />
                            <asp:RequiredFieldValidator class="error" ID="reqHT" runat="server" ControlToValidate="txthoten"
                                ErrorMessage="RequiredFieldValidator" ForeColor="Red">Vui lòng nhập họ tên</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email(*)
                        </td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" />
                            <br />
                            <asp:RequiredFieldValidator class="error" Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtemail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Vui lòng nhập email</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator class="error" ID="RegularExpressionValidator1" ControlToValidate="txtemail"
                                runat="server" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email không đúng định dạng</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Số điện thoại(*)
                        </td>
                        <td>
                            <asp:TextBox ID="txtsdt" runat="server" />
                            <br />
                            <asp:RequiredFieldValidator class="error" Display="Dynamic" ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtsdt" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Vui lòng nhập số điện thoại</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator class="error" Display="Dynamic" ID="rdt2" ControlToValidate="txtsdt"
                                runat="server" ForeColor="Red" ValidationExpression="\d{10}">Số điện thoại không đúng định dạng</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nội dung
                        </td>
                        <td>
                            <asp:TextBox ID="txtnoidung" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="btngui" runat="server" Text="Gửi Liên Hệ" 
                                OnClick="btngui_Click" Width="150px" />
                            <asp:Button ID="btnhuy" runat="server" Text="Hủy" onclick="btnhuy_Click" 
                                Width="150px" />
                        </td>
                    </tr>
                </table>
                 <p>
                    <asp:Label ID="lblLoi" runat="server"></asp:Label></p>
                </div>
                <div class="clear-fix"></div>
               
                    <div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d5266.510330059458!2d105.81552833847448!3d21.03327947641024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1575779696457!5m2!1svi!2s" width="964" height="300" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>
