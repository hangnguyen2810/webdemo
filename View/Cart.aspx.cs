using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
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
    
        //Laygio han tu Sesion
        ShoppingCart aCart;
        if (Session["Cart"] == null)//Neu chua co gio hang
        {
            aCart = new ShoppingCart();//tao gio hang moi


        }
        else
        {
            aCart = (ShoppingCart)Session["Cart"];

        }
        if (!IsPostBack)
        {
            //Hien thi du lieu tu gio hang voa luoi
            BindGrid(aCart);//Ham thu tu viet ben duoi
        }

    }
        //Ham Binding du lieu vao GridView
        public void BindGrid(ShoppingCart aCart)
        {
            //Lay DataSource cua GridView la cac Item cua gio hang
            grGioHang.DataSource = aCart.Items;
            grGioHang.DataBind();
            lblTongtien.Text = "Tổng tiền: " + aCart.TongTien.ToString() + "VNĐ";
        }


        protected void grGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);//Lay chi so cua dong duoc chon
                //Lay ma mon
                string ma = Convert.ToString(grGioHang.Rows[rowIndex].Cells[0].Text);
                //lay so luong
                TextBox txtsoluong = (TextBox)(grGioHang.Rows[rowIndex].FindControl("txtsoluong"));
                int soluong = Convert.ToInt32(txtsoluong.Text);
                //Lay tu gio hang Session
                ShoppingCart aCart;
                if (Session["Cart"] == null)//Neu chua co gio hang
                {
                    aCart = new ShoppingCart();//tao gio moi

                }
                else
                {
                    aCart = (ShoppingCart)Session["Cart"];
                }
                //Tim vi tri hang trong gio
                int rowID = aCart.getIndex(ma);
                //Cap nhat so luong
                aCart.UpdateItem(rowID, soluong);
                //cap nhat GridView
                BindGrid(aCart);
                //Dat lai vao Session
                Session["Cart"] = aCart;
            }
                


        }
        protected void btnXoagiohang_Click(object sender, EventArgs e)
        {
            //Xoa session
            Session.Remove("Cart");
            lblTongtien.Text = "";
            //Chuyen den trang gio hang
            Response.Redirect("Cart.aspx");

        }
        protected void btntieptuc_Click(object sender, EventArgs e)
        {
            //Chuyen den trang DSMonDat
            Response.Redirect("DsMonDat.aspx");

        }
        protected void btnThanhtoan_Click(object sender, EventArgs e)
        {
           //Chuyuen den trang OrderInfor
           // Response.Redirect("Checkout.aspx");
            if (Session["User"] != null)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                Response.Redirect("DangNhap.aspx");
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
}