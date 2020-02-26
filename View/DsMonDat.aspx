<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageKhachHang.master" AutoEventWireup="true"
    CodeFile="DsMonDat.aspx.cs" Inherits="DsMonDat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner detail-content">
             <ul class="search float-right">
                    <li>Thấp hơn
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            Height="35px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                            Width="135px">
                            <asp:ListItem>100000</asp:ListItem>
                            <asp:ListItem>200000</asp:ListItem>
                            <asp:ListItem>500000</asp:ListItem>
                            <asp:ListItem>1000000</asp:ListItem>
                            <asp:ListItem>3000000</asp:ListItem>
                            <asp:ListItem>5000000</asp:ListItem>
                        </asp:DropDownList>&nbsp;VNĐ</li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" 
                            onclick="btnsearch_Click" Width="100px" /></li>
                    <div class="clear-both"></div>
                </ul>
                <div class="clear-fix"></div>
                <asp:DataList ID="DataMon" runat="server" DataSourceID="SqlDataSource1" Width="1013px"
                    DataKeyField="mamonan" OnItemCommand="DataList1_ItemCommand" RepeatColumns="3"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                    <table>
                        <tr>
                            <td><div class="hoverimage2">
                            <div class="img">
                                <asp:Image ID="anhLabel" runat="server" ImageUrl='<%# Eval("anh","~/anhmonan/{0}") %>'
                                    Width="230px" /></div>
                                <br /></div>
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
                               
                                <asp:Label ID="tenmonanLabel" runat="server" Text='<%# Eval("tenmonan") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td  style="text-align:center">
                                Giá:
                                <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
                                <asp:Label ID="gia2" runat="server" Text='VNĐ' />

                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td  style="text-align:center">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("mamonan", "~/View/CTMonAn.aspx?mamonan={0}") %>'
                                    BackColor="#F7F3EA">Chi tiết</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td  style="text-align:center">
                                <asp:Button ID="Datmon" CommandName="Đặt món" runat="server" Text="Đặt món" Width="230px" 
                                    BackColor="#C50202" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate> 
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString6 %>"
                    SelectCommand="SELECT [tenmonan], [gia], [anh], [mamonan] FROM [MON_AN]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
