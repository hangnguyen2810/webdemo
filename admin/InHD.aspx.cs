using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Configuration;

public partial class admin_InHD : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        getdata();
    }

    public void getdata()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NHAHANG19ConnectionString27"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select maban,tenmonan,soluong,gia,soluong*gia as'thanhtien' from CT_HOA_DON join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan join HOA_DON on HOA_DON.mahoadon=CT_HOA_DON.mahoadon where trangthai=N'Đang ăn' and HOA_DON.mahoadon='" + DetailsView1.Rows[0].Cells[1].Text + "'", con);
        DataTable dt = new DataTable("table4");
        da.Fill(dt);
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportCTHD.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        //ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter1", txtmaban.Text) });
        if (DetailsView1.Rows[1].Cells[1].Text.Equals("&nbsp;") && DetailsView1.Rows[2].Cells[1].Text.Equals("&nbsp;"))
        {
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter1", "") });
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter2", "") });

        }
        else
        {
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter1", DetailsView1.Rows[1].Cells[1].Text.ToString()) });
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter2", DetailsView1.Rows[2].Cells[1].Text.ToString()) });
        }
        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
        ReportViewer1.LocalReport.Refresh();
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