<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="Them_KhachHang.aspx.cs" Inherits="Them_KhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <h2>
        Thêm khách hàng</h2>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="makh" DataSourceID="SqlDataSource2"
        DefaultMode="Insert" Width="667px" Font-Size="Medium" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        GridLines="Both" >
         <EditItemTemplate>
            makh:
            <asp:Label ID="MaKHLabel1" runat="server" Text='<%# Eval("MaKH") %>' />
            <br />
            matkhau:
            <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            hoten:
            <asp:TextBox ID="hotenTextBox" runat="server" Text='<%# Bind("hoten") %>' />
            <br />
            gioitinh:
            <asp:TextBox ID="gioitinhTextBox" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:TextBox ID="ngaysinhTextBox" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            sdt:
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            diachi:
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
         <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
         <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <InsertItemTemplate>
            <asp:Table runat="server" class="table-khachang" Width="502px">
                <asp:TableRow>
                    <asp:TableCell>
                         Mật khẩu
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' />
                         <asp:RequiredFieldValidator ID="Matkhau" ControlToValidate="matkhauTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
          
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Tên khách hàng
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="hotenTextBox" runat="server" Text='<%# Bind("hoten") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="hotenTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Giới tính
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="gioitinhTextBox" runat="server" Text='<%# Bind("gioitinh") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="gioitinhTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Ngày sinh
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="ngaysinhTextBox" runat="server" Text='<%# Bind("ngaysinh") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ngaysinhTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Số điện thoại
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="sdtTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        Email
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="emailTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Địa chỉ
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="diachiTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                          
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        
                    </asp:TableCell><asp:TableCell>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel" />
                    </asp:TableCell></asp:TableRow></asp:Table></InsertItemTemplate><ItemTemplate>
            makh: <asp:Label ID="MaKHLabel" runat="server" Text='<%# Eval("MaKH") %>' />
            <br />
            matkhau: <asp:Label ID="matkhauLabel" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            hoten: <asp:Label ID="hotenLabel" runat="server" Text='<%# Bind("hoten") %>' />
            <br />
            gioitinh: <asp:Label ID="gioitinhLabel" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh: <asp:Label ID="ngaysinhLabel" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            sdt: <asp:Label ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            email: <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
            <br />
            diachi: <asp:Label ID="diachiLabel" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
             HorizontalAlign="Center" /><RowStyle BackColor="White" 
             ForeColor="#330099" /></asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString18 %>"
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
    </asp:Content>
