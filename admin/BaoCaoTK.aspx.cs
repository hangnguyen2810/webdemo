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
public partial class admin_BaoCaoTK : System.Web.UI.Page
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
        
        SqlDataSource dt1 = new SqlDataSource();
        Grtop.DataSourceID = null;
        dt1.ID = "SqlDataSource211";
        dt1.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt1.SelectCommand = "Select Top(3)tenmonan as'Món ăn' ,SUM(soluong) as 'Số Lượt Đặt'from CT_HOA_DON INNER join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan group by(tenmonan) order by [Số Lượt Đặt] desc ";
        Grtop.DataSource = dt1;
        Grtop.DataBind();

        txtngayBD.Attributes["type"] = "Date";
        txtngayKT.Attributes["type"] = "Date";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtngayBD.Text.Equals("") || txtngayKT.Text.Equals(""))
        {
            Label2.Text = "Bạn cần chọn ngày thống kê";
        }
        else
        {
            Label2.Text = "";
            getdata();
        }
    }
    public void getdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NHAHANG19ConnectionString27"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select HOA_DON.mahoadon,tennv,ngaythang,HOA_DON.sdt,tongtien,nguoidat,trangthai from HOA_DON left join NHAN_VIEN on HOA_DON.manv=NHAN_VIEN.manv where ngaythang >= '" + txtngayBD.Text + "' and ngaythang <= '" + txtngayKT.Text + "'", con);

        DataTable dt = new DataTable("table2");
        da.Fill(dt);
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportBCTK.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter1", txtngayBD.Text) });
        ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { new ReportParameter("ReportParameter2", txtngayKT.Text) });
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