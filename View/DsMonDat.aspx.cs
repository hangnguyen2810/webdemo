using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DsMonDat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Label1.Text = email();
        }
        else
        {
            Label1.Text = "";
        }
    }
    public string email()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["User"];
        string email = tk.userName.ToString();
        return email;
    }
    string gia;

    /*protected void drMondat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowindex = Convert.ToInt32(e.CommandArgument);
        string ma = grMondat.Rows[rowindex].Cells[0].Text;
        string ten = grMondat.Rows[rowindex].Cells[1].Text;
        int gia = Convert.ToInt32(grMondat.Rows[rowindex].Cells[2].Text);

        ShoppingCart acart;
        if (Session["cart"] == null)//neu chua co gio hang
        {
            acart = new ShoppingCart();//tao gio hang moi
        }
        else
        {
            acart = (ShoppingCart)Session["cart"];

        }
        //them vao gio hang
        acart.InsertItem(ma, ten, gia,1);
        //dat lai vao session
        Session["cart"] = acart;
        //chuyen den trang gio hang
        Response.Redirect("Cart.aspx");
    }
    */

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Đặt món")
        {
            string ma = ((Label)e.Item.FindControl("mamonanLabel")).Text;
            //string ma1 = ma.Text;
            decimal gia = Decimal.Parse(((Label)e.Item.FindControl("giaLabel")).Text);
            string ten = ((Label)e.Item.FindControl("tenmonanLabel")).Text;
            ShoppingCart acart;
            if (Session["cart"] == null)//neu chua co gio hang
            {
                acart = new ShoppingCart();//tao gio hang moi
            }
            else
            {
                acart = (ShoppingCart)Session["cart"];

            }
            //them vao gio hang
            acart.InsertItem(ma, ten,gia,1);
            //dat lai vao session
            Session["cart"] = acart;
            //chuyen den trang gio hang
            Response.Redirect("Cart.aspx");
        }
    }
    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        gia = DropDownList1.SelectedValue.ToString();
        SqlDataSource dt = new SqlDataSource();
        DataMon.DataSourceID = null;
        dt.ID = "SqlDataSource1218";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select anh,mamonan,tenmonan,gia from MON_AN where gia<"+gia+"";
        DataMon.DataSource = dt;
        DataMon.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gia = DropDownList1.SelectedValue.ToString();
    }
}