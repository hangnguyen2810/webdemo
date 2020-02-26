using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class admin_TKngay_thang : System.Web.UI.Page
{
    string constr = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
   
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

    protected void btnThang_Click1(object sender, EventArgs e)
    {
        ReportViewer1.Reset();
        DataTable dt = GetData1();
        ReportDataSource ds = new ReportDataSource("DataSet1", dt);
        ReportViewer1.LocalReport.DataSources.Add(ds);
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("Reporthongketuan.rdlc");
        ReportViewer1.LocalReport.Refresh();
    }
    private DataTable GetData1()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("doanhthu_tuan", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        return dt;

    }
    protected void Ngay_Click(object sender, EventArgs e)
    {
        ReportViewer1.Reset();
        DataTable dt = GetData2();
        ReportDataSource ds = new ReportDataSource("DataSet4", dt);
        ReportViewer2.LocalReport.DataSources.Add(ds);
        ReportViewer2.LocalReport.ReportPath = Server.MapPath("ReportNgay.rdlc");
        ReportViewer2.LocalReport.Refresh();
    }
    private DataTable GetData2()
    {
        DataTable dt = new DataTable("table5");
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("doanhthu_ngay", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        return dt;

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