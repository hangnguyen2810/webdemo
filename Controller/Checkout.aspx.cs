using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Checkout : System.Web.UI.Page
{
    string mahoadon;
    protected void Page_Load(object sender, EventArgs e)
    {

        //Lay gio hang tu Session
        ShoppingCart aCart;
        if (Session["Cart"] == null)//Chua co gio hang
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
        //Thiet lap cac dieu khien o phan thong tin thanh toan
        DropDownList1.Enabled = false;
        txtmathe.Enabled = false;
        chkTructiep.AutoPostBack = true;


    }
    public void BindGrid(ShoppingCart aCart)
    {
        //Lay datasource cua gridview la cac Items cua gio hang
        grvdsdat.DataSource = aCart.Items;
        grvdsdat.DataBind();
        if (aCart.TongTien > 500000)
        {
            lblPhiship.Text = "Phí Vận Chuyển: Miễn Phí";
            lblTongTien.Text = "Tổng tiền: " + aCart.TongTien.ToString() + " VNĐ";
        }
        else
        {
            lblPhiship.Text = "Phí Ship: 30,000 VNĐ";
            lblTongTien.Text = "Tổng tiền: " + (aCart.TongTien+30000).ToString() + " VNĐ";
        }

    }

    protected void chkTructiep_CheckedChanged(object sender, EventArgs e)
    {
        if (chkTructiep.Checked)
        {
            //Neu chon thanh toan khi nhan hang thi se an phan nhap thong tin the thanh toan 
            DropDownList1.Enabled = false;
            txtmathe.Enabled = false;
        }
        else
        {
            //Bo chon thanh toan khi nhan hang thi se hien phan nhap thong tin the thanh toan
            DropDownList1.Enabled = true;
            txtmathe.Enabled = true;
        }
    }
    protected void SqlDsMonan_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //Lay ma don  hang duoc sinh ra tu dong cua ban ghi vua duoc chen vao
        mahoadon =e.Command.Parameters["@mahoadon"].Value.ToString();
    } 
    protected void btnDatHang_Click(object sender, EventArgs e)
    {
        //Lay gio hang tu Session
        ShoppingCart aCart;
        if (Session["Cart"] != null)
        {
            aCart = (ShoppingCart)Session["Cart"];
            //thiet lap gia tri chi cac tham bien cua don hang
            SqlDsDonhang.InsertParameters["makh"].DefaultValue = manguoidung();
            //SqlDsDonhang.InsertParameters["maban"].DefaultValue = "";
            SqlDsDonhang.InsertParameters["ngaythang"].DefaultValue = DateTime.Now.ToShortDateString();
            SqlDsDonhang.InsertParameters["sdt"].DefaultValue = txtdt.Text;
            SqlDsDonhang.InsertParameters["diachi"].DefaultValue = txtdc.Text;
            SqlDsDonhang.InsertParameters["tongtien"].DefaultValue = aCart.TongTien.ToString();
            SqlDsDonhang.InsertParameters["nguoidat"].DefaultValue = txtTenNguoiNhan.Text;
            SqlDsDonhang.InsertParameters["trangthai"].DefaultValue = "Ship_Đang xử lý";
            SqlDsDonhang.InsertParameters["chuthich"].DefaultValue = "";
            
            if (chkTructiep.Checked)
            {
                SqlDsDonhang.InsertParameters["hinhthucthanhtoan"].DefaultValue = "Trả tiền mặt khi nhận hàng";
            }
            else
            {
               SqlDsDonhang.InsertParameters["hinhthucthanhtoan"].DefaultValue = "Chuyển khoản ngân hàng";
          }
            try
            {
                //Chen 1 dong vao bang don hang
                SqlDsDonhang.Insert();
                //Chen cac hi tiet don hang vao bang chi tiet hoa don bang vong lap 
                foreach (var item in aCart.Items)
                {
                    //Thiet lap ca gia tri chi cac tham bien cua 1 chi tiet hoa don 
                    //ma hoa don la bien toan cuc
                    SqlDschitietdon.InsertParameters["mahoadon"].DefaultValue = mahoadon;
                    SqlDschitietdon.InsertParameters["maban"].DefaultValue = "";
                    SqlDschitietdon.InsertParameters["mamonan"].DefaultValue = item.mamon;
                    SqlDschitietdon.InsertParameters["soluong"].DefaultValue = item.soluong.ToString();
                    //Chen 1 dong vao bang chi tiet hoa don
                    SqlDschitietdon.Insert();
                }
                //Xoa gio hang
                Session.Remove("Cart");
                //Dat hang thanh cong chuyen den trang thong tin don hang kem theo mahoadon
                Response.Redirect("OrderInfor.aspx?mahoadon=" + mahoadon);

            }
            catch (Exception ex)
            {
                //hien thi thong bao khong thanh cong
                lblThongBao.Text = "Đặt món ăn thất bại.Lỗi: " + ex.Message;
            }

        }
    }
    
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDsMonan_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void grvdsdat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public string manguoidung()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["User"];
        //truy vấn data:
        string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string select = "SELECT makh FROM KHACH_HANG WHERE email=@tk AND matkhau=@mk";
        SqlCommand comand = new SqlCommand(select, con);
        comand.Parameters.AddWithValue("tk", tk.userName);
        comand.Parameters.AddWithValue("mk", tk.password);
        SqlDataReader dataReader = comand.ExecuteReader();
        dataReader.Read();
        string manguoidung = dataReader["makh"].ToString();
        con.Close();
        return manguoidung;
    }
    protected void SqlDschitietdon_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}