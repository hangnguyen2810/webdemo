using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }

    public string kttontai()
    {
        string q = "";
        try
        {
            string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
            con = new SqlConnection(ConnectionString);
            con.Open();
            string select = "SELECT quyen FROM NHAN_VIEN WHERE manv=@tk AND matkhau=@mk";
            SqlCommand comand = new SqlCommand(select, con);
            comand.Parameters.AddWithValue("tk", txtTenDN.Text);
            comand.Parameters.AddWithValue("mk", txtMK.Text);
            SqlDataReader dataReader = comand.ExecuteReader();
            dataReader.Read();
            q = dataReader["quyen"].ToString();
            con.Close();
        }
        catch
        {
            lblThongBao.Text = " Lỗi đăng nhập. Tên đăng nhập hoặc mật khẩu sai!";
        }
        return q;
    }



    protected void btnDKi_Click(object sender, EventArgs e)
    {
        Response.Redirect("DangKy.aspx");
    }
    protected void btnDN_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)sqlDsNhanvien.Select(DataSourceSelectArguments.Empty);
        int num = dv.Count;
        if (num > 0)
        {
            NguoiDung tk = new NguoiDung();
            tk.userName = txtTenDN.Text;
            tk.password = txtMK.Text;
            Session.Add("NV", tk);
            string q = kttontai();
            if (q.Equals("1"))

                Response.Redirect("NhanVien.aspx");
            else if (q.Equals("2")) Response.Redirect("hoadon.aspx");
           

        }
        else
        {
            lblThongBao.Text = " Lỗi đăng nhập. Tên đăng nhập hoặc mật khẩu sai!";
        }

    }



}