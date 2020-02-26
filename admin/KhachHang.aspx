<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="KhachHang.aspx.cs" Inherits="KhachHang" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <h2>
        Danh sách khách hàng</h2>
        <div class="header-main">
            <asp:Button ID="themkh" runat="server" Text="Thêm mới" PostBackUrl="~/admin/Them_KhachHang.aspx" OnClick="themsv_Click"/>
                <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" 
                            ToolTip="Nhập mã, họ tên hoặc sđt KH" ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" OnClick="btnsearch_Click" /></li>
                    <div class="clear-both"></div>
                </ul>
            <br />
            <br />
                <div class="clear-both">
                    <asp:GridView ID="grdDS" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" DataKeyNames="makh" DataSourceID="SqlDataSource1" 
                        Width="1093px" CellPadding="4" Font-Size="Medium" 
                        GridLines="None" onrowcommand="grdDS_RowCommand" 
                        onrowdeleting="grdDS_RowDeleting" onrowediting="grdDS_RowEditing" 
                        onrowupdating="grdDS_RowUpdating">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="makh" HeaderText="Mã khách hàng" ReadOnly="True" 
                                SortExpression="makh" InsertVisible="False" />
                            <asp:BoundField DataField="matkhau" HeaderText="Mật khẩu" 
                                SortExpression="matkhau" />
                            <asp:BoundField DataField="hoten" HeaderText="Họ tên" SortExpression="hoten" />
                            <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" 
                                SortExpression="gioitinh" />
                             <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" 
                                SortExpression="ngaysinh" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="sdt" HeaderText="Số điện thoại" 
                                SortExpression="sdt" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" 
                                SortExpression="diachi" />
                         
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
                            <asp:HyperLinkField DataNavigateUrlFields="makh" 
                                DataNavigateUrlFormatString="SuaKhachHang.aspx?makh={0}" Text="Sửa" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" />
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
                        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString33 %>" 
                        DeleteCommand="DELETE FROM [KHACH_HANG] WHERE [makh] = @makh" 
                        InsertCommand="INSERT INTO [KHACH_HANG] ([matkhau], [hoten], [gioitinh], [ngaysinh], [sdt], [email], [diachi]) VALUES (@matkhau, @hoten, @gioitinh, @ngaysinh, @sdt, @email, @diachi)" 
                        SelectCommand="SELECT * FROM [KHACH_HANG]" 
                        UpdateCommand="UPDATE [KHACH_HANG] SET [matkhau] = @matkhau, [hoten] = @hoten, [gioitinh] = @gioitinh, [ngaysinh] = @ngaysinh, [sdt] = @sdt, [email] = @email, [diachi] = @diachi WHERE [makh] = @makh">
                        <DeleteParameters>
                            <asp:Parameter Name="makh" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="matkhau" Type="String" />
                            <asp:Parameter Name="hoten" Type="String" />
                            <asp:Parameter Name="gioitinh" Type="String" />
                            <asp:Parameter DbType="Date" Name="ngaysinh" />
                            <asp:Parameter Name="sdt" Type="Int32" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="diachi" Type="String" />
                            
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="matkhau" Type="String" />
                            <asp:Parameter Name="hoten" Type="String" />
                            <asp:Parameter Name="gioitinh" Type="String" />
                            <asp:Parameter DbType="Date" Name="ngaysinh" />
                            <asp:Parameter Name="sdt" Type="Int32" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="diachi" Type="String" />
                            <asp:Parameter Name="makh" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
            </div>
        </div>

    <br />
    
    </ContentTemplate>
    </asp:UpdatePanel>

 </asp:Content>
