<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPageKhachHang.master" AutoEventWireup="true"
    CodeFile="~/View/CTMonAn.aspx.cs" Inherits="CTMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taikhoan" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="Server">
    <div class="content-main">
        <div class="container">
            <div class="content-inner detail-content">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="mamonan" DataSourceID="SqlDataSource1"
                    Height="206px" Width="100%" onitemcommand="FormView1_ItemCommand">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        mamonan:
                        <asp:Label ID="mamonanLabel1" runat="server" Text='<%# Eval("mamonan") %>' />
                        <br />
                        tenmonan:
                        <asp:TextBox ID="tenmonanTextBox" runat="server" Text='<%# Bind("tenmonan") %>' />
                        <br />
                        gia:
                        <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("gia") %>' />
                        <br />
                        maloaimonan:
                        <asp:TextBox ID="maloaimonanTextBox" runat="server" Text='<%# Bind("maloaimonan") %>' />
                        <br />
                        anh:
                        <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
                        <br />
                        mota:
                        <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Mã :
                        <asp:TextBox ID="mamonanTextBox" runat="server" Text='<%# Bind("mamonan") %>' />
                        <br />
                        tenmonan:
                        <asp:TextBox ID="tenmonanTextBox" runat="server" Text='<%# Bind("tenmonan") %>' />
                        <br />
                        gia:
                        <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("gia") %>' />
                        <br />
                        maloaimonan:
                        <asp:TextBox ID="maloaimonanTextBox" runat="server" Text='<%# Bind("maloaimonan") %>' />
                        <br />
                        anh:
                        <asp:TextBox ID="anhTextBox" runat="server" Text='<%# Bind("anh") %>' />
                        <br />
                        mota:
                        <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("mota") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate><div class="hoverimage">
                        <div class="float-left width30">
                         
                            <asp:Image ID="anhLabel" runat="server" ImageUrl='<%# Eval("anh","~/anhmonan/{0}") %>'
                                Width="200px" />
                        </div></div>
                        <div class="float-left width70">
                            <asp:Label ID="mamonanLabel1" runat="server" Text='<%# Eval("mamonan") %>' Visible="false" />
                      
                            <span class="text-bold">
                         
                            <asp:Label ID="tenmonanLabel" runat="server" Text='<%# Bind("tenmonan") %>' />
                            </span>
                            <br />
                            Giá:
                            <asp:Label ID="giaLabel" runat="server" Text='<%# Bind("gia") %>' />
                            <asp:Label ID="Label1" runat="server" Text=' VNĐ' />

                            <br />
                            <asp:Label ID="motaLabel" runat="server" Text='<%# Bind("mota") %>' />
                            <br /><br /><br />
                            <asp:Button ID="Datmon" CommandName="Đặt món" runat="server" Text="Đặt món" 
                                    BackColor="#C50202" Height="30px" Width="100px" />
                           
                        </div>
                        <div class="clear-fix">
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString13 %>"
                    SelectCommand="SELECT * FROM [MON_AN] WHERE ([mamonan] = @mamonan)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="none" Name="mamonan" QueryStringField="mamonan"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
        </div>
    </div>
</asp:Content>
