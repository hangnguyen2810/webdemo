<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaoCaoTK.aspx.cs" Inherits="admin_BaoCaoTK" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../View/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto&display=swap"
        rel="stylesheet" />
    <link rel="icon" href="../anhmonandacsac/icon.png" type="image/x-icon" />
    <title>[Quản trị]Nhà Hàng Nhật Hatoyama</title>
    <style type="text/css">
        .style1
        {
            width: 271px;
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
                <h1>Nhà hàng Nhật Bản Hatoyama</h1>
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
         
    <table>
    <tr>
    <td>
        <br />
       
        <asp:Button ID="ThemMonAn" runat="server" Text="Thống Kê Bảng" 
            PostBackUrl="~/admin/ThongKe.aspx" BackColor="#F36A6A" BorderColor="#FF3300" 
            BorderStyle="Solid" ForeColor="White" Height="32px" Width="130px"  />
        <br />
        <br />
       
        <asp:Button ID="tkbd" runat="server" Text="Thống Kê Tháng" 
            PostBackUrl="~/admin/ThongKeDT.aspx" BackColor="#F36A6A" BorderColor="#FF3300" 
            BorderStyle="Solid" ForeColor="White" Height="32px" Width="130px" />
            <br /><br />
            <asp:Button ID="tktuan" runat="server" Text="Thống Kê Ngày/Tuần" 
            PostBackUrl="~/admin/TKngay_thang.aspx" BackColor="#F36A6A" BorderColor="#FF3300" 
            BorderStyle="Solid" ForeColor="White" Height="32px" Width="130px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Từ&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="txtngayBD" runat="server" style="-moz-border-radius: 6px;-webkit-border-radius: 6px;"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đến&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtngayKT" runat="server" style="-moz-border-radius: 6px;-webkit-border-radius: 6px;"></asp:TextBox>
    <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Tạo Báo Cáo" onclick="Button1_Click" 
            BackColor="#F36A6A" BorderColor="#FF3300" BorderStyle="Solid" 
            ForeColor="White" Height="33px" />
        <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtngayKT"
                        ControlToValidate="txtngayBD" ErrorMessage="CompareValidator" ForeColor="Red"
                        Operator="LessThanEqual" Type="Date">Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu</asp:CompareValidator>
       &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
       <br />
 
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="404px" 
            Width="600px" SizeToReportContent="True" ZoomPercent="85">
            <localreport reportpath="admin\ReportBCTK.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </localreport>
        </rsweb:ReportViewer></td>
    <td class="style1"> <h3>TOP 3 MÓN ĂN ĐƯỢC ƯA THÍCH NHẤT</h3>
        <asp:GridView ID="Grtop" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="154px" Width="269px">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView></td>
    </tr>
    
    </table>
        </div>
        </div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" 
            TypeName="DataSet2TableAdapters.usp_cthoadonTableAdapter">
        </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
    </form>
</body>
</html>
