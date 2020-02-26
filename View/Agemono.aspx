<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master" AutoEventWireup="true"
    CodeFile="Agemono.aspx.cs" Inherits="Agemono" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner detail-content">
                <h2 class="title-monan">
                Món Agemono
                </h2>
                <img src="../anhmonan/title-line.png" alt="Alternate Text" />
            <asp:DataList ID="DataMon1" runat="server" DataSourceID="SqlDataSource1" Width="1013px"
                DataKeyField="mamonan" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3"
                RepeatDirection="Horizontal">
         
              <ItemTemplate>
                    <table>
                        <tr>
                            <td><div class="hoverimage2">
                            <div class="img">
                                <asp:Image ID="anhLabel" runat="server" ImageUrl='<%# Eval("anh","~/anhmonan/{0}") %>'
                                    Width="230px" /></div></div>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="mamonanLabel" runat="server" Text='<%# Eval("mamonan") %>' Visible="False" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td height="36px" style="text-align:center">
                                Tên món ăn:
                                <asp:Label ID="tenmonanLabel" runat="server" Text='<%# Eval("tenmonan") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                Giá:
                                <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
                                <asp:Label ID="gia2" runat="server" Text='VNĐ' />

                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("mamonan", "~/View/CTMonAn.aspx?mamonan={0}") %>'
                                    BackColor="#F7F3EA">Chi tiết</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <asp:Button ID="Datmon" CommandName="Đặt món" runat="server" Text="Đặt món" Width="230px"
                                    BackColor="#C50202" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate> 
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString5 %>"
                SelectCommand="SELECT [mamonan], [tenmonan], [gia], [anh] FROM [MON_AN] where[maloaimonan]='A'"></asp:SqlDataSource>
        </div></div>
    </div>
</asp:Content>
