<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Thembanan.aspx.cs" Inherits="Thembanan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>Thêm bàn ăn</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="maban" 
        DataSourceID="SqlDataSource1" DefaultMode="Insert" oniteminserted="InsertedCmd" 
        Width="300px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" GridLines="Both">
        <EditItemTemplate>
            maban:
            <asp:Label ID="mabanLabel1" runat="server" Text='<%# Eval("maban") %>' />
            <br />
            socho:
            <asp:TextBox ID="sochoTextBox" runat="server" Text='<%# Bind("socho") %>' />
            <br />
            trangthai:
            <asp:TextBox ID="trangthaiTextBox" runat="server" 
                Text='<%# Bind("trangthai") %>' />
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
            Mã bàn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mabanTextBox" runat="server" Text='<%# Bind("maban") %>' 
                Width="200px" />
            <asp:RequiredFieldValidator ID="ma" ControlToValidate="mabanTextBox" ForeColor="Red" ErrorMessage="Mã bàn ăn bắt buộc phải nhập" runat="server" />
            <br />
            <br />
            Số chỗ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sochoTextBox" runat="server" Text='<%# Bind("socho") %>' 
                Width="200px" />
            <asp:RangeValidator ID="Socho" ControlToValidate="sochoTextBox" Type="Integer" ErrorMessage="Số chỗ phải là số" ForeColor="Red" runat="server" MinimumValue="1" MaximumValue="50" />
            <br />
            <br />
            Trạng thái:&nbsp;&nbsp;
             <asp:TextBox ID="txttrangthai" runat="server" Text='<%# Bind("trangthai") %>' 
                Width="200px" />
            
            <br />
            <br />
            
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            maban:
            <asp:Label ID="mabanLabel" runat="server" Text='<%# Eval("maban") %>' />
            <br />
            socho:
            <asp:Label ID="sochoLabel" runat="server" Text='<%# Bind("socho") %>' />
            <br />
            trangthai:
            <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Bind("trangthai") %>' />
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
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString19 %>" 
        DeleteCommand="DELETE FROM [BAN_AN] WHERE [maban] = @maban" InsertCommand="INSERT INTO [BAN_AN] ([maban], [trangthai], [socho]) VALUES (@maban, @trangthai, @socho)"
         SelectCommand="SELECT * FROM [BAN_AN]" 
        
        UpdateCommand="UPDATE [BAN_AN] SET [socho] = @socho, [trangthai] = @trangthai WHERE [maban] = @maban">
        <DeleteParameters>
            <asp:Parameter Name="maban" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="maban" Type="String" />
            <asp:Parameter Name="socho" Type="Int32" />
            <asp:Parameter Name="trangthai" Type="Boolean" />
          
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="socho" Type="Int32" />
            <asp:Parameter Name="trangthai" Type="Boolean" />
            <asp:Parameter Name="maban" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <a href="BanAn.aspx">Bàn ăn</a>
    <br />
    <br />
    <br />
    <asp:Label ID="errmg" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

