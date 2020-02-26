<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="GuiEmail.aspx.cs" Inherits="admin_GuiEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            font-weight: normal;
        }
        .style4
        {
            font-weight: normal;
            width: 65px;
        }
        .style5
        {
            width: 65px;
        }
        .style6
        {
            font-weight: normal;
            width: 65px;
            height: 42px;
        }
        .style7
        {
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="taikhoan" runat="Server">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="Server">
   
    <h2 style="text-align: center; color: #CC0000; font-size: xx-large;">
        Gửi Thư Cảm Ơn
    </h2>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image1" runat="server" Height="113px" 
        ImageUrl="~/anhmonan/anhcamon.jpg" Width="392px" />
    
    <asp:DetailsView ID="DetailsView1" runat="server" Height="57px" Width="325px" AutoGenerateRows="False"
        DataKeyNames="mahoadon" DataSourceID="SqlDataSource1" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="mahoadon" HeaderText="mahoadon" InsertVisible="False"
                ReadOnly="True" SortExpression="mahoadon" Visible="false" />
            <asp:BoundField DataField="makh" HeaderText="" SortExpression="makh" Visible="false" />
            <asp:BoundField DataField="email" HeaderText="Email KH" SortExpression="makh" />
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NHAHANG19ConnectionString39 %>"
        SelectCommand="SELECT [mahoadon],KHACH_HANG.[makh],email FROM [HOA_DON] inner join KHACH_HANG on KHACH_HANG.makh=HOA_DON.makh WHERE ([mahoadon] = @mahoadon)">
        <SelectParameters>
            <asp:QueryStringParameter Name="mahoadon" QueryStringField="mahoadon" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table id="Table1" runat="server">
        <tr>  <td class="style6">
                Từ
            </td>
            <td class="style7">
                <asp:TextBox ID="from" runat="server" Text="nhahanghatoyama@gmail.com" 
                    Width="196px" Height="30px"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
           <td class="style4">
                Tới
            </td>
            <td>
                <asp:TextBox ID="to" runat="server" Text="" Width="197px" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Tiêu đề
            </td>
            <td>
                <asp:TextBox ID="subject" runat="server" Text="Thư cảm ơn" Width="195px" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Nội dung
            </td>
            <td>
                <asp:TextBox ID="body" runat="server" Text="" TextMode="MultiLine" Height="295px" Width="443px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Gửi" OnClick="Button1_Click" BackColor="#C50202"
                    BorderStyle="Double" Height="35px" Width="85px" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style3">
                <asp:Label ID="status" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
