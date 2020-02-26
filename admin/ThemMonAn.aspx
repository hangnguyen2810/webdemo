<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ThemMonAn.aspx.cs" Inherits="ThemMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>
    Thêm món ăn
</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="mamonan" 
        DataSourceID="SqlDataSource1" DefaultMode="Insert" width="705px"
        oniteminserting="ItemInserting" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both">
        <EditItemTemplate>
            mamonan:
            <asp:Label ID="mamonanLabel1" runat="server" Text='<%# Eval("mamonan") %>' />
            <br />
            tenmonan:
            <asp:TextBox ID="tenmonanTextBox" runat="server" 
                Text='<%# Bind("tenmonan") %>' />
            <br />
            gia:
            <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("gia") %>' />
            <br />
            maloaimonan:
            <asp:TextBox ID="maloaimonanTextBox" runat="server" 
                Text='<%# Bind("maloaimonan") %>' />
            <br />
            anh:
            <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
            <br />
            mota:
            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' />
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
      
            Mã món ăn:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mamonanTextBox" runat="server" Text='<%# Bind("mamonan") %>' 
                Width="200px" />
            <asp:RequiredFieldValidator ID="ma" ControlToValidate="mamonanTextBox" ErrorMessage="Mã món ăn không được để trống" ForeColor="Red" runat="server" />
            <br />
            <br />
           
            Tên món ăn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tenmonanTextBox" runat="server" 
                Text='<%# Bind("tenmonan") %>' Width="200px" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tenmonanTextBox" ErrorMessage="Tên món ăn không được để trống" ForeColor="Red" runat="server" /> 
            <br />
            <br />
           
            Giá:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("gia") %>' 
                Width="200px" />
           <asp:RangeValidator ID="gia" ControlToValidate="giaTextBox" Type="Integer" MaximumValue="1000000" MinimumValue="50000" ErrorMessage="Giá > 50000" ForeColor="Red" runat="server" />
            <br />
            <br />
            
            Mã loại món ăn: <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource12" DataTextField="tenloaimonan" 
                DataValueField="maloaimonan" SelectedValue='<%# Bind("tenmonan") %>' 
                Width="200px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="maloai" ControlToValidate="DropDownList1" ErrorMessage="Mã loại món ăn bắt buộc phải chọn" ForeColor="Red" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString38 %>" 
                SelectCommand="SELECT * FROM [LOAI_MON_AN]"></asp:SqlDataSource>
            <br />
            <br />
            
           
            Ảnh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload2" runat="server" Width="200px" />
            <br />
            <br />
           
            
            Mô tả:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' 
                Width="200px" />
           <br />
            <br />
       
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Mã món ăn:
            <asp:Label ID="mamonanLabel" runat="server" Text='<%# Eval("mamonan") %>' />
            <br />
            Tên món ăn:
            <asp:Label ID="tenmonanLabel" runat="server" Text='<%# Bind("tenmonan") %>' />
            <br />
            Giá:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="giaLabel" runat="server" Text='<%# Bind("gia") %>' />
            <br />
            Mã loại món ăn:
            <asp:Label ID="maloaimonanLabel" runat="server" 
                Text='<%# Bind("maloaimonan") %>' />
            <br />
            Ảnh:
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            Mô tả:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="motaLabel" runat="server" Text='<%# Bind("mota") %>' />
            <br />
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
    <a href="MonAN.aspx" style="font-family: Arial, Helvetica, sans-serif">Món ăn</a>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString21 %>" 
        DeleteCommand="DELETE FROM [MON_AN] WHERE [mamonan] = @original_mamonan AND (([tenmonan] = @original_tenmonan) OR ([tenmonan] IS NULL AND @original_tenmonan IS NULL)) AND (([gia] = @original_gia) OR ([gia] IS NULL AND @original_gia IS NULL)) AND (([maloaimonan] = @original_maloaimonan) OR ([maloaimonan] IS NULL AND @original_maloaimonan IS NULL)) AND (([anh] = @original_anh) OR ([anh] IS NULL AND @original_anh IS NULL)) AND (([mota] = @original_mota) OR ([mota] IS NULL AND @original_mota IS NULL))" 
        InsertCommand="INSERT INTO [MON_AN] ([mamonan], [tenmonan], [gia], [maloaimonan], [anh], [mota]) VALUES (@mamonan, @tenmonan, @gia, @maloaimonan, @anh, @mota)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [MON_AN]" 
        UpdateCommand="UPDATE [MON_AN] SET [tenmonan] = @tenmonan, [gia] = @gia, [maloaimonan] = @maloaimonan, [anh] = @anh, [mota] = @mota WHERE [mamonan] = @original_mamonan AND (([tenmonan] = @original_tenmonan) OR ([tenmonan] IS NULL AND @original_tenmonan IS NULL)) AND (([gia] = @original_gia) OR ([gia] IS NULL AND @original_gia IS NULL)) AND (([maloaimonan] = @original_maloaimonan) OR ([maloaimonan] IS NULL AND @original_maloaimonan IS NULL)) AND (([anh] = @original_anh) OR ([anh] IS NULL AND @original_anh IS NULL)) AND (([mota] = @original_mota) OR ([mota] IS NULL AND @original_mota IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_mamonan" Type="String" />
            <asp:Parameter Name="original_tenmonan" Type="String" />
            <asp:Parameter Name="original_gia" Type="Double" />
            <asp:Parameter Name="original_maloaimonan" Type="String" />
            <asp:Parameter Name="original_anh" Type="String" />
            <asp:Parameter Name="original_mota" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="mamonan" Type="String" />
            <asp:Parameter Name="tenmonan" Type="String" />
            <asp:Parameter Name="gia" Type="Double" />
            <asp:Parameter Name="maloaimonan" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenmonan" Type="String" />
            <asp:Parameter Name="gia" Type="Double" />
            <asp:Parameter Name="maloaimonan" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
            <asp:Parameter Name="original_mamonan" Type="String" />
            <asp:Parameter Name="original_tenmonan" Type="String" />
            <asp:Parameter Name="original_gia" Type="Double" />
            <asp:Parameter Name="original_maloaimonan" Type="String" />
            <asp:Parameter Name="original_anh" Type="String" />
            <asp:Parameter Name="original_mota" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

