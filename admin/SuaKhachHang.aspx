<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SuaKhachHang.aspx.cs" Inherits="admin_SuaKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" Runat="Server">
 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="makh" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        GridLines="Both" Height="307px" Width="398px" 
        onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            Mã Khách Hàng:
            <asp:Label ID="makhLabel1" runat="server" Text='<%# Eval("makh") %>' />
            <br />
            <br />
            Mật Khẩu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="matkhauTextBox" runat="server" Text='<%# Bind("matkhau") %>' 
                Enabled="False" />
            <br />
            <br />
            Họ Tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="hotenTextBox" runat="server" Text='<%# Bind("hoten") %>' />
            <br />
            <br />
            Giới Tính:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="gioitinhTextBox" runat="server" 
                Text='<%# Bind("gioitinh") %>' />
            <br />
            <br />
            Ngày Sinh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ngaysinhTextBox" runat="server" 
                Text='<%# Bind("ngaysinh") %>' />
            <br />
            <br />
            Số ĐT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            <br />
            Địa Chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
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
            hoten:
            <asp:TextBox ID="hotenTextBox" runat="server" Text='<%# Bind("hoten") %>' />
            <br />
            gioitinh:
            <asp:TextBox ID="gioitinhTextBox" runat="server" 
                Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:TextBox ID="ngaysinhTextBox" runat="server" 
                Text='<%# Bind("ngaysinh") %>' />
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            makh:
            <asp:Label ID="makhLabel" runat="server" Text='<%# Eval("makh") %>' />
            <br />
            matkhau:
            <asp:Label ID="matkhauLabel" runat="server" Text='<%# Bind("matkhau") %>' />
            <br />
            hoten:
            <asp:Label ID="hotenLabel" runat="server" Text='<%# Bind("hoten") %>' />
            <br />
            gioitinh:
            <asp:Label ID="gioitinhLabel" runat="server" Text='<%# Bind("gioitinh") %>' />
            <br />
            ngaysinh:
            <asp:Label ID="ngaysinhLabel" runat="server" Text='<%# Bind("ngaysinh") %>' />
            <br />
            sdt:
            <asp:Label ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
            <br />
            diachi:
            <asp:Label ID="diachiLabel" runat="server" Text='<%# Bind("diachi") %>' />
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblloi" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString43 %>" 
        SelectCommand="SELECT * FROM [KHACH_HANG] where [makh] = @makh" 
        UpdateCommand="UPDATE [KHACH_HANG] SET [matkhau] = @matkhau, [hoten] = @hoten, [gioitinh] = @gioitinh, [ngaysinh] = @ngaysinh, [sdt] = @sdt, [email] = @email, [diachi] = @diachi WHERE [makh] = @makh">
        
         <SelectParameters>
           <asp:QueryStringParameter Name="makh" Type="Int32" QueryStringField="makh" />
        </SelectParameters>
       
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

