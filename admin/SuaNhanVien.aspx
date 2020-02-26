<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SuaNhanVien.aspx.cs" Inherits="admin_SuaNhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" Runat="Server">
 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="manv" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        GridLines="Both" Width="386px" onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            Mã NV:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="manvLabel1" runat="server" Text='<%# Eval("manv") %>' />
            <br />
            <br />
            Mật Khẩu:&nbsp;
            <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            <br />
            Tên NV:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tennvTextBox" runat="server" Text='<%# Bind("tennv") %>' />
            <br />
            <br />
            Giới Tính:&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" 
                SelectedValue='<%# Bind("gioitinh") %>' Width="123px">
                <asp:ListItem>Nam</asp:ListItem>
                <asp:ListItem>Nữ</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Ngày Sinh:
            <asp:TextBox ID="ngaysinhTextBox" runat="server" 
                Text='<%# Bind("ngaysinh") %>' />
            <br />
            <br />
            Địa Chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            <br />
            Số ĐT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            <br />
            Chức Vụ:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="chucvuTextBox" runat="server" Text='<%# Bind("chucvu") %>' />
            <br />
            <br />
            Ảnh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
            <br />
            <br />
            Quyền:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="quyenTextBox" runat="server" Text='<%# Bind("quyen") %>' />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <InsertItemTemplate>
            matkhau:
            <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            tennv:
            <asp:TextBox ID="tennvTextBox" runat="server" Text='<%# Bind("tennv") %>' />
            <br />
            gioitinh:
            <asp:TextBox ID="gioitinhTextBox" runat="server" 
                Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:TextBox ID="ngaysinhTextBox" runat="server" 
                Text='<%# Bind("ngaysinh") %>' />
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
            anh:
            <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
            <br />
            quyen:
            <asp:TextBox ID="quyenTextBox" runat="server" Text='<%# Bind("quyen") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            manv:
            <asp:Label ID="manvLabel" runat="server" Text='<%# Eval("manv") %>' />
            <br />
            matkhau:
            <asp:Label ID="matkhauLabel" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            tennv:
            <asp:Label ID="tennvLabel" runat="server" Text='<%# Bind("tennv") %>' />
            <br />
            gioitinh:
            <asp:Label ID="gioitinhLabel" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:Label ID="ngaysinhLabel" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            diachi:
            <asp:Label ID="diachiLabel" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            sdt:
            <asp:Label ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            chucvu:
            <asp:Label ID="chucvuLabel" runat="server" Text='<%# Bind("chucvu") %>' />
            <br />
            anh:
            <asp:Label ID="anhLabel" runat="server" Text='<%# Bind("anh") %>' />
            <br />
            quyen:
            <asp:Label ID="quyenLabel" runat="server" Text='<%# Bind("quyen") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltbao" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString44 %>" 
        SelectCommand="SELECT * FROM [NHAN_VIEN] WHERE [manv] = @manv" 
        UpdateCommand="UPDATE [NHAN_VIEN] SET [matkhau] = @matkhau, [tennv] = @tennv, [gioitinh] = @gioitinh, [ngaysinh] = @ngaysinh, [diachi] = @diachi, [sdt] = @sdt, [chucvu] = @chucvu, [anh] = @anh, [quyen] = @quyen WHERE [manv] = @manv">
          <SelectParameters>
           <asp:QueryStringParameter Name="manv" Type="Int32" QueryStringField="manv" />
        </SelectParameters>
       
        <UpdateParameters>
            <asp:Parameter Name="matkhau" Type="String" />
            <asp:Parameter Name="tennv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="String" />
            <asp:Parameter DbType="Date" Name="ngaysinh" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="sdt" Type="Int32" />
            <asp:Parameter Name="chucvu" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="quyen" Type="Int32" />
            <asp:Parameter Name="manv" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

