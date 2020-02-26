<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="DonHang.aspx.cs" Inherits="admin_DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" runat="Server">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
 
    <h2>
        Danh sách đơn hàng(
        <asp:Label ID="lblNgay" runat="server"></asp:Label>
        )
    </h2>
    <p style="text-align: center; font-size: medium;">
        &nbsp; Từ&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="txtngayBD" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đến&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtngayKT" runat="server"></asp:TextBox>&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="#F36A6A" 
            BorderColor="#FF3300" BorderStyle="Solid" ForeColor="White" Height="33px" 
            onclick="loc_Click" Text="Lọc Dữ Liệu" />
        </p> <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtngayKT"
                        ControlToValidate="txtngayBD" ErrorMessage="CompareValidator" ForeColor="Red"
                        Operator="LessThanEqual" Type="Date">Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu</asp:CompareValidator>
  
        <p style="text-align: center; font-size: medium;">
            _<asp:Label ID="lblSL" runat="server"></asp:Label>
            &nbsp;Đơn Ship_</p>
    <p style="text-align: center; font-size: medium;">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="604px" 
            AutoPostBack="True" RepeatDirection="Horizontal" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>Tất cả</asp:ListItem>
            <asp:ListItem>Ship_Đang xử lý</asp:ListItem>
            <asp:ListItem>Ship_Đang giao</asp:ListItem>
            <asp:ListItem>Ship_Hoàn thành</asp:ListItem>
            <asp:ListItem>Ship_Hủy</asp:ListItem>
        </asp:RadioButtonList>
      </p>
    <asp:GridView ID="grDs" runat="server" AutoGenerateColumns="False" DataKeyNames="mahoadon"
        DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="785px"
        CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="mahoadon" HeaderText="Mã hóa đơn" InsertVisible="False"
                ReadOnly="True" SortExpression="mahoadon" />
            <asp:BoundField DataField="ngaythang" HeaderText="Ngày đặt" SortExpression="ngaythang"
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="manv" HeaderText="Nhân Viên" SortExpression="manv" />
            <asp:BoundField DataField="nguoidat" HeaderText="Khách hàng" SortExpression="nguoidat"
                ReadOnly="True" />
            <asp:BoundField DataField="sdt" HeaderText="Số điện thoại" SortExpression="sdt" ReadOnly="True" />
            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" ReadOnly="True" />
            <asp:BoundField DataField="tongtien" HeaderText="Tổng tiền" SortExpression="tongtien"
                ReadOnly="True" />
            <asp:BoundField DataField="trangthai" HeaderText="Trạng thái" SortExpression="trangthai" />
            <asp:BoundField DataField="chuthich" HeaderText="Chú thích" SortExpression="chuthich" />
            <asp:BoundField DataField="hinhthucthanhtoan" HeaderText="Hình thức TT" SortExpression="hinhthucthanhtoan"
                ReadOnly="true" />
            <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="CTHoaDon.aspx?mahoadon={0}"
                NavigateUrl="~/admin/CTHoaDon.aspx" Text="Chi tiết" />
            <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="GuiEmail.aspx?mahoadon={0}"
                NavigateUrl="~/admin/GuiEmail.aspx" Text="Gửi Mail" />
            <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
           
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="mahoadon" DataNavigateUrlFormatString="SuaDonHang.aspx?mahoadon={0}"
                NavigateUrl="SuaDonHang.aspx" Text="Cập nhật" />
        </Columns>
        <EmptyDataTemplate>
            Không có bản ghi
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString42 %>"
        SelectCommand="SELECT * FROM [HOA_DON] WHERE ([trangthai] like N'Ship%') and CONVERT(varchar, ngaythang, 103)= CONVERT(varchar, GETDATE(), 103)"
        DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" UpdateCommand="UPDATE [HOA_DON] SET [trangthai] = @trangthai, [manv] = @manv,[chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer2" runat="server" Interval="600000">
    </asp:Timer>
    <br />
       
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
