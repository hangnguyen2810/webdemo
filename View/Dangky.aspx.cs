using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Dangky : System.Web.UI.Page
{
    SqlConnection con;
    string constr = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(constr);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ccJoin.ValidateCaptcha(TextBox1.Text);
              
        string msg = returnScalar("select COUNT(*) from KHACH_HANG where email ='" + txtemail.Text + "'");
        if (msg.Equals("1"))
        {
            Response.Write("<script>alert('Bạn đã có tài khoản.')</script>");
            return;
        }
        else if (!ccJoin.UserValidated)
        {
            lblLoi.Text = "";
            Label1.Text = "Mã bảo vệ chưa chính xác";
            return;
        }
        else
        {
            con.Open();
            try
            {
                string sql = "insert into KHACH_HANG values(@matkhau ,@hoten ,@gioitinh,@ngaysinh,@sdt,@email ,@diachi)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("matkhau", txtMatkhau.Text);
                cmd.Parameters.AddWithValue("hoten", txtHoten.Text);
                cmd.Parameters.AddWithValue("gioitinh", txtGioiTinh.Text);
                cmd.Parameters.AddWithValue("ngaysinh", txtNgaySinh.Text);
                cmd.Parameters.AddWithValue("sdt", int.Parse(txtDt.Text));
                cmd.Parameters.AddWithValue("email", txtemail.Text);
                cmd.Parameters.AddWithValue("diachi", txtDc.Text);
                cmd.ExecuteNonQuery();
                Label1.Text = "";
                lblLoi.Text = "Đăng Ký Thành Công!";
            }
            catch (Exception ex)
            {
                lblLoi.Text = ex.Message;
            }


            con.Close();
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtDc.Text = "";
        txtDt.Text = "";
        txtemail.Text = "";
        txtNgaySinh.Text = "";
        txtGioiTinh.Text = "";
        txtMatkhau.Text = "";
        txtHoten.Text = "";

    }
    
    public string returnScalar(string q)
    {
        string Sqlcon = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        con = new SqlConnection(Sqlcon);
        con.Open();
        SqlCommand cmd = new SqlCommand(q, con);
        string s = cmd.ExecuteScalar().ToString();
        
        con.Close();
        return s;
    }
}