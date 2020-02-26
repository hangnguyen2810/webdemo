using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class LichSu : System.Web.UI.Page
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
        SqlDataSource dt = new SqlDataSource();
        string mand = "";
        mand = manguoidung();
        GrLichSu.DataSourceID = null;
        dt.ID = "SqlDataSource121";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select * from HOA_DON where makh='" + mand + "'";

        GrLichSu.DataSource = dt;
        GrLichSu.DataBind();

    }
    public string email()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["User"];
        string email = tk.userName.ToString();
        return email;
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
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string txt = txtsearch1.Text;
        SqlDataSource dt = new SqlDataSource();
        GrLichSu.DataSourceID = null;
        dt.ID = "SqlDataSource1212";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select * from HOA_DON where mahoadon like'%" + txt + "%' or ngaythang like '%" + txt + "%'where makh like '%" + txt + "'%";
        GrLichSu.DataSource = dt;
        GrLichSu.DataBind();
    }
    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {

    }
}