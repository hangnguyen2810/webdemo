<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="NhanVien.aspx.cs" Inherits="NhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
    <h2>
        Danh sách nhân viên</h2>
    <div class="header-main">
        <asp:Button ID="themsv" runat="server" Text="Thêm mới" 
            PostBackUrl="~/admin/Them_NhanVien.aspx" onclick="themsv_Click" />
        <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" ToolTip="Nhập mã, tên hoặc chức vụ" ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" OnClick="btnsearch_Click" /></li>
                    <div class="clear-both"></div>
                </ul>
        <div class="clear-both">
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="manv" 
        DataSourceID="SqlDataSource1" Width="1000px" CellPadding="4" 
    GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="manv" HeaderText="Mã nhân viên" ReadOnly="True" 
                SortExpression="manv" InsertVisible="False" />
            <asp:BoundField  DataField="tennv" HeaderText="Tên nhân viên" SortExpression="tennv" />
            <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" 
                SortExpression="gioitinh" />
            <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" 
                SortExpression="ngaysinh"  DataFormatString="{0:dd/MM/yyyy}"  />
            <asp:BoundField DataField="diachi" HeaderText="Địa Chỉ" 
                SortExpression="diachi" />
            <asp:BoundField DataField="sdt" HeaderText="SĐT" SortExpression="sdt" />
             <asp:BoundField DataField="chucvu" HeaderText="Chức vụ" 
                SortExpression="chucvu" />
           <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh">
                <EditItemTemplate>
                    <asp:FileUpload ID="fileloadhinhanh1" runat="server" /><br />
                    <asp:TextBox ID="hinhanh" runat="server" Text='<%# Bind("anh") %>' TextMode="MultiLine" Style="Width: 0px; height:0px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="anh" runat="server" ImageUrl='<%# Eval("anh","~/Anh/{0}") %>' Width="200px" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="quyen" HeaderText="Quyền" SortExpression="quyen" />
            <asp:BoundField DataField="matkhau" HeaderText="Mật khẩu" 
                SortExpression="matkhau" />
            <asp:TemplateField HeaderText="Chức năng" ShowHeader="False">
                <ItemTemplate>
                   &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Xóa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa không?')"></asp:LinkButton>
                                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="manv" 
                DataNavigateUrlFormatString="SuaNhanVien.aspx?manv={0}" 
                NavigateUrl="SuaNhanVien.aspx" Text="Sửa" />
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="600000">
    </asp:Timer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString16 %>" 
        DeleteCommand="DELETE FROM [NHAN_VIEN] WHERE [manv] = @manv and quyen !=1" 
        InsertCommand="INSERT INTO [NHAN_VIEN] ([tennv], [gioitinh], [ngaysinh], [diachi], [sdt], [chucvu], [anh], [quyen], [matkhau]) VALUES (@tennv, @gioitinh, @ngaysinh, @diachi, @sdt, @chucvu, @anh, @quyen, @matkhau)" 
        SelectCommand="SELECT [manv], [tennv], [gioitinh], [ngaysinh], [diachi], [sdt], [chucvu], [anh], [quyen], [matkhau] FROM [NHAN_VIEN]" 
        UpdateCommand="UPDATE [NHAN_VIEN] SET [tennv] = @tennv, [gioitinh] = @gioitinh, [ngaysinh] = @ngaysinh, [diachi] = @diachi, [sdt] = @sdt, [chucvu] = @chucvu, [anh] = @anh, [quyen] = @quyen, [matkhau] = @matkhau WHERE [manv] = @manv">
        <DeleteParameters>
            <asp:Parameter Name="manv" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tennv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="String" />
            <asp:Parameter Name="ngaysinh" DbType="Date" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="sdt" Type="Int32" />
            <asp:Parameter Name="chucvu" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="quyen" Type="Int32" />
            <asp:Parameter Name="matkhau" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tennv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="String" />
            <asp:Parameter Name="ngaysinh" DbType="Date" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="sdt" Type="Int32" />
            <asp:Parameter Name="chucvu" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="quyen" Type="Int32" />
            <asp:Parameter Name="matkhau" Type="String" />
            <asp:Parameter Name="manv" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

