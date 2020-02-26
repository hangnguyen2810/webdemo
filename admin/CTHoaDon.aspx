<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="CTHoaDon.aspx.cs" Inherits="CTHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="machitiet" DataSourceID="SqlDataSource1" CellPadding="4"  GridLines="None" Width="390px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="machitiet" HeaderText="Mã Chi Tiết" 
                InsertVisible="False" ReadOnly="True" SortExpression="machitiet" />
            <asp:BoundField DataField="mahoadon" HeaderText="Mã Hóa Đơn" 
                SortExpression="mahoadon" />
            <asp:BoundField DataField="maban" HeaderText="Bàn" 
                SortExpression="maban" />
            <asp:BoundField DataField="mamonan" HeaderText="Mã Món Ăn" 
                SortExpression="mamonan" />
            <asp:BoundField DataField="soluong" HeaderText="Số Lượng" 
                SortExpression="soluong" />
        </Columns>
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
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString24 %>" 
        
    SelectCommand="SELECT * FROM [CT_HOA_DON] WHERE ([mahoadon] = @mahoadon)">
        <SelectParameters>
            <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

