<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterpageDangNhap.master" AutoEventWireup="true" CodeFile="LichSuCT.aspx.cs" Inherits="LichSuCT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
     <div class="content-main">
       
        <div class="container">
          <div class="content-inner detail-content">
            
                <div class="clear-fix"></div>
                 <h2 style="color: #FF6600">
        Danh sách món ăn đã mua</h2>
          
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
    <asp:GridView ID="GrCTHD" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Width="396px" AllowPaging="True" Height="286px" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="tenmonan" HeaderText="Món Ăn" 
                SortExpression="tenmonan" />
            <asp:BoundField DataField="soluong" HeaderText="Số Lượng" 
                SortExpression="soluong" />
                 <asp:BoundField DataField="gia" HeaderText="Đơn Giá" 
                SortExpression="gia" />
                <asp:BoundField DataField="Thành tiền" HeaderText="Thành tiền" 
                SortExpression="tt" />
        </Columns>
         <EmptyDataTemplate>
                        Không có món ăn
                    </EmptyDataTemplate>
         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66"  HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6"  />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString35 %>" 
        
                    SelectCommand="select tenmonan, soluong,gia,soluong*gia as'Thành tiền' from CT_HOA_DON inner join MON_AN on MON_AN.mamonan=CT_HOA_DON.mamonan where [mahoadon] = @mahoadon">
        <SelectParameters>
            <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" 
                Type="Int32" />
        </SelectParameters>
  </asp:SqlDataSource>
       </div>
        </div>
    </div>
</asp:Content>

