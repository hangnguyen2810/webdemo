<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangky.aspx.cs" Inherits="Dangky" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../anhmonandacsac/icon.png" type="image/x-icon" />
    <title>Nhà Hàng Nhật Hatoyama</title>
    <link href="StyleSheetkhachang.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="bg">
            <div class="content-dk">
                <div class="content-dk_inner">
                    <h2>
                        Đăng ký
                    </h2>
                    <table id="Table1" runat="server" class="dangky">
                        <tr>
                            <td>
                                Họ Tên
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtHoten" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqHT" class="error" runat="server" ControlToValidate="txtHoten"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào Họ Tên</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email<br />
                                &nbsp;<br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtemail" ErrorMessage="RequiredFieldValidator" ForeColor="Red"
                                    Display="Dynamic">Cần nhập vào Email</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator class="error" ID="remail" ControlToValidate="txtemail"
                                    runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic">Email chưa đúng định dạng</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật Khẩu<br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtMatkhau" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào Mật khẩu</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giới Tính
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtGioiTinh" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtGioiTinh" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào Giới Tính</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ngày Sinh
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtNgaySinh" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtNgaySinh" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào Ngày Sinh(vd: 12-02-1998)</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số Điện Thoại<br />
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtDt" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtDt" ErrorMessage="RequiredFieldValidator" ForeColor="Red"
                                    Display="Dynamic">Cần nhập vào Số Điện Thoại</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator class="error" ID="rdt2" ControlToValidate="txtDt"
                                    runat="server" ForeColor="Red" ValidationExpression="\d{10}" Display="Dynamic">Bạn phải nhập vào 10 số</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Địa chỉ
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtDc" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="txtDc" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào Địa Chỉ</asp:RequiredFieldValidator>
                            </td> </tr>
                            <tr>
                                <td>
                                    Mã bảo vệ: 
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" />
                                    <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="LOW" CaptchaLength="5"
                                        CaptchaHeight="60" CaptchaWidth="210" CaptchaLineNoise="High" CaptchaMinTimeout="5"
                                        CaptchaMaxTimeout="240" />
                                </td>
                               
                            </tr>
                       
                    </table>
                    <asp:Button ID="Button2" runat="server" BackColor="#C50202" OnClick="Button2_Click"
                        Text="Đăng Ký" BorderColor="#C50202" />
                    <asp:Button ID="Button3" runat="server" BackColor="#C50202" OnClick="Button3_Click"
                        Text="Hủy Bỏ" BorderColor="#C50202" />
                    <br />
                    <a class="link-dangnhap" href="DangNhap.aspx">Bạn đã có tài khoản?</a>
                    <asp:Label ID="lblLoi" runat="server"></asp:Label>
                     <asp:Label ID="Label1" runat="server" Style="color: #FF3300"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
