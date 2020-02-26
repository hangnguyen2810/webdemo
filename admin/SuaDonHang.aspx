<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SuaDonHang.aspx.cs" Inherits="admin_SuaDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" Runat="Server">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="mahoadon" 
        DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="384px" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" GridLines="Both" onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            Mã HĐ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="mahoadonLabel1" runat="server" Text='<%# Eval("mahoadon") %>' />
            <br />
            <br />
            Mã KH:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="makhTextBox" runat="server" Text='<%# Bind("makh") %>' 
                Height="24px" Enabled="false" Width="170px" />
            <br />
            <br />
            Mã NV:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="manvTextBox" runat="server" Text='<%# Bind("manv") %>' 
                Height="24px" Width="170px" />
            <br />
            <br />
            Ngày Đặt:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ngaythangTextBox" runat="server" 
                Text='<%# Bind("ngaythang") %>' Height="24px"  Enabled="false" 
                Width="170px"/>
            <br />
            <br />
            Số ĐT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' 
                Height="24px"  Enabled="false" Width="170px"/>
            <br />
            <br />
            Địa Chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' 
                Height="24px"  Enabled="false" Width="170px"/>
            <br />
            <br />
            Tổng Tiền:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tongtienTextBox" runat="server" 
                Text='<%# Bind("tongtien") %>' Height="24px" Enabled="false" 
                Width="170px" />
            <br />
            <br />
            Khách hàng:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="nguoidatTextBox" runat="server" 
                Text='<%# Bind("nguoidat") %>' Height="24px"  Enabled="false" 
                Width="170px" />
            <br />
            <br />
            Hình Thức TT:
            <asp:TextBox ID="hinhthucthanhtoanTextBox" runat="server" 
                Text='<%# Bind("hinhthucthanhtoan") %>' Height="24px"  Enabled="false" 
                Width="170px"/>
            <br />
            <br />
            Trạng Thái:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="170px" 
                SelectedValue='<%# Bind("trangthai") %>'>
                <asp:ListItem>Ship_Đang xử lý</asp:ListItem>
                <asp:ListItem>Ship_Đang giao</asp:ListItem>
                <asp:ListItem>Ship_Hoàn thành</asp:ListItem>
                <asp:ListItem>Ship_Hủy</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Chú Thích:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="chuthichTextBox" runat="server" Text='<%# Bind("chuthich") %>' 
                TextMode="MultiLine" Width="170px" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <InsertItemTemplate>
            makh:
            <asp:TextBox ID="makhTextBox" runat="server" Text='<%# Bind("makh") %>' />
            <br />
            manv:
            <asp:TextBox ID="manvTextBox" runat="server" Text='<%# Bind("manv") %>' />
            <br />
            ngaythang:
            <asp:TextBox ID="ngaythangTextBox" runat="server" 
                Text='<%# Bind("ngaythang") %>' />
            <br />
            sdt:
            <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            diachi:
            <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            tongtien:
            <asp:TextBox ID="tongtienTextBox" runat="server" 
                Text='<%# Bind("tongtien") %>' />
            <br />
            nguoidat:
            <asp:TextBox ID="nguoidatTextBox" runat="server" 
                Text='<%# Bind("nguoidat") %>' />
            <br />
            hinhthucthanhtoan:
            <asp:TextBox ID="hinhthucthanhtoanTextBox" runat="server" 
                Text='<%# Bind("hinhthucthanhtoan") %>' />
            <br />
            trangthai:
            <asp:TextBox ID="trangthaiTextBox" runat="server" 
                Text='<%# Bind("trangthai") %>' />
            <br />
            chuthich:
            <asp:TextBox ID="chuthichTextBox" runat="server" 
                Text='<%# Bind("chuthich") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
             Mã HĐ:
            <asp:Label ID="mahoadonLabel" runat="server" Text='<%# Eval("mahoadon") %>' />
            <br />
              Mã KH:
           
            <asp:Label ID="makhLabel" runat="server" Text='<%# Bind("makh") %>' />
            <br />
             Mã NV:
            <asp:Label ID="manvLabel" runat="server" Text='<%# Bind("manv") %>' />
            <br />
            Ngày:
           
            <asp:Label ID="ngaythangLabel" runat="server" Text='<%# Bind("ngaythang") %>' />
            <br />
            Số ĐT:
            <asp:Label ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />
            <br />
            Địa Chỉ:
            <asp:Label ID="diachiLabel" runat="server" Text='<%# Bind("diachi") %>' />
            <br />
            Tổng Tiền:
            <asp:Label ID="tongtienLabel" runat="server" Text='<%# Bind("tongtien") %>' />
            <br />
            Khách hàng:
            <asp:Label ID="nguoidatLabel" runat="server" Text='<%# Bind("nguoidat") %>' />
            <br />
            Hình thức Thanh toán:
            <asp:Label ID="hinhthucthanhtoanLabel" runat="server" 
                Text='<%# Bind("hinhthucthanhtoan") %>' />
            <br />
            Trạng Thái:
            <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Bind("trangthai") %>' />
            <br />
            Chú Thích:
            <asp:Label ID="chuthichLabel" runat="server" Text='<%# Bind("chuthich") %>' />
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltbao" runat="server" ForeColor="Black"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString41 %>" 
        SelectCommand="SELECT * FROM [HOA_DON] WHERE [mahoadon] = @mahoadon" 
        UpdateCommand="UPDATE [HOA_DON] SET [makh] = @makh, [manv] = @manv, [ngaythang] = @ngaythang, [sdt] = @sdt, [diachi] = @diachi, [tongtien] = @tongtien, [nguoidat] = @nguoidat, [hinhthucthanhtoan] = @hinhthucthanhtoan, [trangthai] = @trangthai, [chuthich] = @chuthich WHERE [mahoadon] = @mahoadon">
        <SelectParameters>
           <asp:QueryStringParameter Name="mahoadon" Type="Int32" QueryStringField="mahoadon" />
        </SelectParameters>
       
        <UpdateParameters>
            <asp:Parameter Name="makh" Type="Int32" />
            <asp:Parameter Name="manv" Type="Int32" />
            <asp:Parameter DbType="Date" Name="ngaythang" />
            <asp:Parameter Name="sdt" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="tongtien" Type="Double" />
            <asp:Parameter Name="nguoidat" Type="String" />
            <asp:Parameter Name="hinhthucthanhtoan" Type="String" />
            <asp:Parameter Name="trangthai" Type="String" />
            <asp:Parameter Name="chuthich" Type="String" />
            <asp:Parameter Name="mahoadon" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div><a href="DonHang.aspx">Quay lại</a></div>
</asp:Content>

