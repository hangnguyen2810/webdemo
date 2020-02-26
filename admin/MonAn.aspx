<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="MonAn.aspx.cs" Inherits="MonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" Runat="Server">
    <h2>
    Danh sách món ăn
</h2>
<div class="header-main">
        <asp:Button ID="ThemMonAn" runat="server" Text="Thêm mới" 
            PostBackUrl="~/admin/ThemMonAn.aspx"/>
        <ul class="search">
                    <li><asp:TextBox ID="txtsearch" runat="server" ToolTip="Nhập mã hoặc tên" ></asp:TextBox></li>
                    <li><asp:Button ID="btnsearch" runat="server" Text="search" 
                            onclick="btnsearch_Click" /></li>
                </ul>
        <div class="clear-both">
        </div>
    </div>
    <br />
    <asp:GridView ID="grdds" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="mamonan" 
        DataSourceID="SqlDataSource1" CellPadding="4"  
    GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Mã món ăn" InsertVisible="false" SortExpression="mamonan">
                <EditItemTemplate> <asp:Label ID="mamonan" runat="server" Text='<%# Eval("mamonan") %>' Style="width: 100px" /></EditItemTemplate>
                <ItemTemplate><asp:Label ID="label121" runat="server" Text='<%# Bind("mamonan") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên món ăn" InsertVisible="false" SortExpression="tenmonan">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tenmonan") %>' TextMode="MultiLine" Style="width: 100px; height: 100px;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Phải nhập tên sản phẩm" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate><asp:Label ID="label11" runat="server" Text='<%# Bind("tenmonan") %>'></asp:Label></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá" SortExpression="gia">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("gia") %>' TextMode="MultiLine" Style="width: 100px; height: 100px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phải nhập giá" ControlToValidate="TextBox6" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Giá phải là số" ControlToValidate="TextBox6" ForeColor="Red" Operator="DataTypeCheck" Type="Double" Display="Dynamic"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate><asp:Label ID="label2" runat="server" Text='<%# Bind("gia") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText = "Mã loại món ăn" SortExpression="maloaimonan">
                <EditItemTemplate><asp:TextBox ID="maloaimonan" runat="server" Text='<%# Bind("maloaimonan") %>' /></EditItemTemplate>
                <ItemTemplate><asp:Label ID="label3" runat="server" Text='<%# Bind("maloaimonan") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh">
                <EditItemTemplate>
                    <asp:FileUpload ID="fileloadhinhanh" runat="server" /><br />
                    <asp:TextBox ID="hinhanh" runat="server" Text='<%# Bind("anh") %>' TextMode="MultiLine" Style="Width: 0px; height:0px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="anh" runat="server" ImageUrl='<%# Eval("anh","~/anhmonan/{0}") %>' Width="200px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả" SortExpression="mota">
                <EditItemTemplate><asp:TextBox ID="mota" runat="server" TextMode="MultiLine" Width="300px" height="100px" Text='<%# Bind("mota") %>' /></EditItemTemplate>
                <ItemTemplate><asp:Label ID="label8" runat="server" Text='<%# Bind("mota") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="Chức Năng">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Xóa" OnClientClick= "return confirm('Ban có chac muon xoa khong?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="true" EditText="Sửa" />
                     </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6"  />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString23 %>" 
        DeleteCommand="DELETE FROM [MON_AN] WHERE [mamonan] = @mamonan" 
        InsertCommand="INSERT INTO [MON_AN] ([mamonan], [tenmonan], [gia], [maloaimonan], [anh], [mota]) VALUES (@mamonan, @tenmonan, @gia, @maloaimonan, @anh, @mota)" 
        SelectCommand="SELECT * FROM [MON_AN]" 
        UpdateCommand="UPDATE [MON_AN] SET [tenmonan] = @tenmonan, [gia] = @gia, [maloaimonan] = @maloaimonan, [anh] = @anh, [mota] = @mota WHERE [mamonan] = @mamonan">
        <DeleteParameters>
            <asp:Parameter Name="mamonan" Type="String" />
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
            <asp:Parameter Name="mamonan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

