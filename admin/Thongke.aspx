<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="Thongke.aspx.cs" Inherits="admin_Thongke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 522px;
            height: 150px;
        }
        .style3
        {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
  
        <div class="content-inner detail-content">
            <h2 style="color: #FF6600">
                THỐNG KÊ ĐƠN HÀNG &amp; HÓA ĐƠN</h2>
       
                       <table>
                            <tr>
                                <td class="style2" style="border-style: double; border-width: thin; text-align: center">
                                    <asp:DropDownList ID="ddrLuachon" runat="server" Height="34px" Width="166px" OnSelectedIndexChanged="ddrLuachon_SelectedIndexChanged"
                                        AutoPostBack="True" OnLoad="ddrLuachon_Load">
                                        <asp:ListItem>Món Ăn</asp:ListItem>
                                        <asp:ListItem Value="Bàn Ăn">Số ĐT/Mã KH</asp:ListItem>
                                        <asp:ListItem>Tổng Tiền/HĐ</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnThongke" runat="server" BackColor="#FFF7E7" BorderColor="#FFCC66"
                                        BorderStyle="Solid" ForeColor="Black" Height="34px" OnClick="Button1_Click1"
                                        Text="Thống kê" Width="92px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                    &nbsp;&nbsp;&nbsp;
                                    <br />
                                    <asp:Panel ID="Panel2" runat="server">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mã món ăn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                        <asp:TextBox ID="txtmamon" runat="server" Width="161px" Height="30px"></asp:TextBox>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel3" runat="server">
                                        &nbsp;&nbsp;&nbsp;&nbsp; Số ĐT/Mã KH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtban" runat="server" Width="161px" Height="30px"></asp:TextBox>
                                        <br />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="Panel4" runat="server">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tổng Tiền/ HĐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;
                                        <asp:DropDownList ID="ddrtien" runat="server" Height="30px" Width="160px">
                                            <asp:ListItem>500000</asp:ListItem>
                                            <asp:ListItem>1000000</asp:ListItem>
                                            <asp:ListItem>2000000</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;VNĐ</asp:Panel>
                                    <br />
                                </td>
                            </tr>
                        </table>
               
                </div>
                     <asp:GridView ID="grDs1" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None"
                            Height="204px" Width="335px" 
            OnRowDataBound="grDs1_RowDataBound" DataSourceID="SqlDataSource1">
                            
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
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server">
        </asp:SqlDataSource>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="6000000">
        </asp:Timer>
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="Panel1" runat="server" BackColor="#A55129" Height="69px">
                            <table>
                                <tr>
                                    <td align="center" style="font-weight: 600" class="style3">
                                        Số Hóa Đơn&nbsp;&nbsp;
                                        <asp:TextBox ID="txtDoanhthu" runat="server" Width="47px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;HĐ</td>
                                    <td align="center" style="font-weight: 600" class="style3">
                                        Tổng Tiền&nbsp;
                                        <asp:TextBox ID="txtTongtien" runat="server" Width="111px"></asp:TextBox>
                                        &nbsp;VNĐ
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
              </div>
                </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
