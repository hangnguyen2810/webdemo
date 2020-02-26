<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="Them_NhanVien.aspx.cs" Inherits="Them_NhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <h2>
        Thêm nhân viên</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="manv" DataSourceID="SqlDataSource2"
        DefaultMode="Insert" Width="776px" OnPageIndexChanging="FormView1_PageIndexChanging"
        Font-Size="Medium" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" 
        oniteminserted="InsertCmd">
        <EditItemTemplate>
            
            quyen:
            <asp:TextBox ID="tendnTextBox" runat="server" Text='<%# Bind("quyen") %>' />
            <br />
            matkhau:
            <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            tennv:
            <asp:TextBox ID="tennvTextBox" runat="server" Text='<%# Bind("tennv") %>' />
            <br />
            gioitinh:
            <asp:TextBox ID="gioitinhTextBox" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:TextBox ID="ngaysinhTextBox" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            diachi:
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            sdt:
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            chucvu:
            <asp:TextBox ID="chucvuTextBox" runat="server" Text='<%# Bind("chucvu") %>' />
            <br />
            mucluong:
            <asp:TextBox ID="mucluongTextBox" runat="server" Text='<%# Bind("mucluong") %>' />
            <br />
            anh:
            <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
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
        
            <asp:Table runat="server" Width="506px">
               <asp:TableRow>
                    <asp:TableCell>
                        Quyền
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="tendnTextBox" Width="200" runat="server" Text='<%# Bind("quyen") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tendnTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Mật khẩu
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="matkhauTextBox" Width="200" runat="server" Text='<%# Bind("matkhau") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="matkhauTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Tên nhân viên
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="TenNVTextBox" Width="200" runat="server" Text='<%# Bind("TenNV") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TenNVTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Giới tính
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="gioitinhTextBox" Width="200" runat="server" Text='<%# Bind("gioitinh") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="gioitinhTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Ngày sinh
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="ngaysinhTextBox" Width="200" runat="server" Text='<%# Bind("ngaysinh") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ngaysinhTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Địa chỉ
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="diachiTextBox" Width="200" runat="server" Text='<%# Bind("diachi") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="diachiTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Số điện thoại
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="sdtTextBox" Width="200" runat="server" Text='<%# Bind("sdt") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="sdtTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                         Chức vụ
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="chucvuTextBox" Width="200" runat="server" Text='<%# Bind("chucvu") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="chucvuTextBox" ErrorMessage="Phải nhập dữ liệu" ForeColor="Red" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                             Ảnh
                    </asp:TableCell><asp:TableCell>
                        <asp:FileUpload ID="anh" Width="300" runat="server" />
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                    </asp:TableCell><asp:TableCell>
                    
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel" />
                            
                    </asp:TableCell></asp:TableRow></asp:Table></InsertItemTemplate><ItemTemplate>
            
            tendn: <asp:Label ID="tendnLabel" runat="server" Text='<%# Bind("tendn") %>' />
            <br />
            matkhau: <asp:Label ID="matkhauLabel" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            tennv: <asp:Label ID="tennvLabel" runat="server" Text='<%# Bind("quyen") %>' />
            <br />
            gioitinh: <asp:Label ID="gioitinhLabel" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh: <asp:Label ID="ngaysinhLabel" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            diachi: <asp:Label ID="diachiLabel" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            sdt: <asp:Label ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            chucvu: <asp:Label ID="chucvuLabel" runat="server" Text='<%# Bind("chucvu") %>' />
            <br />
           anh: <asp:Label ID="anhLabel" runat="server" Text='<%# Bind("anh") %>' />
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
                                                                                  <asp:Label 
        ID="lbltbao" runat="server" ForeColor="Black"></asp:Label><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString37 %>"
        DeleteCommand="DELETE FROM [NHAN_VIEN] WHERE [manv] = @manv" 
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
    </asp:Content>