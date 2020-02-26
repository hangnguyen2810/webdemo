using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class KhachHang : System.Web.UI.Page
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

    protected void btnsearch_Click(object sender, EventArgs e) { 
        
        string txt = txtsearch.Text;
        SqlDataSource dt = new SqlDataSource();
        grdDS.DataSourceID = null;
        dt.ID = "SqlDataSource2";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select * from KHACH_HANG where sdt LIKE '%" + txt + "%' OR hoten LIKE N'%" + txt + "%' or makh LIKE '%" + txt + "%' ";
        grdDS.DataSource = dt;
        grdDS.DataBind();

        
    }

    protected void themsv_Click(object sender, EventArgs e)
    {

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
    protected void grdDS_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int makh = (int)grdDS.DataKeys[e.RowIndex].Value;
        
    }
    protected void grdDS_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
    }
    protected void grdDS_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    }
    protected void grdDS_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdDS.EditIndex = e.NewEditIndex;
        //DataBind();
    }
}