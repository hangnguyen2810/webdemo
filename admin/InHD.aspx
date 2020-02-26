<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InHD.aspx.cs" Inherits="admin_InHD" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../View/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto&display=swap"
        rel="stylesheet" />
    <link rel="icon" href="../anhmonandacsac/icon.png" type="image/x-icon" />
    <title>[Quản trị]Nhà Hàng Nhật Hatoyama</title>
    <style type="text/css">
        .style2
        {
            width: 109px;
            height: 34px;
        }
        .style3
        {
            height: 34px;
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
                    <a href="#">
                    <img alt="Alternate Text" 
                        src="http://localhost:49993/BaiTapLon/logo/logo.png" /></a>
                </div>
                <h1>
                    Nhà hàng Nhật Bản Hatoyama</h1>
                <div class="header-top-right float-right">
                    <ul class="login">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <li><a href="http://localhost:49993/BaiTapLon/admin/login.aspx">Đăng Xuất</a></li>
                    </ul>
                </div>
                <div class="clear-both">
                </div>
            </div>
        </div>
        </header>
        <section>
        <nav class="float-left">
        <div class="container">
            <ul class="menu text-center">
                <li><a href="http://localhost:49993/BaiTapLon/admin/NhanVien.aspx">Nhân viên</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/KhachHang.aspx">khách hàng</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/LoaiMonAn.aspx">Loại món ăn</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/MonAn.aspx">Món ăn</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/BanAn.aspx">Bàn ăn</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/hoadon.aspx">Hóa đơn</a></li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/BaoCaoTK.aspx">Báo Cáo</a>
                </li>
                <li><a href="http://localhost:49993/BaiTapLon/admin/QLLienHe.aspx">Liên hệ</a></li>
            </ul>
        </div>
        </nav>
         <div class="main_tk">
             <div class="container">
                 <div class="content-main">
                     <div>
                         <asp:Panel ID="Panel1" runat="server">
                             <table>
                                 <tr>
                                     <td>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                     <td class="style1" style="text-align: center">
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                             BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Double" 
                                             BorderWidth="2px" CellPadding="3" CellSpacing="2" DataKeyNames="mahoadon" 
                                             DataSourceID="SqlDataSource1" Height="50px" HorizontalAlign="Center" 
                                             Width="398px">
                                             <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                             <Fields>
                                                 <asp:BoundField DataField="mahoadon" HeaderText="Mã HĐ" InsertVisible="False" 
                                                     ReadOnly="True" SortExpression="mahoadon" />
                                                 <asp:BoundField DataField="nguoidat" HeaderText="Họ Tên" 
                                                     SortExpression="nguoidat" />
                                                 <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
                                             </Fields>
                                             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                         </asp:DetailsView>
                                     </td>
                                     <td class="style1" style="text-align: center">
                    <br />
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" BackColor="#F36A6A" 
                                             BorderColor="#FF3300" ForeColor="White" Height="33px" onclick="Button1_Click" 
                                             Text="Xuất Hóa Đơn" />
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     </td>
                                 </tr>
                             </table>
        
          
            <br />
            
            <br />
          
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString45 %>" 
                                 SelectCommand="SELECT [mahoadon], [nguoidat], [sdt] FROM [HOA_DON] where mahoadon=@mahoadon">
                                 <SelectParameters>
                                     <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" 
                                         Type="Int32" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
            <br />
            
                         </asp:Panel>
                         <br />
                         <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                             Font-Size="8pt" Height="567px" InteractiveDeviceInfos="(Collection)" 
                             SizeToReportContent="True" WaitMessageFont-Names="Verdana" 
                             WaitMessageFont-Size="14pt" Width="935px">
                             <LocalReport ReportPath="admin\ReportCTHD.rdlc">
                                 <DataSources>
                                     <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                                 </DataSources>
                             </LocalReport>
                         </rsweb:ReportViewer>
                     </div>
                 </div>
             </div>
             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                 TypeName="DataSet2.Datatable1"></asp:ObjectDataSource>
             <asp:ScriptManager ID="ScriptManager1" runat="server">
             </asp:ScriptManager>
        </div>
        <div class="clear-both">
        </div>
        </section>
        <footer class="text-center">
        <div class="container">
            <marquee behavior="alternate" width="100%">Nhà hàng Nhật Hatoyama</marquee>
        </div>
        </footer>
    </div>
    </form>
</body>
</html>
