using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CTMonAn : System.Web.UI.Page
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
    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Đặt món")
        {
            FormViewRow row = FormView1.Row;
            string ma = ((Label)row.FindControl("mamonanLabel1")).Text;
            //string ma = "M103";
            decimal gia = Decimal.Parse(((Label)row.FindControl("giaLabel")).Text);
            string ten = ((Label)row.FindControl("tenmonanLabel")).Text;
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
            acart.InsertItem(ma, ten, gia, 1);
            //dat lai vao session
            Session["cart"] = acart;
            //chuyen den trang gio hang
            Response.Redirect("Cart.aspx");
        }
    }
}