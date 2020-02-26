<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

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
                        Đăng Nhập
                    </h2>
                    <table runat="server" class="dn">
                        <tr>
                            <td>
                                Email
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtTenDN" runat="server" Width="216px"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="reqTenDN" runat="server" ControlToValidate="txtTenDN"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào tên đăng nhập</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                Mật khẩu<br />
                                <br />
&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtMK" runat="server" TextMode="Password" Width="214px"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error" ID="reqMK" runat="server" ControlToValidate="txtMK"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red">Cần nhập vào mật khẩu</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnDN" runat="server" OnClick="btnDN_Click" Text="Đăng nhập" 
                        BackColor="#C50202" BorderColor="#C50202" />
                    <br />
                    <a style="text-align:center" href="Dangky.aspx">Đăng ký</a>
                    <br />
                    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="sqlDsNguoiDung" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString11 %>"
            SelectCommand="SELECT [email], [matkhau] FROM [KHACH_HANG]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
