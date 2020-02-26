<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SuaMonAn.aspx.cs" Inherits="SuaMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
<h2>
    Sửa món ăn
</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="mamonan" 
        DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="286px" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" GridLines="Both">
        <EditItemTemplate>
            Mã món ăn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="mamonanLabel1" runat="server" Text='<%# Eval("mamonan") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Mã món ăn không được để trống" ForeColor="Red" runat="server" />
            <br />
            <br />
            Tên món ăn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tenmonanTextBox" runat="server" 
                Text='<%# Bind("tenmonan") %>' />
            <br />
            <br />
            Giá:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("gia") %>' />
            <br />
            <br />
            Mã loại món ăn:
            <asp:TextBox ID="maloaimonanTextBox" runat="server" 
                Text='<%# Bind("maloaimonan") %>' />
            <br />
            <br />
            Ảnh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
            <br />
            <br />
            Mô tả:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            mamonan:
            <asp:TextBox ID="mamonanTextBox" runat="server" Text='<%# Bind("mamonan") %>' />
            
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            mamonan:
            <asp:Label ID="mamonanLabel" runat="server" Text='<%# Eval("mamonan") %>' />
            <br />
            tenmonan:
            <asp:Label ID="tenmonanLabel" runat="server" Text='<%# Bind("tenmonan") %>' />
            <br />
            gia:
            <asp:Label ID="giaLabel" runat="server" Text='<%# Bind("gia") %>' />
            <br />
            maloaimonan:
            <asp:Label ID="maloaimonanLabel" runat="server" 
                Text='<%# Bind("maloaimonan") %>' />
            <br />
            anh:
            <asp:Label ID="anhLabel" runat="server" Text='<%# Bind("anh") %>' />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString17 %>" 
        SelectCommand="SELECT * FROM [MON_AN] whrer[mamonan]=@mamonan" 
        UpdateCommand="UPDATE [MON_AN] SET [tenmonan] = @tenmonan, [gia] = @gia, [maloaimonan] = @maloaimonan, [anh] = @anh, [mota] = @mota WHERE [mamonan] = @mamonan">
        <SelectParameters>
            <asp:QueryStringParameter Name="mamonan" Type="String" QueryStringField="mamonan" />        
       </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenmonan" Type="String" />
            <asp:Parameter Name="gia" Type="Double" />
            <asp:Parameter Name="maloaimonan" Type="String" />
            <asp:Parameter Name="anh" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
            <asp:Parameter Name="mamonan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

