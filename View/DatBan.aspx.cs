using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class DatBan : System.Web.UI.Page
{
     string mahoadon;
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
        cmdngay.ValueToCompare = DateTime.Now.ToString("d");

        if (Session["User"] == null)
        {
            Response.Redirect("DangNhap.aspx");
        }
        //txtngay.Text = DateTime.Now.ToString("dd/MM/yyyy");
        txtsonguoi.Attributes["type"] = "number";
        txtemail.Attributes["type"] = "email";
        txtgio.Attributes["type"] = "time";
        txtngay.Attributes["type"] = "date";
        txtdienthoai.Attributes["type"] = "phone";
    }
    protected void btnDatBan_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            try
            {
                SqlDsDonhang.InsertParameters["makh"].DefaultValue = manguoidung();
               // SqlDsDonhang.InsertParameters["maban"].DefaultValue = "";
                SqlDsDonhang.InsertParameters["manv"].DefaultValue = "";
                SqlDsDonhang.InsertParameters["ngaythang"].DefaultValue = txtngay.Text;
                SqlDsDonhang.InsertParameters["sdt"].DefaultValue = txtdienthoai.Text;
                SqlDsDonhang.InsertParameters["diachi"].DefaultValue = "";
                SqlDsDonhang.InsertParameters["tongtien"].DefaultValue = "0";
                SqlDsDonhang.InsertParameters["nguoidat"].DefaultValue = txten.Text;
                SqlDsDonhang.InsertParameters["trangthai"].DefaultValue = "Đặt bàn_Đang xử lý";
                SqlDsDonhang.InsertParameters["chuthich"].DefaultValue = txtsonguoi.Text + " người "+txtgio.Text+"giờ Y/c: " + txtyeucau.Text;
                SqlDsDonhang.InsertParameters["hinhthucthanhtoan"].DefaultValue = "Đặt bàn Online, thanh toán tại nhà hàng";
                lblLoi.Text = "Quý khách gửi yêu cầu đặt bàn thành công! Cảm ơn Quý khách. ";
                SqlDsDonhang.Insert();
                
            }
            catch (Exception ex)
            {
                lblLoi.Text = ex.Message;
            }
         
        }
        else
        {
            Response.Write("<script>alert('Bạn Phải Đăng Nhập Hệ Thống!')</script>");
        }
        clear();
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
    protected void SqlDsMonan_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        mahoadon = e.Command.Parameters["@mahoadon"].Value.ToString();
    }
    protected void SqlDsMonan_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    public void clear()
    {
        txtdienthoai.Text = "";
        txtemail.Text = "";
        txten.Text = "";
        txtngay.Text = "";
        txtsonguoi.Text = "";
        txtyeucau.Text = "";

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