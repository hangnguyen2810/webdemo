using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class LoaiMonAn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NV"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string q = manguoidung();
            // Label1.Text = q;
            if (q.Equals("2"))
            {
                Label1.Text = "Xin chào, Thu Ngân";
            }
            else Label1.Text = "Xin chào, Admin";
        }

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
      
    }
    protected void btnsearch_Click1(object sender, EventArgs e)
    {
        string txt = txtsearch.Text;
        SqlDataSource dt = new SqlDataSource();
        grdloai.DataSourceID = null;
        dt.ID = "SqlDataSource12";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG18;Integrated Security=True";
        dt.SelectCommand="select * from LOAI_MON_AN where maloaimonan LIKE'%"+txt+"%' OR tenloaimonan LIKE N'%"+txt+"%'";
        grdloai.DataSource = dt;
        grdloai.DataBind();
    }
    public string manguoidung()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["NV"];
        //truy vấn data:
        string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string select = "SELECT quyen FROM NHAN_VIEN WHERE manv=@tk AND matkhau=@mk";
        SqlCommand comand = new SqlCommand(select, con);
        comand.Parameters.AddWithValue("tk", tk.userName);
        comand.Parameters.AddWithValue("mk", tk.password);
        SqlDataReader dataReader = comand.ExecuteReader();
        dataReader.Read();
        string manguoidung = dataReader["quyen"].ToString();
        con.Close();
        return manguoidung;
    }
}