<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="DatCho.aspx.cs" Inherits="admin_DatCho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" Runat="Server">
 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
   
    <h2>
        Danh sách đặt chỗ hôm nay(
        <asp:Label ID="lblNgay" runat="server"></asp:Label>
        )</h2>
    <p style="text-align: center; font-size: medium;">
        _<asp:Label ID="lblSL" runat="server"></asp:Label>
&nbsp;Đặt chỗ_</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="mahoadon" DataSourceID="SqlDataSource1"
        CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <asp:BoundField DataField="mahoadon" HeaderText="Mã hóa đơn" InsertVisible="False"
                    ReadOnly="True" SortExpression="mahoadon" />
            <asp:BoundField DataField="ngaythang" HeaderText="Ngày đặt" SortExpression="ngaythang"
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="makh" HeaderText="Mã KH" SortExpression="makh" ReadOnly="true" Visible="false" />
            <asp:BoundField DataField="nguoidat" HeaderText="Khách Hàng" SortExpression="nguoidat" ReadOnly="true"  />
            <asp:BoundField DataField="sdt" HeaderText="Số ĐT" SortExpression="sdt" ReadOnly="true" />
            <asp:BoundField DataField="chuthich" HeaderText="Chú Thích" SortExpression="chuthich" />
            <asp:BoundField DataField="trangthai" HeaderText="Trạng Thái" SortExpression="trangthai" />
            <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
                </asp:TemplateField>
                <asp:HyperLinkField NavigateUrl="~/admin/BanAn.aspx" Text="Nhận chỗ" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Cập nhật"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Hủy" OnClientClick="return confirm('Bạn có chắc chắn muốn hủy đặt bàn không?')"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
                Không có bản ghi
            </EmptyDataTemplate>
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
    <asp:Timer ID="Timer1" runat="server" Interval="1000">
    </asp:Timer>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString40 %>"
        SelectCommand="SELECT mahoadon, [ngaythang], [makh], [sdt],[nguoidat], [chuthich], [trangthai]FROM [HOA_DON] WHERE ([trangthai] = N'Đặt bàn_Đang xử lý') and CONVERT(varchar, ngaythang, 103)=CONVERT(varchar, GETDATE(), 103)"
        DeleteCommand="DELETE FROM [HOA_DON] WHERE [mahoadon] = @mahoadon"
         UpdateCommand="UPDATE [HOA_DON] SET [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
     

        <DeleteParameters>
            <asp:Parameter Name="mahoadon" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="trangthai" />
            <asp:Parameter Name="chuthich" />
            <asp:Parameter Name="mahoadon" />
        </UpdateParameters>
    </asp:SqlDataSource>
     </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

