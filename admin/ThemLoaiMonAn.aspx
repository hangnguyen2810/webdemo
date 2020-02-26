<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ThemLoaiMonAn.aspx.cs" Inherits="ThemLoaiMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>Thêm loại món ăn</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="maloaimonan" 
        DataSourceID="SqlDataSource1" DefaultMode="Insert" oniteminserted="InsertedCmd" 
        Width="456px" Height="182px" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both">
        <EditItemTemplate>
            maloaimonan:
            <asp:Label ID="maloaimonanLabel1" runat="server" 
                Text='<%# Eval("maloaimonan") %>' />
            <br />
            tenloaimonan:
            <asp:TextBox ID="tenloaimonanTextBox" runat="server" 
                Text='<%# Bind("tenloaimonan") %>' />
            <br />
            mota:
            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" PostBackUrl="~/LoaiMonAn.aspx" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <InsertItemTemplate>
            Mã loại món ăn&nbsp;&nbsp;
            <asp:TextBox ID="maloaimonanTextBox" runat="server" 
                Text='<%# Bind("maloaimonan") %>' Width="200px" />
            <asp:RequiredFieldValidator ID="Maloai" ControlToValidate="maloaimonanTextBox" ErrorMessage="Mã loại bắt buộc phải nhập" ForeColor="Red" runat="server" />
            <br />
            <br />
            Tên loại món ăn&nbsp;
            <asp:TextBox ID="tenloaimonanTextBox" runat="server" 
                Text='<%# Bind("tenloaimonan") %>' Width="200px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tenloaimonanTextBox" ErrorMessage="Tên loại món ăn bắt buộc phải nhập" ForeColor="Red" runat="server" />
            <br />
            <br />
            Mô tả&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' 
                Width="200px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="motaTextBox" ErrorMessage="Mô tả bắt buộc phải nhập" ForeColor="Red" runat="server" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            maloaimonan:
            <asp:Label ID="maloaimonanLabel" runat="server" 
                Text='<%# Eval("maloaimonan") %>' />
            <br />
            tenloaimonan:
            <asp:Label ID="tenloaimonanLabel" runat="server" 
                Text='<%# Bind("tenloaimonan") %>' />
            <br />
            mota:
            <asp:Label ID="motaLabel" runat="server" Text='<%# Bind("mota") %>' />
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
    <a href="LoaiMonAn.aspx">Loại món ăn</a>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString20 %>" 
        DeleteCommand="DELETE FROM [LOAI_MON_AN] WHERE [maloaimonan] = @maloaimonan" 
        InsertCommand="INSERT INTO [LOAI_MON_AN] ([maloaimonan], [tenloaimonan], [mota]) VALUES (@maloaimonan, @tenloaimonan, @mota)" 
        SelectCommand="SELECT * FROM [LOAI_MON_AN]" 
        UpdateCommand="UPDATE [LOAI_MON_AN] SET [tenloaimonan] = @tenloaimonan, [mota] = @mota WHERE [maloaimonan] = @maloaimonan">
        <DeleteParameters>
            <asp:Parameter Name="maloaimonan" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="maloaimonan" Type="String" />
            <asp:Parameter Name="tenloaimonan" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenloaimonan" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
            <asp:Parameter Name="maloaimonan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:label id="errmg" runat="server" ForeColor="Red" />
</asp:Content>

