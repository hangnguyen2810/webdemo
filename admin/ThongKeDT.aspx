<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThongKeDT.aspx.cs" Inherits="admin_ThongKeDT" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../View/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto&display=swap"
        rel="stylesheet" />
    <link rel="icon" href="../anhmonandacsac/icon.png" type="image/x-icon" />
    <title>[Quản trị]Nhà Hàng Nhật Bản Hatoyama</title>
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <header>
        <div class="container">
            <div class="header">
                <div class="logo">
                    <a href="#"><img src="../logo/logo.png" alt="Alternate Text" /></a>
                </div>
                <h1>Nhà hàng Nhật Hatoyama</h1>
                <div class="header-top-right float-right">
                        <ul class="login">
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                      
                          <li><a href="login.aspx">Đăng Xuất</a></li>
                         
                         </ul>
                    </div>
                <div class="clear-both"></div>
            </div>
            </div>
        </header>
        <section>
        <nav class="float-left">
        <div class="container">
            <ul class="menu text-center">
                <li><a href="NhanVien.aspx">Nhân viên</a></li>
                <li><a href="KhachHang.aspx">khách hàng</a></li>
                <li><a href="LoaiMonAn.aspx">Loại món ăn</a></li>
                <li><a href="MonAn.aspx">Món ăn</a></li>
                <li><a href="BanAn.aspx">Bàn ăn</a></li>
                <li><a href="hoadon.aspx">Hóa đơn</a></li>
                <li><a href="../admin/BaoCaoTK.aspx">Báo Cáo</a> </li>
                <li><a href="QLLienHe.aspx">Liên hệ</a></li>
            </ul>
            </div>
        </nav>
         <div class="main_tk">
       <div class="container">
            <div class="content-main">
        
                <asp:Panel ID="Panel1" runat="server">
                <table>
                <tr><td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLoaihinh" runat="server" BackColor="#F36A6A" 
                        BorderColor="#FF3300" BorderStyle="Solid" ForeColor="White" Height="34px" 
                        onclick="btnLoaihinh_Click" Text="Thống kê theo loại hình" Width="171px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSoluot" runat="server" BackColor="#F36A6A" 
                        BorderColor="#FF3300" BorderStyle="Solid" ForeColor="White" Height="34px" 
                        onclick="btnSoluot_Click" Text="Thống kê theo món" Width="144px" />
                    </td>
                    <td>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
                    
                    
                    </tr>
                </table>
                
                </asp:Panel>
    
                <br />
                <table><tr><td>
                    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Height="464px" 
                    Width="538px"></rsweb:ReportViewer></td>
                    <td> 
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="462px" 
                            Width="565px"></rsweb:ReportViewer>
  </td>
                    </tr></table>
                
                    <br />
     </div>
    <div class="clear-both"></div>
        </section>
        <footer class="text-center">
        <div class="container">
           
            <marquee width="100%" behavior="alternate">  
Nhà hàng Nhật Hatoyama
</marquee>
            </div>
        </footer>
    </div>
     
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    </form>
</body>
</html>
