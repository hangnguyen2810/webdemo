<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="../View/StyleSheetkhachang.css" rel="stylesheet" type="text/css" />
   <link rel="icon" href="../anhmonandacsac/icon.png" type="image/x-icon" />
   
    <title>[Quản trị]Nhà Hàng Nhật Hatoyama</title>
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
                    <table id="Table1" runat="server" class="dn">
                        <tr>
                            <td>
                                Mã Nhân Viên
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
                                Mật khẩu
                                <br />
                                <br />
                                <br />
                            </td>
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
                    <br />
                    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        
   </div>
    </form>
    <asp:SqlDataSource ID="sqlDsNhanvien" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString31 %>"
            SelectCommand="SELECT [manv], [quyen], [matkhau] FROM [NHAN_VIEN]"></asp:SqlDataSource>
</body>
</html>
