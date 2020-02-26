<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="QLLienHe.aspx.cs" Inherits="QLLienHe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>
        Danh sách Liên hệ</h2>
        <div class="header-main">
             <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" 
                            ToolTip="Nhập tên,sđt,email hoặc nội dung" ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" 
                            onclick="btnsearch_Click"/></li>
                    <div class="clear-both"></div>
                </ul>
            <br />
            <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="email" DataSourceID="SqlDataSource1"  
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="hoten" HeaderText="Họ tên" SortExpression="hoten" />
            <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True" 
                SortExpression="email" />
            <asp:BoundField DataField="sdt" HeaderText="Số điện thoại" 
                SortExpression="sdt" />
            <asp:BoundField DataField="noidung" HeaderText="Nội dung" 
                SortExpression="noidung" />
            <asp:TemplateField ShowHeader="False" HeaderText="Chức năng">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Sửa"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Xóa"
                        OnClientClick=" return confirm('Bạn chắc chắn muốn xóa không')"
                        ></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66"  HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6"  />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString36 %>" 
        DeleteCommand="DELETE FROM [LIEN_HE] WHERE [email] = @email" 
        InsertCommand="INSERT INTO [LIEN_HE] ([hoten], [email], [sdt], [noidung]) VALUES (@hoten, @email, @sdt, @noidung)" 
        SelectCommand="SELECT * FROM [LIEN_HE]" 
        UpdateCommand="UPDATE [LIEN_HE] SET [hoten] = @hoten, [sdt] = @sdt, [noidung] = @noidung WHERE [email] = @email">
        <DeleteParameters>
            <asp:Parameter Name="email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="hoten" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="sdt" Type="Int32" />
            <asp:Parameter Name="noidung" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="hoten" Type="String" />
            <asp:Parameter Name="sdt" Type="Int32" />
            <asp:Parameter Name="noidung" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

