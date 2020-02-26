<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SuaLoaiMonAn.aspx.cs" Inherits="SuaLoaiMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>
        Sửa loại món ăn
    </h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="maloaimonan" 
        DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="400px" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" GridLines="Both" onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            Mã loại món ăn:&nbsp;
            <asp:Label ID="maloaimonanLabel1" runat="server" 
                Text='<%# Eval("maloaimonan") %>' />
            <br />
            <br />
            Tên loại món ăn&nbsp;
            <asp:TextBox ID="tenloaimonanTextBox" runat="server" 
                Text='<%# Bind("tenloaimonan") %>' Width="200px" />
            <br />
            <br />
            Mô tả&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox TextMode="MultiLine" Style="width: 200px; height: 100px;" ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' 
                Height="29px" Width="244px" />
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
            maloaimonan&nbsp;
            <asp:TextBox ID="maloaimonanTextBox" runat="server" 
                Text='<%# Bind("maloaimonan") %>' />
            <br />
            tenloaimonan&nbsp;
            <asp:TextBox ID="tenloaimonanTextBox" runat="server" 
                Text='<%# Bind("tenloaimonan") %>' />
            <br />
            mota&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' />
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblloi" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString16 %>" 
        
        
        SelectCommand="SELECT * FROM [LOAI_MON_AN] where [maloaimonan] = @maloaimonan" 
        UpdateCommand="UPDATE [LOAI_MON_AN] SET [tenloaimonan] = @tenloaimonan, [mota] = @mota WHERE [maloaimonan] = @maloaimonan">
       <SelectParameters>
            <asp:QueryStringParameter Name="maloaimonan" Type="String" QueryStringField="maloaimonan" />        
       </SelectParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="tenloaimonan" Type="String" />
            <asp:Parameter Name="mota" Type="String" />
            <asp:Parameter Name="maloaimonan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div><a href="LoaiMonAn.aspx">Quay lại</a></div>
</asp:Content>

