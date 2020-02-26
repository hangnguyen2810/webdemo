using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public int kttontai()
    {
        int sl=0;
        try
        {
            string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();
            string select = "SELECT count(*) as'sl' FROM KHACH_HANG WHERE email=@tk AND matkhau=@mk";
            SqlCommand comand = new SqlCommand(select, con);
            comand.Parameters.AddWithValue("tk", txtTenDN.Text);
            comand.Parameters.AddWithValue("mk", txtMK.Text);
            SqlDataReader dataReader = comand.ExecuteReader();
            dataReader.Read();
            sl =Int16.Parse(dataReader["sl"].ToString());
            con.Close();
        }
        catch
        {
            lblThongBao.Text = " Lỗi đăng nhập. Tên đăng nhập hoặc mật khẩu sai!";
        }
        return sl;
    }

    protected void btnDN_Click(object sender, EventArgs e)
    {
        
        DataView dv = (DataView)sqlDsNguoiDung.Select(DataSourceSelectArguments.Empty);
        int num = dv.Count;
        if (num > 0)
        {
            NguoiDung tk = new NguoiDung();
            tk.userName = txtTenDN.Text;
            tk.password = txtMK.Text;
            Session.Add("User", tk);
            int solg = kttontai();
            if (solg > 0)

                Response.Redirect("Checkout.aspx");
            //lblThongBao.Text = Quyen;


            else
            {
                lblThongBao.Text = " Lỗi đăng nhập. Tên đăng nhập hoặc mật khẩu sai!";
            }
        }
    }


    protected void btnDKi_Click(object sender, EventArgs e)
    {
        Response.Redirect("DangKy.aspx");
    }
}