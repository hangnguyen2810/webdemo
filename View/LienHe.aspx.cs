using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
public partial class LienHe : System.Web.UI.Page
{
    SqlConnection con;
    string constr = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";

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
        con = new SqlConnection(constr);
    }
    public string email()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["User"];
        string email = tk.userName.ToString();
        return email;
    }
    protected void btngui_Click(object sender, EventArgs e)
    {
         con.Open();
        try
        {
            string sql = "insert into LIEN_HE values(@hoten,@email,@sdt,@noidung)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("hoten", txthoten.Text);
            cmd.Parameters.AddWithValue("email", txtemail.Text);
            cmd.Parameters.AddWithValue("sdt", txtsdt.Text);
            cmd.Parameters.AddWithValue("noidung", txtnoidung.Text);
            cmd.ExecuteNonQuery();
            lblLoi.Text = "Gửi liên hệ Thành Công!";
            btnhuy_Click(sender, e);
        }
        catch (Exception ex)
        {
            lblLoi.Text = ex.Message;
        }


        con.Close();
    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        txtemail.Text = "";
        txthoten.Text = "";
        txtnoidung.Text = "";
        txtsdt.Text = "";
    }
}